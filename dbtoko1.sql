--
-- Database: `dbtoko1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_produk`
--

CREATE TABLE jenis_produk (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama varchar(45)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kartu`
--

CREATE TABLE kartu (
  id int(11) AUTO_INCREMENT PRIMARY KEY,
  kode varchar(6) UNIQUE,
  nama varchar(30) NOT NULL,
  diskon double,
  iuran double
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE pelanggan (
  id int(11) AUTO_INCREMENT PRIMARY KEY,
  kode varchar(10) UNIQUE,
  nama varchar(45),
  jk char(1),
  tmp_lahir varchar(30),
  tgl_lahir date,
  email varchar(45),
  kartu_id int not null references kartu (id)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE pembayaran (
  id int not null auto_increment primary key,
  nokuitansi varchar(10) unique,
  tanggal date,
  jumlah double,
  ke int,
  pesanan_id int not null references pesanan (id)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  id int(11) not null auto_increment primary key,
  tanggal date,
  nomor varchar(10) unique,
  produk_id int(11) not null references produk (id),
  jumlah int(11),
  harga double,
  vendor_id int(11) not null references vendor (id)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE pesanan (
  id int not null auto_increment primary key,
  tanggal date,
  total double,
  pelanggan_id int not null references pelanggan (id)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_items`
--

CREATE TABLE pesanan_items (
  id int(11) auto_increment primary key,
  produk_id int(11) not null references produk (id),
  pesanan_id int(11) not null references pesanan (id),
  qty int(11),
  harga double
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE produk (
  id int(11) auto_increment primary key,
  kode varchar(10) unique,
  nama varchar(45),
  harga_beli double,
  harga_jual double,
  stok int(11),
  min_stok int(11),
  jenis_produk_id int(11) not null references jenis_produk (id)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendor`
--

CREATE TABLE vendor (
  id int(11) auto_increment primary key,
  nomor varchar(4) unique,
  nama varchar(40),
  kota varchar(30),
  kontak varchar(30)
);

--
-- menambahkan kolom pada tabel `pelanggan`
--
ALTER TABLE pelanggan
  ADD COLUMN IF NOT EXISTS
  alamat varchar(40) AFTER kartu_id;

--
-- merubah kolom nama pada tabel `pelanggan`
--
ALTER TABLE pelanggan
  CHANGE nama nama_pelanggan;

--
-- edit tipe data kolom nama_pelanggan pada tabel `pelanggan`
--
ALTER TABLE pelanggan
  MODIFY nama_pelanggan varchar(50);


