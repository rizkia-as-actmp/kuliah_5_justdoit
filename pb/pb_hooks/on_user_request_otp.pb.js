/// <reference path="../pb_data/types.d.ts" />
onRecordRequestOTPRequest((e) => {
  if (!e.record) {
    throw new NotFoundError("user not found")
  }

  if (!e.record.verified()) {
    throw new ForbiddenError("Unauthorized: You do not have permission to perform this action")
  }

  e.next()
}, "users")

