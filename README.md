# Tugas PAS: Online Pharmacy
[![Release](https://github.com/pbp-22-b01/pas/actions/workflows/release.yml/badge.svg)](https://github.com/pbp-22-b01/pas/actions/workflows/release.yml)
[![Release Firebase](https://github.com/pbp-22-b01/pas/actions/workflows/release-firebase.yml/badge.svg)](https://github.com/pbp-22-b01/pas/actions/workflows/release-firebase.yml)

Proyek Akhir Semester PBP 2022-2023 Kelompok B01.

## Daftar Anggota
Kelompok B01:
- Elang Permana: Order
- Nadhira Shahnaz Zain: Pharmacy
- Naufal Weise Widyatama: Medicine, Login
- Rafa Maritza: Market
- Taqiya Zayin Hanafie: Customer

## Rilis Firebase
https://appdistribution.firebase.dev/i/31efa9ed594cc373

## Deskripsi Aplikasi
Aplikasi ini bernama online pharmacy. Aplikasi ini merupakan aplikasi versi mobile dari aplikasi yang dibuat untuk proyek tengah semester.
Aplikasi online pharmacy adalah aplikasi yang menyediakan layanan pembelian obat secara online. Aplikasi ini menghubungkan pembeli dengan apotek dalam jual beli obat-obatan.

## Daftar Modul dan Fitur
Daftar modul yang akan diimplementasi:

### Customer
- Melakukan registrasi dengan data username, nama, alamat, dan nomor telepon.
- Melihat dan mengubah profil kustomer. 
- Profil Customer berisi nama, alamat, dan nomor telepon.
- Model yang dibuat: Customer.

### Pharmacy
Fitur ini dibuat untuk admin aplikasi.
- Melihat daftar data apotek yang mencakup nama dan alamat apotek.
- Menambahkan data apotek yang mencakup nama dan alamat apotek.
- Model yang dibuat: Pharmacy.

### Medicine
- Data lengkap obat berisi nama, stok, dan asal apotek.
- Melihat daftar obat dengan yang mencakup nama obat.
- Bila suatu obat di daftar diklik, maka akan menunjukkan nama, stok, dan asal apotek obat tersebut.
- Menambahkan obat dengan data yang mencakup nama, stok, dan asal apotek.
- Model yang dibuat: Medicine.

### Market
Fitur ini dibuat untuk Customer. Laman market dapat diakses user yang belum login.
- Laman untuk daftar obat yang dapat dibeli. Daftar obat mencakup informasi nama, stok, dan nama apotek.
- Customer dapat mencari obat sesuai namanya.

### Order
- Laman membuat order baru untuk customer. Order baru berisi obat yang ingin dibeli dan jumlahnya.
- Laman melihat daftar order untuk admin. List order ditampilkan dengan data nama obat, jumlah yang dibeli, dan nama asal apotek.
- Model yang dibuat: Order.

## Role
Role atau peran pengguna beserta deskripsinya.
Perihal kelengkapan data yang akan ditampilkan atau disimpan mengacu pada bagian fitur.

### Admin Aplikasi
Dapat melakukan:
- Melihat dan menambahkan data obat
- Melihat dan menambahkan data apotek
- Melihat daftar pesanan obat

### Customer
Dapat melakukan:
- Melakukan registrasi
- Mengubah profil dirinya
- Melihat daftar obat yang terdaftar di aplikasi
- Mencari obat yang terdaftar di aplikasi dengan namanya
- Memesan obat

## Alur Pengintegrasian dengan Web
Semua modul aplikasi ini menggunakan API yang tersedia di web online pharma, yang merupakan proyek tengah semester.
Form di aplikasi ini akan melakukan request POST ke aplikasi web online-pharma ke endpoint modul yang bersesuaian.
Selain itu, data aplikasi diambil menggunakan request GET dari aplikasi web online-pharma.
