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
            © 2024 Aplikasi Anda. Semua Hak Dilindungi.
        </div>
    </div>
</body>
</html>
`
}

module.exports = {
  registrationEmail
}
