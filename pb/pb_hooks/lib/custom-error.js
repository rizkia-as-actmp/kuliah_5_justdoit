// class FailError saya buat untuk memudahkan menghandle error kedepannya
class FailError extends Error {
  constructor(msg = "", code = 500, detail = null) {
    super(msg);
    this.code = code; // field optional untuk menyimpan https status code 
    this.detail = detail; // field optional jika saya perlu untuk menyimpan detail mengenai error bukan cuma message saja

    this.name = this.constructor.name;
  }
}

// "Currently only CommonJS (CJS) modules are supported" 
// ~ pocketbase documentation
module.exports = { FailError }; 
