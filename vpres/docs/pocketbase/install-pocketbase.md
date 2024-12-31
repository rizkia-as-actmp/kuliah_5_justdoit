
<br>
<br>

# Instalasi Pocketbase
---
Untuk bisa menggunakan Pocketbase kita tidak perlu menginstallnya langsung pada sistem kita sebagaimna yang biasa kita lakukan saat menginstall database konvensional lainnya. kita hanya perlu mengunduh file binary atau executablenya.

untuk mengunduh file binary pocketbase dan sekaligus mengekstraknya di current directory:

```shell
# Unduh file
curl -LO https://github.com/pocketbase/pocketbase/releases/download/v0.23.8/pocketbase_0.23.8_linux_amd64.zip
```
```shell
# Unzip file current directory
unzip pocketbase_0.23.8_linux_amd64.zip

```
Berikut adalah command untuk menginstal Flutter SDK dari AUR:

```shell
yay -Sy flutter
```

:::info :bulb: **Catatan:**  
Ketika kita menginstal Flutter SDK menggunakan `yay`, secara otomatis akan terinstal **JDK** juga. Saat proses instalasi, kita akan diminta memilih versi JDK yang akan digunakan. :shield:
:::

<img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/1734326167427.jpg" width="600">

Selain JDK, `yay` juga akan meminta izin kita untuk menginstal **dependencies** lainnya yang dibutuhkan oleh Flutter SDK. :package: Di sini kita hanya perlu mengonfirmasi saja. Berikut adalah dependencies yang akan diinstal dan membutuhkan konfirmasi dari kita. ✅

<img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/20241216122701.jpg" width="600">

<img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/20241216123126.jpg" width="600">

