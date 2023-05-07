--Buatlah bisnis proses pembayaran dengan menggunakan trigers, dengan skenario sebagai berikut :

--1. pelanggan memesan didalam table pesanan
--2. dilanjutkan dengan proses pembayaran di table pembayaran
--3. didalam table pembayaran tambahkan kolom status_pembayaran
--4. jika pesanan sudah dibayar maka status pembayaran akan berubah menjadi lunas 


delimiter $$
create trigger pemesanan after insert on pesanan
    for each row begin
set @total_pesanan = (select COUNT(*) from pesanan where pelanggan_id = NEW.pelanggan_id);
set @nokuitansi = ("INV"+(RAND()*100)+NEW.id);
insert into pembayaran value (@nokuitansi ,NEW.tanggal,@total_pesanan,NEW.pelanggan_id,"Menunggu Pembayaran");
end $$
delimiter ;

delimiter $$
create trigger status before update on pembayaran
    for each row begin
set @total = (select total from pesanan where id = NEW.pesanan_id);
if NEW.jumlah > @total then
set NEW.status_pembayaran = "Terbayar";
else
set NEW.status_pembayaran = "Menunggu Pembayaran";
end if;
end $$
delimiter ;