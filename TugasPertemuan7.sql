-- TUGAS 7

-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
DELIMITER $$
CREATE PROCEDURE inputPelanggan(kode VARCHAR(11), nama_pelanggan VARCHAR(255), jk VARCHAR(1), tmp_lahir VARCHAR(50), tgl_lahir DATE, email VARCHAR(255), kartu_id INT(11), alamat VARCHAR(255), id_pelanggan INT(11))
BEGIN
    INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat) VALUES (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat);
    SET id_pelanggan = LAST_INSERT_ID();
END $$
DELIMITER ;

CALL inputPelanggan('007', 'Rendi', 'L', 'Lampung', '1995-10-12', 'rendi@gmail.com', 2,'Lampung Tengah',7);

-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
DELIMITER $$
CREATE PROCEDURE showPelanggan()
BEGIN
    SELECT * FROM pelanggan;
END $$
DELIMITER ;

CALL showPelanggan();

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
DELIMITER $$
CREATE PROCEDURE inputProduk(kode VARCHAR(10),nama VARCHAR(255),harga_beli DOUBLE,harga_jual DOUBLE,stok INT(11),min_stok INT(11),jenis_produk_id VARCHAR(255))
BEGIN
    INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok,jenis_produk_id) 
    VALUES (kode, nama, harga_beli, harga_jual, stok, min_stok,jenis_produk_id);
END $$
DELIMITER ;

CALL inputProduk('KO001', 'Komputer Zyrex', 4000000, 5000000, 100, 50, 1);


-- Buat fungsi showProduk(), setelah itu panggil fungsinya
DELIMITER $$
CREATE PROCEDURE showProduk()
BEGIN
    SELECT * FROM produk;
END $$
DELIMITER ;

CALL showProduk();

-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
DELIMITER $$
CREATE PROCEDURE totalPesanan()
BEGIN
    SELECT pelanggan.kode AS kode_pelanggan, pelanggan.nama_pelanggan, SUM(pesanan_item.qty) AS total_produk, SUM(pesanan_item.qty * pesanan_item.harga) AS total_harga 
    FROM pesanan_item JOIN pesanan ON pesanan_item.pesanan_id = pesanan.id JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id 
    GROUP BY pelanggan.kode, pelanggan.nama_pelanggan;
END $$
DELIMITER ;

CALL totalPesanan();


-- tampilkan seluruh pesanan dari semua pelanggan
DELIMITER $$
CREATE PROCEDURE showSemuaPesanan()
BEGIN
    SELECT pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.nama_pelanggan
    FROM pesanan JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id;
END $$
DELIMITER ;

CALL showSemuaPesanan();



-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
CREATE VIEW pesanan_produk_vw AS SELECT pesanan.id AS pesanan_id, pesanan.tanggal, pesanan.total, pelanggan.kode AS pelanggan_kode, pelanggan.nama_pelanggan, pelanggan.jk, pelanggan.tmp_lahir, pelanggan.tgl_lahir, pelanggan.email, pelanggan.kartu_id, produk.kode AS produk_kode, produk.nama AS produk_nama, produk.harga_jual, pesanan_item.qty, pesanan_item.harga FROM pesanan JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id JOIN pesanan_item pesanan_item ON pesanan.id = pesanan_item.pesanan_id
JOIN produk ON pesanan_item.produk_id = produk.id;

SELECT * FROM pesanan_produk_vw;