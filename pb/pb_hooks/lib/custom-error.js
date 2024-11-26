function FailError(msg = "", code = 500, detail = null) {
  this.message = msg;
  this.code = code;
  this.detail = detail;
}

// Inherit from Error
FailError.prototype = new Error();

// Export the FailError function using CommonJS syntax
module.exports = { FailError };
