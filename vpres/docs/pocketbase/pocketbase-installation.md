
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
Setelah mendownload dan menekstrak binary pocketbase. kita bisa langsung jalankan pocketbase dengan comman berikut:
```shell
./pocketbase serve
```
berikut adalah yang terlihat pada terminal emulator ketika kita running command diatas. 
```shell
rizkia@rizkia-eos-lnx 00:33:47
pb editor $ ./pocketbase serve
2025/01/01 01:40:12 Server started at http://127.0.0.1:8090
├─ REST API:  http://127.0.0.1:8090/api/
└─ Dashboard: http://127.0.0.1:8090/_/

```
Dari hasil diatas kita mendapatkan beberapa informasi yaitu
- Untuk akses admin dashboard : http://127.0.0.1:8090/_/
- URL REST API yang bisa kita gunakan pada aplikasi atau postman : http://127.0.0.1:8090/api/


<img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/1734326167427.jpg" width="600">

Selain JDK, `yay` juga akan meminta izin kita untuk menginstal **dependencies** lainnya yang dibutuhkan oleh Flutter SDK. :package: Di sini kita hanya perlu mengonfirmasi saja. Berikut adalah dependencies yang akan diinstal dan membutuhkan konfirmasi dari kita. ✅

<img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/20241216122701.jpg" width="600">

<img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/20241216123126.jpg" width="600">
