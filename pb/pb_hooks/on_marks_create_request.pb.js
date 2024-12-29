onRecordCreateRequest((e) => {
  let isSuperuser = e.hasSuperuserAuth()
  if (!isSuperuser) {
    console.log(JSON.stringify("forbiden method : onRecordRequestOTPRequest"))
    $app.logger().error(JSON.stringify("forbiden method : onRecordRequestOTPRequest"))
    throw new ForbiddenError("forbiden method : onRecordRequestOTPRequest")
  }
  e.next()
}, "marks")

/// <reference path="../pb_data/types.d.ts" />
routerAdd("POST", "/extend/api/collections/marks/records", (c) => {
  const cut = require(`${__hooks}/utils/cut.js`)

  let authRecord = c.auth
  if (!authRecord) {
    // throw new ForbiddenError("Unauthorized: You do not have permission to perform this action");
  }

  let data = c.requestInfo().body

  let { preview: prev, remaining: rem } = cut.cutPreview(data.content, 8, 50)

  const markCol = $app.findCollectionByNameOrId("marks") // mencari data collection untuk collection registratins
  const markRecord = new Record(markCol)
  markRecord.set("title", data.title)
  markRecord.set("preview_content", prev)
  markRecord.set("remaining_content", rem)
  $app.save(markRecord);

  return c.json(200, {
    id: markRecord.id,
    title: markRecord.get("title"),
    fullContent: cut.toFullContent(
      markRecord.get("preview_content"),
      markRecord.get("remaining_content")
    ),
  })


  //}, $apis.requireAuth())
},)
