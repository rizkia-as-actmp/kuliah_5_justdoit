<script setup>
import VideoCard from '../components/VideoCard.vue'

import Card from '../components/Card.vue'

</script>

# Teknologi Yang Digunakan :hammer_and_wrench:
---

Berikut adalah teknologi yang saya gunakan dalam membangun project ini:

<div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 16px;">
  <Card
        title="Flutter"
        to="/#flutter"
      />
  <Card
        title="Riverpod"
        to="/#riverpod"
      />
  <Card
        title="Pocketbase"
        to="/#pocketbase"
      />
</div>

<br>

### **Flutter** :bird:

Flutter adalah open source SDK untuk membuat UI multiplatform dengan hanya menggunakan single code base. Flutter saat ini menggunakan rendering engine Impeller berperforma tinggi dengan bahasa pemrograman Dart.

<VideoCard
      title="Fireship: Flutter in 100 seconds"
      src="https://www.youtube.com/embed/lHhRhPV--G0"
    />

<br>

### **Riverpod** :seedling:

Riverpod adalah framework manajemen state (caching framework) secara reaktive untuk aplikasi yang dibuat menggunakan Flutter atau Dart.

::: info

**Reactive State Management** :bulb: Artinya, setiap kali ada perubahan pada data atau state, semua bagian aplikasi yang bergantung pada data tersebut secara otomatis bereaksi dan memperbarui tampilannya tanpa perlu campur tangan manual.

:::

<br>

### **Pocketbase** :package:

Pocketbase adalah program backend mini yang menyediakan basic fungsionalitas untuk mengelola database. Di dalam Pocketbase ini sudah tertanam database SQLite sehingga dengan menjalankan binary dari Pocketbase ini kita sudah memiliki database SQLite tanpa lagi harus menginstallnya. Basic fungsionalitas yang ada seperti authentication, authorization, operasi basic CRUD untuk setiap tabel/collection, dan banyak lagi. Kita juga bisa melakukan perubahan pada fungsionalitas yang ada ataupun menambah yang baru.

<VideoCard
      title="Fireship: PocketBase... The Ultimate Side-Hustle Backend?"
      src="https://www.youtube.com/embed/Wqy3PBEglXQ"
    />

<br>
<br>

# Motivasi :sparkles:
---

Alasan saya menggunkan Riverpod dan Pocketbase untuk project eksplorasi Flutter kali ini adalah:

- **Riverpod** memudahkan bagi saya untuk membangun project Flutter ini dengan struktur kode yang saya inginkan. Riverpod memudahkan untuk saya memisahkan kode untuk mengatur data dan state pada kategorinya masing-masing. Pemisahan kode membuat kode lebih bersih, rapi, dan mudah diubah. Pemisahan ini juga membuat kode menjadi modular.

- **Pocketbase**: Alasan saya menggunakan Pocketbase adalah karena fungsionalitas bawaannya yang cukup lengkap sehingga saya tidak perlu membuat kode boilerplate seperti basic CRUD. Hal ini membuat saya memiliki lebih banyak waktu untuk fokus pada hal-hal lain yang memang saya ingin pelajari. Selain itu, saya juga ingin melihat potensi dari framework Pocketbase ini untuk meng-handle side project saya ke depannya, yang mana pada side project tersebut, masalah backend tidak krusial dan bukan menjadi titik fokus pengembangan.

<br>
<br>

  
# Referensi :books:
---

- [Fireship: Flutter in 100 seconds](https://youtu.be/lHhRhPV--G0?feature=shared)
- [Dokumentasi Riverpod](https://riverpod.dev/)
- [Fireship: PocketBase... The Ultimate Side-Hustle Backend?](https://youtu.be/Wqy3PBEglXQ?feature=shared)
- [Dokumentasi Pocketbase](https://pocketbase.io/)

