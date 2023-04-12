-- Soal 2.1
SELECT * FROM produk ORDER BY harga_jual DESC;
SELECT kode, nama, tmp_lahir, tgl_lahir from pelanggan;
SELECT kode,nama, stok from produk WHERE stok=4;
SELECT * from pelanggan WHERE tmp_lahir='jakarta';
SELECT kode, nama, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;

-- Soal 2.2
SELECT * from produk WHERE stok=3 OR stok=10;
SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;
SELECT * FROM produk WHERE min_stok > stok;
SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='P';
SELECT * from pelanggan WHERE id IN (2,4,6);
SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual<= 6000000;

-- Soal 2.3
SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
SELECT * FROM produk WHERE kode NOT LIKE 'M%';
SELECT * FROM produk WHERE kode LIKE 'TV%';
SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';
SELECT * FROM pelanggan WHERE tmp_lahir NOT IN ('Jakarta') AND nama_pelanggan LIKE '%yo%';
SELECT nama_pelanggan FROM pelanggan WHERE nama_pelanggan LIKE '_A%';

-- Soal 2.4
SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;
SELECT * from produk  ORDER BY harga_beli ASC LIMIT 1;
SELECT * from produk  ORDER BY stok DESC LIMIT 1;
SELECT * from produk  ORDER BY stok ASC LIMIT 2;
SELECT * from pelanggan  ORDER BY tgl_lahir DESC LIMIT 1;
SELECT * from pelanggan  ORDER BY tgl_lahir ASC LIMIT 1;


