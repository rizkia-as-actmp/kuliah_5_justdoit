# Arsitektur Project :building_construction:
---

Sebelum membuat kode pada project eksplorasi kali ini, saya menentukan dan mempelajari terlebih dahulu mengenai arsitektur yang akan saya gunakan. Berikut penjelasan dan alasan memilih arsitektur ini:

<br>

## **Mengapa Memilih Arsitektur ?** :thinking:

Alasan utama untuk memilih arsitektur yang baik adalah:

- Jika terlalu sederhana, kode akan sulit dipahami dan di-maintenance karena kurangnya pemisahan fungsi dalam kode.
- Jika terlalu rumit, kode menjadi verbose, sehingga menambahkan fitur baru, bahkan fitur kecil, terasa sulit.

<br>

## **Riverpod Architecture** :seedling:

Arsitektur ini diperkenalkan oleh Andrea Bizzotto, seorang Google Developer Expert untuk Dart & Flutter. Andrea menyebut arsitektur ini sebagai **Riverpod Architecture**. Namun, perlu diingat bahwa ini bukan arsitektur Official langsung dari Riverpod.

::: info
For lack of a better name, I'll call this Riverpod Architecture - though keep in mind that this is just my take on it and not an "official" architecture endorsed by Remi Rousselet (the author of Riverpod). ~ Andrea Bizzotto
:::

Arsitektur ini terdiri atas empat bagian utama:

1. **Data**
2. **Domain**
3. **Application**
4. **Presentation**

Setiap bagian memiliki tanggung jawab dan fungsinya masing-masing. Bagian-bagian ini tetap saling berkomunikasi. Penjelasan detail untuk masing-masing bagian akan saya jelaskan di halaman berikutnya.

<br>

## **Manfaat Menggunakan Riverpod Architecture** :star:

Menurut Andrea, berikut adalah manfaat dari arsitektur ini:

- **Separation of Concerns:**
  Memisahkan kode UI, business logic, dan cara mengakses data.
- **Kemudahan Fetching dan Caching Data:**
  Memastikan data selalu up-to-date tanpa membuat kode menjadi rumit.
- **Pengelolaan State yang Efisien:**
  Memungkinkan perubahan data sambil memperbarui state (loading, error, data) pada UI yang bergantung pada data tersebut.
- **Mudah Diuji:**
  Memudahkan penulisan unit test dan integration test untuk berbagai komponen aplikasi.

<br>
<br>

## Referensi :books:

- [Andrea Bizzotto: Riverpod Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)

