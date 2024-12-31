
/// <reference path="../pb_data/types.d.ts" />
onRecordRequestPasswordResetRequest((c) => {
  const token = c.record.newPasswordResetToken()

  return e.json(200, { token: token }) // override execution chain dengan langsung return 
  //e.next()
}, "users");

onRecordConfirmPasswordResetRequest((e) => {

  let data = e.requestInfo().body
  const isValidPassword = e.record.validatePassword(data.oldPassword)
  console.log(isValidPassword)

  if (!isValidPassword) {
    throw new ForbiddenError("Old password are incorrect");
  }


  e.next()
}, "users")

