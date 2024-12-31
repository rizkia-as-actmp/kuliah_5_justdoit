/// <reference path="../pb_data/types.d.ts" />
onRecordsListRequest((e) => {
  // e.app
  // e.collection
  // e.records
  // e.result
  // and all RequestEvent fields...

  ///const authRecord = e.requestInfo()
  //let isGuest = !e.auth⇧

  // the same as "e.auth?.isSuperuser()"
  // cek jika request bukan dari dashboard admin maka return data seperlunya saja seperti title dan preview_description.
  sleep(500)// setengah detika
  let isSuperuser = e.hasSuperuserAuth()

  const authRecord = e.requestInfo()
  console.log(JSON.stringify(authRecord));
  if (!isSuperuser) {
    e.result.items.sort((a, b) => new Date(b.get("updated")) - new Date(a.get("updated")));
    e.result.items = e.result.items.map((item) => {
      console.log(JSON.stringify(item.get("updated")))
      return {
        id: item.id,
        title: item.get("title",),
        previewContent: item.get("preview_content",),
      }
    })
  }

  e.next()
}, "marks")
