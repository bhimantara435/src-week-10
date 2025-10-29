# **Laporan Praktikum Flutter – Master Plan App**

**Nama:** Muhammad Bhimantara Wira Eka Putra
**Kelas:** SIB 3C
**No. Absen:** 25
**Mata Kuliah:** Pemrograman Mobile
**Jurusan:** Teknologi Informasi
**Program Studi:** D-IV Sistem Informasi Bisnis

---

### Langkah 1 — Membuat Struktur Folder dan File Utama

Pada langkah pertama, dilakukan pembuatan struktur awal proyek Flutter menggunakan perintah:

* Membuat project Flutter di VS Code
  ![Langkah ke 1](image/image.png)

### Langkah 2 — Membuat Class Task
Membuat class `Task` pada folder `models/` untuk merepresentasikan satu tugas dengan atribut `description` (deskripsi tugas) dan `complete` (status selesai).

![Langkah ke 2](image/Screenshot%202025-10-29%20143459.png)


### Langkah 3 — Membuat Class Plan
Membuat class `Plan` untuk menyimpan daftar tugas (`tasks`) dan nama rencana (`name`). Class ini merepresentasikan satu perencanaan kegiatan.

![Langkah ke 3](image/Screenshot%202025-10-29%20143643.png)

### Langkah 4
Membuat file `data_layer.dart` berisi class `Plan` dan `Task` untuk mendefinisikan struktur data rencana dan tugas.


![Langkah ke 4](image/Screenshot%202025-10-29%20144448.png)

### Langkah 5
Membuat file `plan_screen.dart` di folder `screens` sebagai tampilan utama aplikasi.

![Langkah ke 5](image/Screenshot%202025-10-29%20144707.png)

### Langkah 6
Membuat StatefulWidget bernama PlanScreen sebagai dasar tampilan utama.

![Langkah ke 6](image/Screenshot%202025-10-29%20144707.png)


### Langkah 7
Menambahkan inisialisasi objek Plan dan membuat tombol tambah tugas (FloatingActionButton).


![Langkah ke 7](image/Screenshot%202025-10-29%20145402.png)

### Langkah 8
Menambahkan ListView untuk menampilkan daftar tugas secara dinamis.


![Langkah ke 8](image/Screenshot%202025-10-29%20145538.png)
