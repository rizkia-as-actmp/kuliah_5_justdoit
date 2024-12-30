// function yang me-return HTML untuk email yang dikirimkan saat user melakukan registratsi
function registrationEmail(amount, qrURI, mailtoAddress) {
  // melakukan format agar menjadi string angka yang mudah dibaca. contoh : 125000 => 125.000
  const formatedAmount = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  return `
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pembayaran Verifikasi Akun</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F8F9FA;
            color: #333333;
        }
        .email-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #FFFFFF;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #E5E7EB;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #3B3F6C;
            color: #FFFFFF;
            text-align: center;
            padding: 20px;
            font-size: 20px;
            font-weight: bold;
        }
        .content {
            padding: 20px;
        }
        .instructions {
            text-align: center;
            font-size: 16px;
            color: #555555;
            line-height: 1.6;
        }
        .price-section {
            background-color: #EAF4FF;
            color: #3B3F6C;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-radius: 10px;
            margin: 20px 0;
        }
        .qr-section {
            text-align: center;
            margin: 20px 0;
        }
        .qr-section img {
            width: 180px;
            height: 180px;
            border-radius: 8px;
        }
        .button {
            text-align: center;
            margin-top: 30px;
        }
        .button a {
            display: inline-block;
            background-color: #3B3F6C;
            color: #FFFFFF;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .button a:hover {
            background-color: #2C2F54;
        }
        .footer {
            background-color: #F0F0F0;
            padding: 10px;
            text-align: center;
            font-size: 12px;
            color: #888888;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            Verifikasi Akun Anda
        </div>
        <div class="content">
            <p class="instructions">
                Terima kasih telah mendaftar! Untuk mengaktifkan akun Anda, silakan lakukan pembayaran berikut:
            </p>
            <div class="price-section">
                Rp${formatedAmount}
            </div>
            <p class="instructions">
                Lakukan pembayaran dengan memindai QR Code di bawah ini:
            </p>
            <div class="qr-section">
                <img src="${qrURI}" alt="QR Code Pembayaran">
            </div>
            <p class="instructions">
                Setelah pembayaran berhasil, akun Anda akan segera diverifikasi. Jika Anda membutuhkan bantuan, hubungi tim kami melalui tombol di bawah ini.
            </p>
            <div class="button">
                <a href="mailto:${mailtoAddress}">Hubungi Dukungan</a>
            </div>
        </div>
        <div class="footer">
            © 2024 MarkDawg. Semua Hak Dilindungi.
        </div>
    </div>
</body>
</html>
`
}

function paymentStatusEmail(status, mailtoAddress) {
  let statusStyle = "";
  let statusMessage = "";

  switch (status) {
    case "PAID":
      statusStyle = "background-color: #D4EDDA; color: #155724;"; // Hijau
      statusMessage = `
        <p class="instructions">
          Selamat! Pembayaran Anda telah berhasil. Akun Anda sekarang sudah aktif, dan Anda dapat mulai menggunakan layanan kami.
        </p>
        <p class="instructions">
          Jika Anda membutuhkan bantuan, jangan ragu untuk menghubungi tim dukungan kami melalui tombol di bawah ini.
        </p>`;
      break;
    case "FAILED":
    case "EXPIRED":
    case "REFUND":
      statusStyle = "background-color: #F8D7DA; color: #721C24;"; // Merah
      statusMessage = `
        <p class="instructions">
          Maaf, pembayaran Anda ${status === "FAILED" ? "gagal" : status === "EXPIRED" ? "telah kedaluwarsa" : "telah direfund"}.
          Anda perlu melakukan registrasi ulang untuk menggunakan layanan kami.
        </p>
        <p class="instructions">
          Jika Anda membutuhkan bantuan, jangan ragu untuk menghubungi tim dukungan kami melalui tombol di bawah ini.
        </p>`;
      break;
    default:
      throw new Error("Status pembayaran tidak valid.");
  }

  return `
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Status Pembayaran</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F8F9FA;
            color: #333333;
        }
        .email-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #FFFFFF;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #E5E7EB;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #3B3F6C;
            color: #FFFFFF;
            text-align: center;
            padding: 20px;
            font-size: 20px;
            font-weight: bold;
        }
        .content {
            padding: 20px;
        }
        .instructions {
            text-align: center;
            font-size: 16px;
            color: #555555;
            line-height: 1.6;
        }
        .status-section {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-radius: 10px;
            margin: 20px 0;
            ${statusStyle}
        }
        .button {
            text-align: center;
            margin-top: 30px;
        }
        .button a {
            display: inline-block;
            background-color: #3B3F6C;
            color: #FFFFFF;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .button a:hover {
            background-color: #2C2F54;
        }
        .footer {
            background-color: #F0F0F0;
            padding: 10px;
            text-align: center;
            font-size: 12px;
            color: #888888;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            Status Pembayaran
        </div>
        <div class="content">
            <div class="status-section">
                ${status === "PAID" ? "PAID" : status}
            </div>
            ${statusMessage}
            <div class="button">
                <a href="mailto:${mailtoAddress}">Hubungi Dukungan</a>
            </div>
        </div>
        <div class="footer">
            © 2024 MarkDawg. Semua Hak Dilindungi.
        </div>
    </div>
</body>
</html>
`;
}

function otpEmail(otpCode, mailtoAddress) {
  return `
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kode OTP Anda</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F8F9FA;
            color: #333333;
        }
        .email-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #FFFFFF;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #E5E7EB;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #3B3F6C;
            color: #FFFFFF;
            text-align: center;
            padding: 20px;
            font-size: 20px;
            font-weight: bold;
        }
        .content {
            padding: 20px;
        }
        .instructions {
            text-align: center;
            font-size: 16px;
            color: #555555;
            line-height: 1.6;
        }
        .otp-section {
            background-color: #EAF4FF;
            color: #3B3F6C;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-radius: 10px;
            margin: 20px 0;
        }
        .button {
            text-align: center;
            margin-top: 30px;
        }
        .button a {
            display: inline-block;
            background-color: #3B3F6C;
            color: #FFFFFF;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .button a:hover {
            background-color: #2C2F54;
        }
        .footer {
            background-color: #F0F0F0;
            padding: 10px;
            text-align: center;
            font-size: 12px;
            color: #888888;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            Kode OTP Anda
        </div>
        <div class="content">
            <p class="instructions">
                Berikut adalah kode OTP (One Time Password) Anda untuk verifikasi:
            </p>
            <div class="otp-section">
                ${otpCode}
            </div>
            <p class="instructions">
                Masukkan kode OTP ini ke dalam aplikasi untuk melanjutkan. Kode ini berlaku selama 10 menit.
            </p>
            <p class="instructions">
                Jika Anda tidak meminta kode ini, abaikan email ini. Jika Anda membutuhkan bantuan, hubungi tim kami melalui tombol di bawah ini.
            </p>
            <div class="button">
                <a href="mailto:${mailtoAddress}">Hubungi Dukungan</a>
            </div>
        </div>
        <div class="footer">
            © 2024 JustDoIT. Semua Hak Dilindungi.
        </div>
    </div>
</body>
</html>
`;
}

module.exports = {
  otpEmail,
};

module.exports = {
  paymentStatusEmail,
  registrationEmail,
  otpEmail
}
