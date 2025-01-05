# Application Layer :electric_plug:
---

Application layer adalah bagian di mana **application-specific logic** (atau yang secara umum disbut bussines-logic) berada. Layer ini bertugas menyediakan logic diantara **controller**, yang mengelola state dari widget, dengan **repository**, yang berkomunikasi dengan API.

Pada layer ini, kita akan membuat **service**. Service inilah tempat logic berada seperti berkomunikasi dengan satu atau lebih repository, baik dalam satu fitur maupun lintas fitur.

:::info Note 
Pada arsitektur lain seperti MVC atau MVVM, application-specific logic sering kali digabungkan menjadi satu dengan model.
:::

<br>

## **Kapan Menggunakan Application Layer?** :hourglass_flowing_sand:

Kita dapat menggunakan atau membuat application layer ketika:

- Membuat sebuah logic yang membutuhkan komunikasi dengan banyak repository.  
- Logic tersebut digunakan di berbagai tempat dan oleh berbagai widget, baik dalam satu fitur maupun antar fitur.

::: info
Menurut Andrea Bizzotto, sering kali kita tidak membutuhkan service class. Jika logic yang dibuat sederhana, di mana controller cukup langsung memanggil fungsi repository, maka sebenarnya service class tidak diperlukan.
:::

<br>

## Referensi :books:

- [Code with Andrea: Flutter App Architecture - Application Layer](https://codewithandrea.com/articles/flutter-app-architecture-application-layer/)
