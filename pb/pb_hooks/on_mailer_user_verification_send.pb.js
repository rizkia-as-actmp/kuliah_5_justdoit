/// <reference path="../pb_data/types.d.ts" />
onMailerRecordVerificationSend(async (e) => {
  // onMailerRecordVerificationSend adalah hook yang dipanggil sesaat sebelum pocketbase mengirimkan email verifikasi
  // disini saya tidak ingin token verifikasi langsung dikirimkan pada user
  // melainkan saya akan menyimpannya dulu di database
  // setelah user melakukan Pembayaran untuk registrasi, payment gateway akan mengirim request pada API saya untuk melakukan callback
  // pada request callback itulah sistem akan menentukan apakah user akan diverikasi atau tidak menggunakan data request dari payment gateway dan token yang disimpan

  const tp = require(`${__hooks}/lib/tripay.js`) // cara melakukan import module didalam extend function pocketbase
  const fail = require(`${__hooks}/lib/custom-error.js`)
  const email = require(`${__hooks}/utils/email.js`)
  const random = require(`${__hooks}/utils/random.js`)

  // $app adalah instance dari pocketbase yang berjalan yang tersedia secara global pada seluruh file yang berextensi .pb.js 
  const userRecord = $app.findAuthRecordByToken(e.meta.token) // mencari authRecord dalam konteks ini adalah record user menggunakan token jwt nya
  const paymentMethod = $os.getenv("PAYMENT_METHOD")
  const pocketbaseBaseUrl = $os.getenv("POCKETBASE_BASE_URL")
  const regFee = parseInt($os.getenv("USER_REGISTRATION_FEE"))
  const regCode = random.generateRegistrationCode()

  const orderItems = [
    {
      name: "Registration fee",
      price: regFee,
      quantity: 1
    }
  ]
  let tpResponse
  try {
    tpResponse = await tp.closedTransaction(
      paymentMethod,
      regCode,
      regFee,
      userRecord.getString("name"),
      userRecord.getString("email"),
      orderItems,
      `${pocketbaseBaseUrl}/extend/api/collections/users/update-verification-callback`,
      ""
    )

  } catch (error) {
    if (error instanceof fail.FailError) {
      console.log(JSON.stringify(error.message))
      $app.logger().error(JSON.stringify(error.message)) // $app.logger() digunakan untuk menulis logs yang nantinya bisa dibaca di dashboard admin pocketbase
    }
    console.log(JSON.stringify(error))
    $app.logger().error(JSON.stringify(error))
    throw new fail.FailError(error)
  }

  // cara membuat record baru di pocketbase extend function
  // disini saya mau membuat record registrasi untuk menyimpan token verifikasi
  const regCol = $app.findCollectionByNameOrId("registrations") // mencari data collection untuk collection registratins
  const regRecord = new Record(regCol)
  regRecord.set("registration_code", regCode)
  regRecord.set("verification_token", e.meta.token)
  regRecord.set("user", userRecord.id)
  $app.save(regRecord);

  // melakukan overrride pada email HTML yang dikirim ke user
  e.message.html = email.registrationEmail(tpResponse.amount, tpResponse.qr_url, e.mailer.username)
  // melakukan overrride pada token yang akan dikirim ke user
  // // disini saya tidak ingin token tersebut langsung dikirim keuser
  e.meta.token = ""
  // melakukan overrride subject email
  e.message.subject = "Aktivasi Akun - Segera Selesaikan Pembayaran"

  e.next() // kita bisa melakukan throw error atau tidak memanggil e.next() untuk menghentikan proses-proses setelah ini dari verifikasi
})
