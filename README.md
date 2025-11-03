# Analisis Kinerja Bisnis Kimia Farma (2020-2023)

## Ringkasan Proyek

Proyek ini merupakan bagian dari *final task* program Big Data Analytics Virtual Internship yang diselenggarakan oleh Rakamin Academy bersama Kimia Farma. Tujuan utama proyek ini adalah untuk melakukan analisis mendalam terhadap kinerja bisnis Kimia Farma selama periode empat tahun (2020-2023) berdasarkan data transaksional.

Output dari proyek ini adalah sebuah *business intelligence dashboard* interaktif yang memvisualisasikan metrik-metrik kunci, tren penjualan, serta performa cabang di seluruh provinsi, sehingga dapat digunakan oleh manajemen untuk pengambilan keputusan strategis.

## Latar Belakang Masalah

Manajemen Kimia Farma memerlukan pemahaman yang komprehensif mengenai performa penjualan dari tahun 2020 hingga 2023. Data mentah yang tersedia masih terpisah dan belum dapat memberikan wawasan bisnis secara langsung. Oleh karena itu, tantangannya adalah:
1.  Mengintegrasikan berbagai sumber data (transaksi, produk, cabang, inventaris) menjadi satu sumber kebenaran (*single source of truth*).
2.  Menghitung metrik-metrik finansial kunci seperti `nett sales` dan `nett profit`.
3.  Mengidentifikasi cabang dan provinsi mana yang memiliki performa terbaik dan mana yang memerlukan perhatian lebih.
4.  Menyajikan seluruh wawasan tersebut dalam sebuah dashboard yang mudah diakses dan dipahami oleh para pemangku kepentingan.

## Tools & Teknologi

- **Penyimpanan & Pengolahan Data:** Google BigQuery
- **Bahasa Kueri:** SQL (Standard SQL)
- **Visualisasi Data & Dashboarding:** Google Looker Studio
- **Manajemen Kode:** Git & GitHub

## Sumber Data

Proyek ini menggunakan empat dataset utama dalam format CSV:

1.  **`kf_final_transaction`**: Data historis transaksi penjualan yang mencakup ID transaksi, tanggal, ID cabang, ID produk, harga, diskon, dan rating dari pelanggan.
2.  **`kf_kantor_cabang`**: Data master mengenai cabang-cabang Kimia Farma, termasuk nama, kota, provinsi, dan rating cabang.
3.  **`kf_product`**: Data master produk yang dijual, berisi informasi nama produk dan kategori.
4.  **`kf_inventory`**: Data mengenai stok produk di setiap cabang (tidak digunakan dalam tabel analisa akhir, namun merupakan bagian dari data yang disediakan).

## Metodologi Proyek

Proses analisis dilakukan melalui beberapa tahapan utama:

1.  **Data Loading**: Keempat dataset CSV diunggah ke Google BigQuery sebagai tabel terpisah di dalam dataset `kimia_farma`.
2.  **Data Transformation & Analysis (ETL)**: Sebuah kueri SQL dieksekusi untuk melakukan proses berikut:
    - **Menggabungkan (Join)** tabel `kf_final_transaction`, `kf_kantor_cabang`, dan `kf_product`.
    - **Membuat Kolom Baru**: Menghitung metrik-metrik turunan seperti `persentase_gross_laba` (berdasarkan logika bisnis), `nett_sales` (harga setelah diskon), dan `nett_profit` (keuntungan bersih).
    - **Menciptakan Tabel Agregat**: Hasil dari kueri tersebut disimpan dalam sebuah tabel analisa utama bernama `tabel_analisa`.
3.  **Data Visualization**: Tabel `tabel_analisa` dihubungkan ke Google Looker Studio sebagai sumber data untuk membuat dashboard interaktif yang mencakup berbagai visualisasi sesuai kebutuhan bisnis.
