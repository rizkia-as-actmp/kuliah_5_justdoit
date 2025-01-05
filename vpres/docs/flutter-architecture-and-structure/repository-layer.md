# Repository :file_folder:
---

Salah satu bagian terpenting dari arsitektur ini adalah data layer. didalam data layer sendiri terdapat salah satu bagian terpenting yaitu  **repository**. Tugas utama dari repository meliputi:

- **Mengisolasi domain model (entity):**
  Repository bertugas untuk menjaga agar domain model tetap independen dan tidak terpengaruh oleh perubahan dari data source eksternal.
- **Mengubah data transfer object:**
  Repository bertanggung jawab untuk mengonversi data yang diterima dari sumber luar (seperti JSON string) menjadi data yang dapat dimengerti dan diasosiasikan dengan domain model.
- **(Opsional) Melakukan caching data:**
  Caching data dapat dilakukan untuk meningkatkan performa dengan mengurangi jumlah permintaan data ke sumber eksternal.

::: warning
Disclaimer: Saya tidak melakukan caching data di repository pada project ini. Namun, bagian tentang caching akan saya bahas secara terpisah nanti.
:::

<br>

## **Kapan Repository Digunakan?** :hourglass_flowing_sand:

Repository digunakan untuk menangani komunikasi data yang kompleks dari berbagai sumber dan endpoint-nya. Biasanya, sumber ini berupa API yang memberikan data dalam bentuk unstructured data seperti JSON string. Karena JSON string tidak dapat langsung digunakan dalam sistem, repository akan mengubahnya agar setiap field dan value yang terkandung dapat diakses dengan mudah.

Proses konversi ini dilakukan dengan memanfaatkan domain model atau entity.

Berikut adalah beberapa kasus di mana repository digunakan:

- **Komunikasi dengan REST APIs:**
  Mengolah data yang dikirimkan oleh server dalam format JSON menjadi objek yang dapat digunakan oleh aplikasi.
- **Komunikasi dengan database:**
  Menyediakan antarmuka untuk read, create, atau update data yang disimpan di database lokal atau remote.
- **Komunikasi dengan device-specific APIs:**
  Menangani interaksi dengan API perangkat seperti permissions, kamera, lokasi, dan lainnya.

<br>

## Referensi :books:

- [Code with Andrea: Flutter Repository Pattern](https://codewithandrea.com/articles/flutter-repository-pattern/)
