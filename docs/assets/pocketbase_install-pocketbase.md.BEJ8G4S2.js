import{_ as s,c as i,a2 as t,o as e}from"./chunks/framework.CHKAMmNZ.js";const h=JSON.parse('{"title":"Instalasi Pocketbase","description":"","frontmatter":{},"headers":[],"relativePath":"pocketbase/install-pocketbase.md","filePath":"pocketbase/install-pocketbase.md"}'),n={name:"pocketbase/install-pocketbase.md"};function l(p,a,k,o,c,r){return e(),i("div",null,a[0]||(a[0]=[t(`<br><br><h1 id="instalasi-pocketbase" tabindex="-1">Instalasi Pocketbase <a class="header-anchor" href="#instalasi-pocketbase" aria-label="Permalink to &quot;Instalasi Pocketbase&quot;">​</a></h1><hr><p>Untuk bisa menggunakan Pocketbase kita tidak perlu menginstallnya langsung pada sistem kita sebagaimna yang biasa kita lakukan saat menginstall database konvensional lainnya. kita hanya perlu mengunduh file binary atau executablenya.</p><p>untuk mengunduh file binary pocketbase dan sekaligus mengekstraknya di current directory:</p><div class="language-shell vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">shell</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;"># Unduh file</span></span>
<span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;">curl</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> -LO</span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;"> https://github.com/pocketbase/pocketbase/releases/download/v0.23.8/pocketbase_0.23.8_linux_amd64.zip</span></span></code></pre></div><div class="language-shell vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">shell</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#6A737D;--shiki-dark:#6A737D;"># Unzip file current directory</span></span>
<span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;">unzip</span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;"> pocketbase_0.23.8_linux_amd64.zip</span></span></code></pre></div><p>Berikut adalah command untuk menginstal Flutter SDK dari AUR:</p><div class="language-shell vp-adaptive-theme"><button title="Copy Code" class="copy"></button><span class="lang">shell</span><pre class="shiki shiki-themes github-light github-dark vp-code" tabindex="0"><code><span class="line"><span style="--shiki-light:#6F42C1;--shiki-dark:#B392F0;">yay</span><span style="--shiki-light:#005CC5;--shiki-dark:#79B8FF;"> -Sy</span><span style="--shiki-light:#032F62;--shiki-dark:#9ECBFF;"> flutter</span></span></code></pre></div><div class="info custom-block"><p class="custom-block-title">💡 <strong>Catatan:</strong></p><p>Ketika kita menginstal Flutter SDK menggunakan <code>yay</code>, secara otomatis akan terinstal <strong>JDK</strong> juga. Saat proses instalasi, kita akan diminta memilih versi JDK yang akan digunakan. 🛡️</p></div><img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/1734326167427.jpg" width="600"><p>Selain JDK, <code>yay</code> juga akan meminta izin kita untuk menginstal <strong>dependencies</strong> lainnya yang dibutuhkan oleh Flutter SDK. 📦 Di sini kita hanya perlu mengonfirmasi saja. Berikut adalah dependencies yang akan diinstal dan membutuhkan konfirmasi dari kita. ✅</p><img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/20241216122701.jpg" width="600"><img src="https://raw.githubusercontent.com/rizkia-as-actmp/kuliah_5_justdoit/refs/heads/main/public/20241216123126.jpg" width="600">`,15)]))}const u=s(n,[["render",l]]);export{h as __pageData,u as default};
