const { FailError } = require("./custom-error");

// membuat signature menggunakan algoritma hs256 untuk mengamankan resources yang saya kirim ke API tripay ditengah perjalanannya
function closedPaymentSignature(merchantRef, amount) {
  const tripayPrivateKey = $os.getenv("TRIPAY_PRIVATE_KEY") // cara mendapatkan environtment variable didalam extend function pocketbase 
  const tripayMerchantCode = $os.getenv("TRIPAY_MERCHANT_CODE")

  const data = tripayMerchantCode + merchantRef + amount;
  const signature = $security.hs256(data, tripayPrivateKey)
  return signature
}

// function untuk membuat request closed transaction ke tripay API payment gateway 
async function closedTransaction(
  method,
  merchant_ref,
  amount,
  customer_name,
  customer_email,
  order_items,
  callback_url,
  return_url,
) {
  const tripayApiKey = $os.getenv("TRIPAY_API_KEY")
  const tripayTransactionDuration = parseInt($os.getenv("TRIPAY_TRANSACTION_DURATION"));
  const tripayBaseURL = $os.getenv("TRIPAY_BASE_URL")

  const expiry = Math.floor(Date.now() / 1000) + tripayTransactionDuration * 60 * 60;
  const signature = closedPaymentSignature(merchant_ref, amount);

  const payload = {
    method,
    merchant_ref,
    amount,
    customer_name,
    customer_email,
    order_items,
    callback_url,
    return_url,
    expired_time: expiry,
    signature: signature,
  };

  let tpResponse
  try {
    // $http adalah object global helper yang tersedia didalam extend function pocketbase untuk melakukan request ke external services
    console.log(JSON.stringify("prepare to create close transaction"))
    tpResponse = $http.send({
      url: `${tripayBaseURL}/transaction/create`,
      method: "POST",
      body: JSON.stringify(payload),
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${tripayApiKey}`,
      },
      timeout: 120,
    })
    console.log(JSON.stringify("close transaction was created"))
    tpResponse = tpResponse.json

    if (!tpResponse.success) {
      throw new FailError(`failed to create payment transaction: ${tpResponse.message}`)
    }
  } catch (error) {
    console.log(JSON.stringify(error))
    $app.logger().error(JSON.stringify(error))
    throw new fail.FailError(error)
  }

  const data = tpResponse.data
  return data;
}

module.exports = {
  closedTransaction
}
