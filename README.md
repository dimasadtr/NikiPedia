Tentu, ini adalah draf README.md yang telah dirapikan dan diformat agar terlihat profesional dan mudah dibaca, berdasarkan teks yang Anda berikan.

-----

# NikiPedia: Ensiklopedia Hero Dota 2  Dota 2

NikiPedia adalah aplikasi *mobile* ensiklopedia hero Dota 2 yang dikembangkan menggunakan Flutter. Aplikasi ini menyediakan informasi lengkap mengenai para hero, mulai dari atribut dasar hingga *skill* (abilities), yang datanya diambil secara dinamis dari OpenDota API.

### Konteks Proyek

Proyek ini dikembangkan untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile.

-----

## ✨ Fitur Utama

  * **Media Informasi:** Menyediakan platform yang mudah digunakan untuk mempelajari hero-hero di Dota 2.
  * **Daftar Hero Dinamis:** Menampilkan seluruh daftar hero Dota 2 secara dinamis menggunakan data dari OpenDota API.
  * **Detail Hero Lengkap:** Menampilkan detail hero, termasuk atribut dasar (Strength, Agility, Intelligence), HP, Mana, tipe serangan, dan *role*.
  * **Tampilan Skill (Abilities):** Menampilkan semua *skill* yang dimiliki hero, lengkap dengan ikon dan deskripsinya.
  * **Pencarian & Filter:** Memudahkan pengguna mencari hero spesifik atau memfilter berdasarkan *role* mereka di dalam game.

-----

## 📱 Struktur Halaman Aplikasi

Aplikasi ini menggunakan `BottomNavigationBar` sebagai sistem navigasi utama untuk berpindah antar halaman.

1.  **Halaman Home (`home_page.dart`)**

      * Berfungsi sebagai halaman pembuka aplikasi.
      * Menampilkan daftar hero-hero yang sedang populer.

2.  **Halaman Daftar Hero (`heroes_page.dart`)**

      * Menampilkan **seluruh** hero Dota 2 dalam bentuk *grid* atau *list*.
      * Data diambil dari endpoint `api/heroStats`.
      * Setiap kartu hero dapat di-klik untuk diarahkan ke halaman detail.

3.  **Halaman Detail Hero (`hero_detail_page.dart`)**

      * Menampilkan informasi lengkap dari hero yang dipilih (gambar, nama, atribut, *role*, dll.).
      * Menampilkan kemampuan (*abilities*) dalam bentuk ikon bundar kecil.
      * Tata letak didesain agar menyerupai tampilan profil hero di dalam game Dota 2.

4.  **Halaman Profil (`profile_page.dart`)**

      * Menampilkan identitas pengembang 

5.  **Navigasi Utama (`main_page.dart`)**

      * File ini mengelola `BottomNavigationBar` yang memiliki tiga menu utama: **Home**, **Heroes**, dan **Profile**.

-----

## 🔌 API yang Digunakan

Aplikasi ini mengandalkan dua sumber API eksternal untuk mendapatkan datanya:

  * **Data Hero (OpenDota API):**
    ```
    https://api.opendota.com/api/heroStats
    ```
  * **Data Abilities (Dotaconstants):**
    ```
    https://raw.githubusercontent.com/odota/dotaconstants/master/build/abilities.json
    ```

-----

## 🚀 Cara Menjalankan Aplikasi

Pastikan Anda telah menginstal **Flutter SDK** di komputer Anda sebelum melanjutkan.

1.  **Clone Repositori**
    Ganti `[URL_GITHUB_ANDA]` dengan URL repositori Anda yang sebenarnya.

    ```bash
    git clone [URL_GITHUB_ANDA]
    ```

2.  **Pindah ke Direktori Proyek**

    ```bash
    cd NikiPedia
    ```

3.  **Unduh Dependencies**
    Jalankan perintah ini untuk mengunduh semua paket dan *dependency* yang diperlukan oleh proyek.

    ```bash
    flutter pub get
    ```

4.  **Jalankan Aplikasi**
    Pastikan Anda memiliki emulator yang berjalan atau perangkat fisik yang terhubung, lalu jalankan perintah:

    ```bash
    flutter run
    ```
