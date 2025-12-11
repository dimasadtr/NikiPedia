# NikiPedia: Ensiklopedia & Live Tracker Dota 2

**NikiPedia** adalah aplikasi *mobile* berbasis Flutter yang menyajikan informasi lengkap mengenai hero-hero Dota 2 serta memantau hasil pertandingan profesional (*Pro Matches*) secara *real-time*.

Aplikasi ini didesain dengan antarmuka **Modern Dark Mode** khas *gaming/esports*. 
Aplikasi ini saya kembangkan karena dua alasan utama. Pertama, dari sisi user experience, saya melihat adanya kebutuhan akan akses informasi Dota 2 yang cepat, ringan, dan nyaman dibaca di HP, terutama untuk memantau hasil pertandingan pro secara live.
Kedua, dari sisi akademik, proyek ini menjadi wadah bagi saya untuk menguji kemampuan dalam membangun aplikasi full-stack sederhana berbasis Flutter, mulai dari merancang arsitektur aplikasi, mengambil data dari API publik, hingga menyajikannya dalam UI yang user friendly.

### 📝 Konteks Proyek
Proyek ini dikembangkan untuk memenuhi tugas Ujian Akhir Semester (UAS) mata kuliah Pemrograman Mobile.

---

## ✨ Fitur Utama

* **🎨 Modern Esports UI:** Tampilan antarmuka bertema gelap (*Dark Mode*) dengan elemen gradasi, kartu transparan (*glassmorphism*), dan tipografi yang elegan.
* **🏠 Home Dashboard:** Menampilkan *Hero Banner* unggulan dan daftar hero populer dengan statistik kemenangan (*winrate*).
* **⚔️ Daftar Hero Lengkap:** Akses ke seluruh database hero Dota 2 yang diambil secara dinamis dari OpenDota API.
* **📊 Detail Hero Mendalam:** Informasi rinci mencakup atribut (Str/Agi/Int), peran (*Roles*), tipe serangan, hingga daftar *skill/abilities* lengkap.
* **🏆 Pro Matches Tracker:** Memantau hasil pertandingan profesional terbaru dari seluruh dunia, lengkap dengan skor, nama tim (Radiant vs Dire), nama liga, dan durasi pertandingan.
* **⚡ Performa Tinggi:** Menggunakan manajemen *state* yang efisien dan *caching* gambar untuk pengalaman pengguna yang mulus.

---

## 📱 Struktur Halaman Aplikasi

Aplikasi ini menggunakan `BottomNavigationBar` sebagai navigasi utama dengan tiga menu inti:

1.  **Halaman Home (`home_page.dart`)**
    * Halaman beranda dengan desain visual yang kuat.
    * Menampilkan **Hero Banner** besar dengan efek *overlay gradient*.
    * Bagian **Popular Heroes** dalam format *horizontal scroll*.

2.  **Halaman Daftar Hero (`heroes_page.dart`)**
    * Katalog lengkap hero Dota 2.
    * Data diambil dari endpoint `api/heroStats`.
    * Setiap kartu hero menampilkan nama, *primary attribute*, dan *role* utama.
      
3.  **Halaman Detail Hero (`hero_detail_page.dart`)**
    * Halaman detail yang muncul saat hero dipilih.
    * Menampilkan *Lore* hero, atribut dasar, dan ikon-ikon *skill*.

4.  **Halaman Matches (`match_page.dart`)**
    * Menampilkan daftar 20 pertandingan profesional terakhir.
    * Informasi mencakup: Nama Liga, Tim Pemenang (Hijau) vs Kalah (Putih), Skor Akhir, dan waktu pertandingan.
    * Data diambil dari endpoint `api/proMatches`.

---

## 🛠️ Teknologi & Paket yang Digunakan

* **Framework:** [Flutter](https://flutter.dev/) - SDK utama untuk pengembangan aplikasi.
* **Bahasa:** Dart - Bahasa pemrograman yang digunakan.
* **Google Fonts:** (`google_fonts`) - Untuk kustomisasi tipografi (Font *Rakkas* & *Poppins*).
* **HTTP:** (`http`) - Untuk melakukan request API ke OpenDota.
* **Icons:** (`cupertino_icons` / Material Icons) - Ikon bawaan untuk navigasi dan UI.

---

## 🔌 API Reference

Aplikasi ini menggunakan data publik dari **OpenDota API** & **DotaConstants**:

| Data | Sumber Endpoint |
| :--- | :--- |
| **Hero Stats** | `https://api.opendota.com/api/heroStats` |
| **Pro Matches** | `https://api.opendota.com/api/proMatches` |
| **Abilities** | `https://raw.githubusercontent.com/odota/dotaconstants/master/build/abilities.json` |

---

## 🚀 Cara Menjalankan Aplikasi

Pastikan Anda telah menginstal **Flutter SDK** di komputer Anda.

1.  **Clone Repositori**
    ```bash
    git clone (https://github.com/dimasadtr/NikiPedia.git)
    ```

2.  **Masuk ke Direktori Proyek**
    ```bash
    cd NikiPedia
    ```

3.  **Unduh Dependencies**
    Jalankan perintah ini untuk mengunduh paket (`http`, `google_fonts`, dll):
    ```bash
    flutter pub get
    ```

4.  **Jalankan Aplikasi**
    Pastikan emulator atau perangkat fisik sudah terhubung:
    ```bash
    flutter run
    ```

---

## 📞 Kontak & Support

Jika ada pertanyaan, masukan, atau kendala terkait pengembangan aplikasi ini, silakan hubungi:

* 📧 **Email:** (230605110101@student.uin-malang.ac.id)
* 🆔 **Identitas:** Dimas Aditya Ramadhan (230605110101)

---

## 📄 Lisensi

Project ini dikembangkan sebagai **Tugas Akhir Semester 5** pada mata kuliah **Pemrograman Mobile**.

* **Institusi:** UIN Maulana Malik Ibrahim Malang
* **Status:** *Educational Purpose / Academic Project*
