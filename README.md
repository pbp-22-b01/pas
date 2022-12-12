# Tugas PAS: Online Pharmacy
[![Release](https://github.com/pbp-22-b01/pas/actions/workflows/release.yml/badge.svg)](https://github.com/pbp-22-b01/pas/actions/workflows/release.yml)
[![Release Firebase](https://github.com/pbp-22-b01/pas/actions/workflows/release-firebase.yml/badge.svg)](https://github.com/pbp-22-b01/pas/actions/workflows/release-firebase.yml)

Proyek Akhir Semester PBP 2022-2023 Kelompok B01.

## Rilis Firebase
https://appdistribution.firebase.dev/i/31efa9ed594cc373

## Deskripsi Aplikasi
Aplikasi ini bernama online pharmacy. Aplikasi ini merupakan aplikasi versi mobile dari aplikasi yang dibuat untuk proyek tengah semester.
Aplikasi online pharmacy adalah aplikasi yang menyediakan layanan pembelian obat secara online. Aplikasi ini menghubungkan pembeli dengan apotek dalam jual beli obat-obatan.

## Daftar Modul dan Fitur
Daftar modul yang akan diimplementasi:
### Customer
- Melihat dan Mengubah profil kustomer. 
- Profil kustomer berisi nama, alamat, dan nomor telepon.
- Model yang dibuat: Customer. 
### Pharmacy
Fitur ini dibuat untuk admin aplikasi.
- Melihat list apotek yang berisi data lengkap (nama dan alamat).
- Menambahkan data apotek (nama dan alamat).
- Model yang dibuat: Pharmacy.

### Market
Fitur ini dibuat untuk kustomer. Dapat diakses user yang tidak belum login.
- Laman untuk list obat yang dapat dibeli. List obat mengandung informasi nama, stock, dan nama apotek obat berasal.
- Customer dapat mensearch obat sesuai namanya.

### Medicine
- Data lengkap obat berisi nama, stok, dan asal apotek.
- Melihat list obat dengan data tidak detail (hanya namanya saja). Bila item di list diklik, maka akan menunjukkan data lengkapnya.
- Menambahkan obat dengan data lengkap. Model yang dibuat: Medicine.

### Order
- Laman membuat order baru untuk customer. Order baru berisi obat yang ingin dibeli dan jumlahnya.
- Laman melihat list order untuk admin. List order ditampilkan dengan data nama obat, jumlah yang dibeli, dan nama asal apotek.
- Model yang dibuat: Order.

## Role
Role atau peran pengguna beserta deskripsinya:
Perihal kelengkapan data yang akan ditampilkan mengacu pada bagian fitur.
### Admin Aplikasi
Dapat melakukan:
- Melihat dan menambahkan data obat
- Melihat dan menambahkan data apotek
- Melihat daftar orderan obat

### Customer
Dapat melakukan:
- Mengubah profil dirinya
- Melihat list obat yang dapat dibeli
- Memesan obat

## Alur Pengintegrasian dengan Web
Semua modul aplikasi ini menggunakan API yang tersedia di web online pharma, yang merupakan proyek tengah semester.
Form di aplikasi ini akan melakukan request POST ke aplikasi web online-pharma ke endpoint modul yang bersesuaian.
Selain itu, data aplikasi diambil menggunakan request GET dari aplikasi web online-pharma.
