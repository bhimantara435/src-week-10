# **Laporan Praktikum Flutter – Master Plan App**

**Nama:** Muhammad Bhimantara Wira Eka Putra
**Kelas:** SIB 3C
**No. Absen:** 25
**Mata Kuliah:** Pemrograman Mobile
**Jurusan:** Teknologi Informasi
**Program Studi:** D-IV Sistem Informasi Bisnis

---

### Praktikum 1

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


### Langkah 9
Menambahkan widget ListTile dengan Checkbox dan TextFormField untuk setiap item tugas.
![Langkah ke 9](image/Screenshot%202025-10-29%20145731.png)

### Langkah 10
Menambahkan ScrollController untuk mengatur perilaku scroll agar keyboard tertutup otomatis saat user menggulir layar.

![Langkah ke 10](image/Screenshot%202025-10-29%20145843.png)

### Langkah 11
Menambahkan method initState() untuk menginisialisasi ScrollController dan menambahkan listener.

![Langkah ke 11](image/Screenshot%202025-10-29%20145952.png)

### Langkah 12
Menambahkan properti controller dan keyboardDismissBehavior pada ListView agar pengalaman input lebih nyaman di iOS/Android.


![Langkah ke 12](image/Screenshot%202025-10-29%20150057.png)

### Langkah 13
Menambahkan method dispose() untuk membersihkan ScrollController saat widget tidak digunakan lagi.

![Langkah ke 13](image/Screenshot%202025-10-29%20150200.png)


### Langkah 14 – Jalankan dan Uji Aplikasi
Menjalankan aplikasi Flutter menggunakan perintah flutter run, kemudian menguji semua fitur.

![Langkah ke 14](image/1222.jpg)

### Tugas Praktikum 1

1. Maksud Langkah 4

Langkah 4 bertujuan membuat file data_layer.dart yang berisi class Plan dan Task untuk mendefinisikan struktur data aplikasi. Hal ini dilakukan agar logika data (Model) dipisahkan dari tampilan (View), sehingga kode lebih terstruktur, mudah dikembangkan, dan perubahan data dapat dikelola secara terpusat tanpa memengaruhi UI langsung.

2. Variabel plan di Langkah 6 dan alasan dibuat konstanta

Variabel plan digunakan untuk menyimpan state daftar tugas yang sedang aktif. Pada awalnya dibuat sebagai konstanta (const Plan()) agar Flutter dapat mengoptimalkan penggunaan memori dan memastikan nilai awal aman serta stabil sebelum pengguna menambah atau mengubah task menggunakan setState(). Hal ini juga mencegah kesalahan null atau error saat build pertama kali.

3. Hasil Langkah 9

Pada langkah 9 dibuat widget _buildTaskTile() yang menampilkan setiap task dalam bentuk ListTile dengan Checkbox dan TextFormField. Fungsi ini memungkinkan pengguna menandai task selesai atau mengubah deskripsinya secara langsung, sehingga daftar tugas menjadi interaktif dan dinamis. Hasil capture GIF menunjukkan bagaimana task dapat ditambah, diedit, dan dicentang, dengan tampilan UI langsung terupdate.

4. Kegunaan method Langkah 11 dan 13 dalam lifecycle state

Method initState() pada langkah 11 digunakan untuk menginisialisasi ScrollController dan menambahkan listener, sehingga saat user melakukan scroll semua TextField kehilangan fokus dan keyboard otomatis tertutup. Sedangkan dispose() pada langkah 13 dipanggil ketika widget dihapus dari widget tree untuk membersihkan resource, mencegah memory leak, dan memastikan manajemen lifecycle widget berjalan dengan baik sesuai prinsip Flutter.




### Praktikum 2

### Langkah 1 — Membuat Folder provider dan File provider
* folder dan file
  ![Langkah ke 1](image/Screenshot%202025-11-03%20204459.png)
  ![Langkah ke 1](image/Screenshot%202025-11-03%20204544.png)


### Langkah 2: Edit main.dart
* edit
  ![Langkah ke 2](image/Screenshot%202025-11-03%20205026.png)

### Langkah 3: Tambah method pada model plan.dart
 * Menambahkan code ke dalam file plan.dart
  ![Langkah ke 3](image/Screenshot%202025-11-03%20205323.png)

### Langkah 4: Pindah ke PlanScreen
* hapus code
  ![Langkah ke 4](image/Screenshot%202025-11-03%20205825.png)

### Langkah 5: Edit method _buildAddTaskButton
* Edit method dalam file plan_screen
  ![Langkah ke 5](image/Screenshot%202025-11-03%20210250.png)

### Langkah 6: Edit method _buildTaskTile
* Menambahkan parameter BuildContext context, Ganti TextField menjadi TextFormField.
  ![Langkah ke 6](image/Screenshot%202025-11-03%20210742.png)






