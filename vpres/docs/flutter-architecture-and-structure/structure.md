# Struktur Project dengan Feature-first :file_folder:
---

Setelah menentukan arsitektur aplikasi untuk project ini, langkah berikutnya adalah menyusun struktur kode. Proses ini penting untuk memastikan kode mudah dipahami, dikelola, dan dikembangkan. Selain membahas arsitektur aplikasi, **Andrea Bizzotto** juga menjelaskan pendekatan **Feature-first** untuk menyusun project Flutter.

<br>

## **Apa itu Feature-first?** :dart:

Pendekatan **Feature-first** adalah cara menyusun kode dengan membuat folder terpisah untuk setiap fitur dalam aplikasi. Setiap folder fitur dapat memiliki sub-folder untuk memisahkan berbagai layer dalam arsitektur aplikasi (presentation, application, domain, data, dll).

<br>

## **Mengapa Memilih Feature-first?** :thinking:

Arsitektur aplikasi sangat memengaruhi keputusan dalam menentukan struktur project. Karena saya menggunakan **Riverpod Architecture**, maka pendekatan Feature-first adalah pilihan yang tepat. 

Pendekatan ini memberikan keuntungan seperti:

- **Pengelompokan Kode yang Jelas**: Kode dikelompokkan berdasarkan fitur, sehingga memudahkan navigasi dan pengembangan.
- **Skalabilitas**: Penambahan fitur baru ataupun penghapusan fitur menjadi lebih mudah tanpa merusak struktur yang ada.
- **Pemeliharaan yang Efisien**: Perubahan pada fitur tidak akan memengaruhi fitur lain, karena setiap fitur terisolasi dalam folder masing-masing.

<br>

## **Pemisahan Shared Code** :recycle:

Kode yang digunakan bersama oleh berbagai fitur, seperti **widgets**, **constants**, atau **utils**, dipisahkan dari folder fitur dan ditempatkan dalam folder khusus. Hal ini memastikan shared code dapat diakses tanpa menimbulkan ketergantungan antar fitur.

<br>

## **Apa Itu Feature?** :bulb:

Feature adalah tentang apa yang **dilakukan pengguna**, bukan apa yang **dilihat pengguna**. 

Contohnya:

- **Login** dan **Register** bukan dua fitur berbeda, tetapi merupakan bagian dari satu fitur, yaitu **Authentication**.
- Sebuah fitur adalah kebutuhan fungsional (functional requirement) yang membantu pengguna menyelesaikan tugas tertentu.

:::info 
**“A feature is a functional requirement that helps the user complete a given task.”** ~ Andrea Bizzotto
:::

<br>

## **Cara Menerapkan Feature-first** :rocket:

Berikut adalah langkah-langkah untuk menyusun kode dengan pendekatan Feature-first:

1. **Mulai dari Domain Layer**: Identifikasi domain model yang diperlukan untuk fitur tersebut.
2. **Identifikasi Business Logic**: Tentukan business logic yang dibutuhkan untuk memanipulasi domain model.
3. **Kelompokkan Model**: Model-model yang saling berkaitan dikelompokkan ke dalam satu folder.
4. **Buat Sub-folder**: Di dalam folder fitur, buat sub-folder untuk memisahkan layer seperti **Presentation**, **Application**, **Domain**, dan **Data**. Setiap sub-folder ini berisi kode yang saling terkait untuk meng-handle domain model.

## Contoh Struktur Project

Berikut adalah contoh struktur kode berdasarkan pendekatan Feature-first:

```plaintext
.
|____src
| |____interfaces
| |____common_widgets
| |____features
| | |____mark
| | | |____data
| | | |____domain
| | | |____application
| | | |____presentation
| | |____authentication
| | | |____data
| | | |____domain
| | | |____application
| | | |____presentation
| |____utils
| |____infrastructure
| |____exceptions
| |____constants
|____main.dart
```
<br>

## Referensi :books:

- [Flutter Project Structure: Feature-first or Layer-first?](https://codewithandrea.com/articles/flutter-project-structure/)

