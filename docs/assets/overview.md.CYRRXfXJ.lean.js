import{V as l}from"./chunks/Card.vue_vue_type_style_index_0_lang.DQG-VFMV.js";import{_ as k,o as i,c as r,j as e,t as n,a as o,G as t,a2 as u}from"./chunks/framework.CHKAMmNZ.js";const m={props:{title:{type:String,required:!0},description:{type:String,required:!0},to:{type:String,required:!1}}},p=["href"],b={class:"card-content"},h={key:1,class:"card"},c={class:"card-content"};function f(d,g,a,P,_,j){return i(),r("div",null,[a.to?(i(),r("a",{key:0,href:a.to,class:"card",rel:"noopener noreferrer"},[e("div",b,[e("h3",null,n(a.title),1),e("p",null,n(a.description),1)])],8,p)):(i(),r("div",h,[e("div",c,[e("h3",null,n(a.title),1),e("p",null,n(a.description),1)])]))])}const s=k(m,[["render",f]]),y={style:{display:"grid","grid-template-columns":"repeat(2, 1fr)",gap:"16px"}},R=JSON.parse('{"title":"Teknologi Yang Digunakan 🛠️","description":"","frontmatter":{},"headers":[],"relativePath":"overview.md","filePath":"overview.md"}'),v={name:"overview.md"},q=Object.assign(v,{setup(d){return(g,a)=>(i(),r("div",null,[a[0]||(a[0]=e("h1",{id:"teknologi-yang-digunakan",tabindex:"-1"},[o("Teknologi Yang Digunakan 🛠️ "),e("a",{class:"header-anchor",href:"#teknologi-yang-digunakan","aria-label":'Permalink to "Teknologi Yang Digunakan :hammer_and_wrench:"'},"​")],-1)),a[1]||(a[1]=e("hr",null,null,-1)),a[2]||(a[2]=e("p",null,"Berikut adalah teknologi yang saya gunakan dalam membangun project ini:",-1)),e("div",y,[t(s,{title:"Flutter",to:"#flutter"}),t(s,{title:"Riverpod",to:"#riverpod"}),t(s,{title:"Pocketbase",to:"#pocketbase"})]),a[3]||(a[3]=e("br",null,null,-1)),a[4]||(a[4]=e("h3",{id:"flutter",tabindex:"-1"},[e("strong",null,"Flutter"),o(" 🐦 "),e("a",{class:"header-anchor",href:"#flutter","aria-label":'Permalink to "**Flutter** :bird:"'},"​")],-1)),a[5]||(a[5]=e("p",null,"Flutter adalah open source SDK untuk membuat UI multiplatform dengan hanya menggunakan single code base. Flutter saat ini menggunakan rendering engine Impeller berperforma tinggi dengan bahasa pemrograman Dart.",-1)),t(l,{title:"Fireship: Flutter in 100 seconds",src:"https://www.youtube.com/embed/lHhRhPV--G0"}),a[6]||(a[6]=u('<br><h3 id="riverpod" tabindex="-1"><strong>Riverpod</strong> 🌱 <a class="header-anchor" href="#riverpod" aria-label="Permalink to &quot;**Riverpod** :seedling:&quot;">​</a></h3><p>Riverpod adalah framework manajemen state (caching framework) secara reaktive untuk aplikasi yang dibuat menggunakan Flutter atau Dart.</p><div class="info custom-block"><p class="custom-block-title">INFO</p><p><strong>Reactive State Management</strong> 💡 Artinya, setiap kali ada perubahan pada data atau state, semua bagian aplikasi yang bergantung pada data tersebut secara otomatis bereaksi dan memperbarui tampilannya tanpa perlu campur tangan manual.</p></div><br><h3 id="pocketbase" tabindex="-1"><strong>Pocketbase</strong> 📦 <a class="header-anchor" href="#pocketbase" aria-label="Permalink to &quot;**Pocketbase** :package:&quot;">​</a></h3><p>Pocketbase adalah program backend mini yang menyediakan basic fungsionalitas untuk mengelola database. Di dalam Pocketbase ini sudah tertanam database SQLite sehingga dengan menjalankan binary dari Pocketbase ini kita sudah memiliki database SQLite tanpa lagi harus menginstallnya. Basic fungsionalitas yang ada seperti authentication, authorization, operasi basic CRUD untuk setiap tabel/collection, dan banyak lagi. Kita juga bisa melakukan perubahan pada fungsionalitas yang ada ataupun menambah yang baru.</p>',7)),t(l,{title:"Fireship: PocketBase... The Ultimate Side-Hustle Backend?",src:"https://www.youtube.com/embed/Wqy3PBEglXQ"}),a[7]||(a[7]=u('<br><br><h1 id="motivasi" tabindex="-1">Motivasi ✨ <a class="header-anchor" href="#motivasi" aria-label="Permalink to &quot;Motivasi :sparkles:&quot;">​</a></h1><hr><p>Alasan saya menggunkan Riverpod dan Pocketbase untuk project eksplorasi Flutter kali ini adalah:</p><ul><li><p><strong>Riverpod</strong> memudahkan bagi saya untuk membangun project Flutter ini dengan struktur kode yang saya inginkan. Riverpod memudahkan untuk saya memisahkan kode untuk mengatur data dan state pada kategorinya masing-masing. Pemisahan kode membuat kode lebih bersih, rapi, dan mudah diubah. Pemisahan ini juga membuat kode menjadi modular.</p></li><li><p><strong>Pocketbase</strong>: Alasan saya menggunakan Pocketbase adalah karena fungsionalitas bawaannya yang cukup lengkap sehingga saya tidak perlu membuat kode boilerplate seperti basic CRUD. Hal ini membuat saya memiliki lebih banyak waktu untuk fokus pada hal-hal lain yang memang saya ingin pelajari. Selain itu, saya juga ingin melihat potensi dari framework Pocketbase ini untuk meng-handle side project saya ke depannya, yang mana pada side project tersebut, masalah backend tidak krusial dan bukan menjadi titik fokus pengembangan.</p></li></ul><br><br><h1 id="referensi" tabindex="-1">Referensi 📚 <a class="header-anchor" href="#referensi" aria-label="Permalink to &quot;Referensi :books:&quot;">​</a></h1><hr><ul><li><a href="https://youtu.be/lHhRhPV--G0?feature=shared" target="_blank" rel="noreferrer">Fireship: Flutter in 100 seconds</a></li><li><a href="https://riverpod.dev/" target="_blank" rel="noreferrer">Dokumentasi Riverpod</a></li><li><a href="https://youtu.be/Wqy3PBEglXQ?feature=shared" target="_blank" rel="noreferrer">Fireship: PocketBase... The Ultimate Side-Hustle Backend?</a></li><li><a href="https://pocketbase.io/" target="_blank" rel="noreferrer">Dokumentasi Pocketbase</a></li></ul>',11))]))}});export{R as __pageData,q as default};
