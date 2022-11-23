# Tugas PAS: Online Pharmacy
Proyek Akhir Semester PBP 2022-2023 Kelompok B01.

## Daftar Anggota dan Pembagian Tugas
Kelompok B01:
- Elang Permana: Order
- Nadhira Shahnaz Zain: Pharmacy
- Naufal Weise Widyatama: Medicine
- Rafa Maritza: Market
- Taqiya Zayin Hanafie: Customer

## Deskripsi Aplikasi
Aplikasi ini bernama online pharmacy. Aplikasi ini merupakan aplikasi versi mobile dari aplikasi yang dibuat untuk proyek tengah semester.
Aplikasi online pharmacy adalah aplikasi yang menyediakan layanan pembelian obat secara online. Aplikasi ini menghubungkan pembeli dengan apotek dalam jual beli obat-obatan.

## Daftar Modul dan Fitur
Daftar modul yang akan diimplementasi:
- Customer<br>
Melihat dan Mengubah profil kustomer. Model yang dibuat: Customer.
- Pharmacy<br>
Melihat dan menambahkan data apotek. (untuk admin aplikasi). Model yang dibuat: Pharmacy.
- Market<br>
Laman untuk list obat yang dapat dibeli (untuk customer). Fitur search obat.
- Medicine<br>
Melihat dan menambahkan data obat. (untuk admin aplikasi). Model yang dibuat: Medicine.
- Order<br>
Laman membuat order baru (untuk customer). Laman melihat order (untuk admin). Model yang dibuat: Order.

## Role
Role atau peran pengguna beserta deskripsinya:

### Admin Aplikasi
Dapat melakukan:
- Melihat dan menambahkan data obat
- Melihat dan menambahkan data apotek
- Melihat daftar orderan obat
<br>

### Customer
Dapat melakukan:
- Mengubah profil dirinya
- Melihat list obat yang dapat dibeli
- Memesan obat

## Alur Pengintegrasian dengan Web
Semua modul aplikasi ini menggunakan API yang tersedia di web online pharma, yang merupakan proyek tengah semester.
Form di aplikasi ini akan melakukan request POST ke aplikasi web online-pharma ke endpoint modul yang bersesuaian.
Selain itu, data aplikasi diambil menggunakan request GET dari aplikasi web online-pharma.
