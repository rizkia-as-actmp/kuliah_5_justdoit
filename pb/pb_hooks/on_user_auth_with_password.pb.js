/// <reference path="../pb_data/types.d.ts" />
onRecordAuthWithPasswordRequest((e) => {
  const email = require(`${__hooks}/utils/email.js`)

  // cek apakah email dan password benar
  if (!e.record || !e.record.validatePassword(e.password)) {
    throw new ForbiddenError("Email and/or password are incorrect");
  }

  // cek apakah akun sudah terverifikasi
  if (!e.record.verified()) {
    throw new ForbiddenError("Unauthorized: You do not have permission to perform this action");
  }

  const userRec = e.record
  const randomNumber = Math.floor(1000 + Math.random() * 9000);


  // membuat record OTP menggunakan default implementation untuk OTP dari pocketbase
  const otpCollection = $app.findCollectionByNameOrId("_otps")
  const otpRec = new Record(otpCollection)
  otpRec.set("collectionRef", e.collection.id)
  otpRec.set("recordRef", userRec.id)
  otpRec.set("password", randomNumber)
  $app.save(otpRec);

  // kirim kode OTP ke user
  const userEmail = userRec.email()
  const emailSubject = "Kode OTP Anda untuk Verifikasi Akun"
  const otpId = otpRec.id

  try {
    const message = new MailerMessage({
      from: {
        address: $app.settings().meta.senderAddress,
        name: $app.settings().meta.senderName,
      },
      to: [{ address: userEmail }],
      subject: emailSubject,
      html: email.otpEmail(randomNumber, $app.settings().meta.senderAddress),
    })

    $app.newMailClient().send(message)
  } catch (error) {
    console.log(JSON.stringify(error))
    $app.logger().warn(JSON.stringify(error))
    $app.logger().warn(
      "Failed to send otp email.",
      "otp_id", otpId,
      "destination_email_address", userEmail,
    )
    throw new ApiError(500)
  }

  return e.json(200, { otpId: otpId }) // override execution chain dengan langsung return 
  e.next() // mencegah pocketbase untuk memproses lebih lanjut execution chain dan mengirim token kepada user
}, "users")

