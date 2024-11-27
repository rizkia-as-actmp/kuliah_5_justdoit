/// <reference path="../pb_data/types.d.ts" />
// kita override default function dari pocketbase untuk menangani konfirmasi verifikasi user
// kita tidak ingin client menggunakan method ini, sehingga disini kita langsung return status code Forbiden saja
// lalu  kita matikan e.next() untuk memastikan function selanjutnya dari function ini tidak dijalankan
onRecordConfirmVerificationRequest((e) => {
  console.log(JSON.stringify("forbiden method : onRecordConfirmVerificationRequest"))
  $app.logger().error(JSON.stringify("forbiden method : onRecordConfirmVerificationRequest"))
  throw new ForbiddenError("forbiden method : onRecordConfirmVerificationRequest")
  //e.next()
}, "users")

routerAdd("POST", "/extend/api/collections/users/update-verification-callback", (c) => {
  const tripayPrivateKey = $os.getenv("TRIPAY_PRIVATE_KEY")
  const email = require(`${__hooks}/utils/email.js`)

  const callbackSignature = c.request.header.get("X-Callback-Signature")
  const callbackEvent = c.request.header.get("X-Callback-Event")

  let data = c.requestInfo().body
  const req = {
    reference: data.reference,
    merchant_ref: data.merchant_ref,
    payment_method: data.payment_method,
    payment_method_code: data.payment_method_code,
    total_amount: data.total_amount,
    fee_merchant: data.fee_merchant,
    fee_customer: data.fee_customer,
    total_fee: data.total_fee,
    amount_received: data.amount_received,
    is_closed_payment: data.is_closed_payment,
    status: data.status,
    paid_at: data.paid_at,
    note: data.note
  }

  const signature = $security.hs256(JSON.stringify(req), tripayPrivateKey)

  if (!$security.equal(signature, callbackSignature)) {
    throw new ForbiddenError("Invalid signature.", "")
  }

  if (callbackEvent !== "payment_status") {
    throw new ForbiddenError("Unrecognized callback event, no action was taken.", "")
  }

  if (!req.is_closed_payment === 1) {
    throw new ForbiddenError("Open payment not allowed.", "");
  }

  const regisRecord = $app.findFirstRecordByData("registrations", "registration_code", req.merchant_ref)
  const registrationId = regisRecord.id

  const userRecord = $app.findAuthRecordByToken(regisRecord.getString("verification_token"))
  const userEmail = userRecord.email()

  if (req.status === "PAID") {
    userRecord.setVerified(true)
    $app.save(userRecord);
  } else {
    $app.delete(userRecord)
  }

  let emailSubject
  switch (req.status) {
    case "PAID":
      emailSubject = "Pembayaran Berhasil - Akun Anda Telah Aktif!"
      break;
    case "FAILED":
      emailSubject = "Pembayaran Gagal - Perlu Registrasi Ulang"
      break;
    case "EXPIRED":
      emailSubject = "Pembayaran Kedaluwarsa - Perlu Registrasi Ulang"
      break;
    case "REFUND":
      emailSubject = "Pembayaran Telah Direfund - Perlu Registrasi Ulang"
      break;
    default:
      emailSubject = "Pembayaran Gagal - Perlu Registrasi Ulang"
      break;
  }

  try {
    const message = new MailerMessage({
      from: {
        address: $app.settings().meta.senderAddress,
        name: $app.settings().meta.senderName,
      },
      to: [{ address: userEmail }],
      subject: emailSubject,
      html: email.paymentStatusEmail(req.status, $app.settings().meta.senderAddress),
    })

    $app.newMailClient().send(message)
  } catch (error) {
    console.log(JSON.stringify(error))
    $app.logger().warn(JSON.stringify(error))
    $app.logger().warn(
      "Failed to send payment notification email.",
      "registration_id", registrationId,
      "register_email_address", userEmail,
    )
  }

  return c.json(200, { success: true })
},)
