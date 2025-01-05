<br>
<br>

# Setup Environment :gear:
---

Selanjutnya, kita akan **setup environment variables** untuk **Android SDK** :robot: dan **JVM** :coffee: pada konfigurasi shell. Sebagai contoh, di sini saya menggunakan **bash**, sehingga saya akan mengonfigurasi file `~/.bashrc`. Yang kita konfigurasi adalah path menuju **Android SDK**, **JDK**, dan **platform tools**. Jadi, terlebih dahulu kita harus mengetahui lokasi instalasi program-program tersebut.

Berikut adalah konfigurasi environment variables yang dapat Anda tambahkan ke file `~/.bashrc`:

```shell
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
```

:::info :bulb: **Catatan:**  
Pastikan Anda menyesuaikan path di atas sesuai dengan lokasi instalasi **Android SDK** dan **JVM** di sistem Anda.
:::

---

Selanjutnya, kita harus menyetujui semua **Term and Conditions** sebelum menggunakan Flutter. :white_check_mark: Untuk melakukan ini, gunakan perintah berikut dengan `flutter doctor`:

```shell
sudo flutter doctor --android-licenses
```

