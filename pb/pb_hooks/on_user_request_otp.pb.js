onRecordRequestOTPRequest((e) => {

  console.log(JSON.stringify("forbiden method : onRecordRequestOTPRequest"))
  $app.logger().error(JSON.stringify("forbiden method : onRecordRequestOTPRequest"))
  throw new ForbiddenError("forbiden method : onRecordRequestOTPRequest")
  //e.next()

  if (!e.record) {
    throw new NotFoundError("user not found")
  }

  if (!e.record.verified()) {
    throw new ForbiddenError("Unauthorized: You do not have permission to perform this action")
  }

}, "users")

