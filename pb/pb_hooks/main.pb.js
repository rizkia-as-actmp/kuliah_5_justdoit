/// <reference path="../pb_data/types.d.ts" />
routerAdd("GET", "/hello", (e) => {

  return e.json(200, { success: "always" })
})
