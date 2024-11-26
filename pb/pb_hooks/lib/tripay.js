function closedPaymentSignature(merchantRef, amount) {
  const tripayPrivateKey = $os.getenv("TRIPAY_PRIVATE_KEY")
  const tripayMerchantCode = $os.getenv("TRIPAY_MERCHANT_CODE")

  const data = tripayMerchantCode + merchantRef + amount;
  const signature = $security.hs256(data, tripayPrivateKey)

}

export async function closedTransaction(
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


  return ""


  const tpResponse = await fetch(`${tripayBaseURL}/transaction/create`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${tripayApiKey}`,
    },
    body: JSON.stringify(payload),
  })
    .then((res) => res.json())
    .then((json) => json);

  if (!tpResponse.success) {
    throw new FailError(
      `failed to create payment transaction: ${tpResponse.message}`
    );
  }

  const data = tpResponse.data
  return data;
}

module.exports = {

}

