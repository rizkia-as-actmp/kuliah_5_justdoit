/// <reference path="../pb_data/types.d.ts" />
onMailerRecordVerificationSend((e) => {

  console.log("sdfh")
  const tp = require(`${__hooks}/lib/tripay.js`)
  // e.app
  // e.mailer
  // e.message
  // e.meta

  e.message.html = "get wreck"

  tp.closedTransaction()




  // ex. change the mail subject
  e.message.subject = "new subject"


  e.next()
})


