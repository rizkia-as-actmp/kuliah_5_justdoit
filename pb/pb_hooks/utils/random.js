// function untuk generate kode random untuk registration code
function generateRegistrationCode() {
  const date = new Date();
  const year = date.getFullYear().toString().substring(2);
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const day = date.getDate().toString().padStart(2, "0");
  const hours = date.getHours().toString().padStart(2, "0");
  const minutes = date.getMinutes().toString().padStart(2, "0");
  const seconds = date.getSeconds().toString().padStart(2, "0");
  const milliseconds = date.getMilliseconds().toString().padStart(3, "0");
  const randomStr = Math.random().toString(36).substring(2, 8);
  return `REG-${year}${month}${day}-${hours}${minutes}${seconds}${milliseconds}-${randomStr.toUpperCase()}`;
}

module.exports = {
  generateRegistrationCode
}
