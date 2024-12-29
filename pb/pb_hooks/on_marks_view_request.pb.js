/// <reference path="../pb_data/types.d.ts" />
onRecordViewRequest((e) => {
  // e.app
  // e.collection
  // e.record
  // and all RequestEvent fields...
  let isSuperuser = e.hasSuperuserAuth()
  if (!isSuperuser) {
    // override execution chain dengan langsung return 
    return e.json(200, {
      id: e.record.id,
      title: e.record.get("title"),
      fullContent: e.record.get("preview_content") + e.record.get("remaining_content")
    })
  }

  e.next()
}, "marks")
