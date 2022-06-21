create database ss02_b1;
use ss02_b1;

create table phieu_xuat(
	so_px int primary key auto_increment,
    ngay_xuat date
);

create table vat_tu(
	ma_vt int primary key auto_increment,
    ten_vt varchar(50)
);

create table ct_px(
	dg_x int,
    sl_x int,
    id_px int,
    id_vt int,
    primary key (id_px, id_vt),
    foreign key (id_px) references phieu_xuat(so_px),
    foreign key (id_vt) references vat_tu(ma_vt)
);

create table phieu_nhap(
	so_pn int primary key auto_increment,
    ngay_nhap date	
);

create table ct_pn(
	dg_n int,
    sl_n int,
    id_vt int,
    id_pn int,
    primary key (id_vt, id_pn),
    foreign key (id_vt) references vat_tu(ma_vt),
    foreign key (id_pn) references phieu_nhap(so_pn)
);

create table don_dh(
	so_dh int primary key auto_increment,
    ngay_dh date
);

create table ct_dh(
	id_dondh int,
    id_vt int,
    primary key (id_dondh, id_vt),
    foreign key (id_dondh) references don_dh(so_dh),
    foreign key (id_vt) references vat_tu(ma_vt)
);

create table nha_cc(
	ma_ncc int primary key auto_increment, 
	ten_ncc varchar(50),
    dia_chi varchar(50),
    id_ncc int,
    foreign key (id_ncc) references don_dh(so_dh)
);

create table sdt_ncc(
	ma_ncc int primary key,
    sdt varchar(20),
    id_ncc int,
    foreign key(id_ncc) references nha_cc(ma_ncc)
);

