SELECT * FROM produk WHERE harga_beli * stok > 20000000;
SELECT SUM(stok - min_stok) as selisih from produk;
SELECT sum(stok) as total_asset from produk;
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
SELECT nama_pelanggan, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;

SELECT COUNT(*) as jumlah_pelanggan from pelanggan WHERE YEAR(tgl_lahir) = 1998;
SELECT COUNT(*) as jumlah_pelanggan from pelanggan WHERE tmp_lahir = 'Jakarta' AND jk = 'P';
SELECT SUM(stok) as total_stok from produk WHERE harga_jual < 10000;
SELECT COUNT(*) as jumlah_produk from produk WHERE  nama LIKE 'K%';
SELECT AVG(harga_jual) as harga_jual_rata2 from produk WHERE harga_beli * stok > 1000000;
SELECT MAX(stok) as stok_terbesar from produk;
SELECT COUNT(*) as jumlah_produk from produk WHERE stok < min_stok;
SELECT SUM(harga_beli * stok) as total_asset from produk;

SELECT id, nama, stok, case WHEN stok < min_stok THEN 'segera belanja' ELSE 'stok aman' END as informasi from produk;
SELECT id, nama_pelanggan, YEAR(NOW()) - YEAR(tgl_lahir) as umur, CASE WHEN YEAR(NOW()) - YEAR(tgl_lahir) < 17 THEN 'muda' WHEN YEAR(NOW()) - YEAR(tgl_lahir) BETWEEN 17 AND 55 THEN 'dewasa' ELSE 'tua' END as kategori_umur from pelanggan;
SELECT id, kode, nama, CASE WHEN kode = 'TV01' THEN 'DVD Player' WHEN kode = 'K001' THEN 'Rice Cooker' ELSE 'Tidak Ada' END as bonus from produk;

SELECT tmp_lahir, COUNT(*) as jumlah from pelanggan GROUP BY tmp_lahir;
SELECT jenis_produk_id, COUNT(*) as jumlah from produk GROUP BY jenis_produk_id;
SELECT * FROM pelanggan WHERE YEAR(NOW()) - YEAR(tgl_lahir) < (SELECT AVG(YEAR(NOW()) - YEAR(tgl_lahir)) FROM pelanggan);
SELECT * FROM produk WHERE harga_beli * stok > (SELECT AVG(harga_beli * stok) FROM produk);
SELECT * FROM pelanggan WHERE kartu_id IN (SELECT id FROM kartu WHERE iuran > 90000);
SELECT * FROM produk WHERE harga_beli * stok < (SELECT AVG(harga_beli * stok) FROM produk);
SELECT * FROM pelanggan WHERE kartu_id IN (SELECT id FROM kartu WHERE diskon > 0.03);









