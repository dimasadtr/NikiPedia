# NikiPedia App
Aplikasi ini merupakan proyek UTS mata kuliah Pemrograman Mobile yang dikembangkan menggunakan Flutter.  
Tema aplikasi adalah Dota 2 Hero Encyclopedia, sebuah aplikasi informasi berbasis API yang menampilkan data para hero dalam game Dota 2.

---

## Tujuan Aplikasi
Tujuan dari pengembangan aplikasi ini adalah untuk:
- Menyediakan media informasi bagi pengguna untuk mempelajari hero Dota 2
- Menampilkan daftar hero Dota 2 secara dinamis menggunakan API dari OpenDota.
- Menyediakan detail hero, termasuk atribut dasar seperti Strength, Agility, Intelligence, HP, dan Mana
- Menampilkan skill atau ability hero, lengkap dengan deskripsi dan icon abilities
- Mempermudah pencarian hero melalui fitur pencarian dan filter berdasarkan role
---

## Daftar Halaman
Aplikasi NikiPedia terdiri dari beberapa halaman utama yang saling terhubung melalui sistem navigasi berbasis Bottom Navigation Bar. Setiap halaman memiliki fungsi spesifik dalam menampilkan informasi hero dari permainan Dota 2 yang diperoleh melalui OpenDota API. Berikut penjelasan masing-masing halaman:
  1. Halaman Home (home_page.dart)
     Halaman ini berfungsi sebagai halaman pembuka aplikasi yang menampilkan daftar hero populer dari permainan Dota 2.

  2. Halaman Daftar Hero (heroes_page.dart)
    Halaman ini menampilkan seluruh hero Dota 2. Data hero diambil dari endpoint https://api.opendota.com/api/heroStats. Setiap kartu hero memuat gambar dan nama, dan apabila ditekan akan mengarahkan pengguna ke halaman detail hero. 

  3. Halaman Detail Hero (hero_detail_page.dart)
    Halaman ini menampilkan informasi lengkap tentang hero yang dipilih, termasuk gambar, nama, atribut utama, tipe serangan, serta peran (role). Selain itu, halaman ini juga menampilkan kemampuan (abilities) dalam bentuk ikon bundar kecil. Tata letak dibuat       menyerupai tampilan profil hero pada game Dota 2. Tombol arrow back di bagian kiri atas memungkinkan pengguna untuk kembali ke halaman sebelumnya.

  4. Halaman Profil (profile_page.dart)
    Halaman ini berfungsi untuk menampilkan identitas pengembang aplikasi atau informasi profil pengguna. Meskipun sederhana, halaman ini melengkapi struktur navigasi utama aplikasi dan dapat diperluas di masa depan untuk menambahkan fitur profil pengguna atau     informasi tambahan lainnya.

  5. Navigasi Utama (main_page.dart)
  Aplikasi menggunakan BottomNavigationBar sebagai sistem navigasi utama. Terdapat tiga menu utama yang dapat diakses, yaitu:
    - Home: Menampilkan hero populer.
    - Heroes: Menampilkan daftar lengkap hero.
    - Profile: Menampilkan profil pengguna
  ---

 ## API yang Digunakan
Aplikasi ini mengambil data dari OpenDota API:
- Data Hero:  
  `https://api.opendota.com/api/heroStats`  
- Data Abilities:  
  `https://raw.githubusercontent.com/odota/dotaconstants/master/build/abilities.json`

    ---
 
## Cara Menjalankan Aplikasi
1. Pastikan Anda telah menginstal Flutter komputer.
2. Clone repositori : git clone [URL_GITHUB_ANDA]
3. Pindah ke direktori proyek: cd NikiPedia
4. Jalankan perintah unduh semua dependency:: flutter pub get
6. Jalankan aplikasi dengan perintah: flutter run

