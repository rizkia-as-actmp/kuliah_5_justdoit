# Kustomisasi Functionalitas Pocketbase :wrench:
---

Pada bab ini, saya akan melakukan kustomisasi pada functionalitas bawaan Pocketbase. Selain itu, saya juga akan menambahkan fungsi baru ke dalam Pocketbase untuk memenuhi kebutuhan project ini. Proses ini akan dilakukan secara bertahap, dimulai dari hal sederhana hingga yang lebih kompleks.

<br>

## **Not Your Average JS** :warning:

Pocketbase tidak menggunakan standar Node.js, melainkan menggunakan **embedded ES5 JavaScript engine** yang disebut **Goja**. 

### **Mengapa Tidak Node.js?**

Pocketbase ditulis menggunakan bahasa **Go**. Oleh karena itu, JavaScript yang kita tuliskan di Pocketbase hanyalah sebuah wrapper yang berjalan di atas engine Goja. Akibatnya, terdapat beberapa perbedaan mendasar dalam menulis kode JavaScript untuk Pocketbase dibandingkan dengan standar Node.js. Perbedaan tersebut meliputi:

- Lokasi file.
- Penamaan file.
- Cara import module.

<br>

## **Lokasi File** :file_folder:

Kode yang ditulis untuk Pocketbase harus berada di dalam direktori bernama **`pb_hooks`**. Direktori ini wajib ditempatkan pada level yang sama dengan binary Pocketbase yang telah diunduh dan diekstrak sebelumnya.

### **Contoh Struktur Direktori**:

Berikut adalah contoh struktur direktori yang benar:

```plaintext
pb_project/
|____pb_hooks/
|____pb_data/
|____pocketbase
```
<br>

## Penamaan File :label:
File kode harus menggunakan ekstensi .pb.js. Penamaan file ini adalah persyaratan wajib agar kode dapat dikenali dan dijalankan oleh Pocketbase. Contohnya:

- on_user_delete.pb.js
- on_record_create.pb.js

<br>

## Import Module :package:

Karena Pocketbase menggunakan engine Goja, cara mengimpor module dalam kode memiliki aturan tertentu yang perlu diperhatikan. Dokumentasi resmi Pocketbase memberikan panduan lengkap mengenai cara mengimpor dan menggunakan module dengan benar.

:::info
Untuk informasi lebih lanjut tentang penulisan dan pengaturan module, kunjungi Pocketbase JavaScript Overview.
:::

<br>

## Referensi :books:

- [Pocketbase: Extend with JavaScript](https://pocketbase.io/docs/js-overview/)

