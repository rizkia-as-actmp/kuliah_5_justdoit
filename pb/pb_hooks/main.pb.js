/// <reference path="../pb_data/types.d.ts" />
routerAdd("GET", "/hello", (e) => {
  // const record = $app.findRecordById('users', 'qvp20oq6xkv053t');
  // console.log(JSON.stringify(
  //   record.tokenKey()
  // ))

  return e.json(200, { success: "always" })
})
