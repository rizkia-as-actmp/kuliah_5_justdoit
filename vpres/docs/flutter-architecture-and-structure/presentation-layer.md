# Presentation Layer :art:
---

Presentation layer adalah bagian yang bertugas menangani tampilan dan interaksi pengguna. Pada layer ini, terdapat tiga komponen utama, yaitu **Widget**, **State**, dan **Controller**. Berikut penjelasan masing-masing komponen:

<br>

## **Widget** :pencil2:

Salah satu komponen inti pada presentation layer adalah **Widget**. Dalam Flutter, semua elemen yang membangun aplikasi merupakan widget. Bahkan aplikasi itu sendiri sebenarnya adalah sebuah widget.

Widget dapat berupa:

- **StatelessWidget**: Widget yang tidak memiliki state dan hanya menampilkan data statis.
- **StatefulWidget**: Widget yang memiliki state dan dapat berubah-ubah sesuai interaksi pengguna atau data yang diperoleh.

<br>

## **State** :arrows_counterclockwise:

State adalah kondisi atau keadaan yang dimiliki oleh sebuah widget. **State** menentukan bagaimana widget ditampilkan pada UI.

Contoh berbagai kondisi state:

- **Loading State**: Widget ditampilkan sebagai animasi loading (misalnya, spinner berputar-putar).
- **Error State**: Widget menampilkan dialog berwarna merah untuk memberi tahu pengguna bahwa ada kesalahan.
- **Data State**: Widget menampilkan data yang telah diperoleh dan siap dipresentasikan kepada pengguna.

**State** yang beragam dan dinamis inilah yang menjadi dasar bagaimana widget di-render pada layar.

<br>

## **Controller** :control_knobs:

**Controller** bertugas menghubungkan presentation layer dengan application layer. Tugas utama controller meliputi:

1. Berkomunikasi langsung dengan **Service** pada application layer untuk mendapatkan atau memproses data.
2. Mengubah **State** dari satu kondisi ke kondisi lainnya, seperti dari **Loading State** ke **Data State**, atau dari **Error State** ke kondisi lain.

Controller membantu memastikan bahwa setiap perubahan state tercermin pada UI secara real-time.

<br>

## Referensi :books:

- [Andrea Bizzotto: Flutter Presentation Layer](https://codewithandrea.com/articles/flutter-presentation-layer/)

