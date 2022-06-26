use case_study;
 
-- task 2
select * from nhan_vien
where (ho_ten like "h%" or ho_ten like "t%" or ho_ten like "k%" ) and char_length(ho_ten) <= 15;

-- task 3
select * from khach_hang 
where ((year(curdate()) - year(ngay_sinh) between 18 and 50) and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị")); 
 
 -- task 4
 select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) as so_lan_dat_phong from loai_khach lk
 join khach_hang kh on kh.ma_loai_khach = lk.ma_loai_khach 
 join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
 where ten_loai_khach = "Diamond"
 group by kh.ma_khach_hang;
 
 -- task 5
 select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
 sum(dv.chi_phi_thue + ifnull(hdct.so_luong*dvdk.gia, 0)) as tong_tien
 from khach_hang kh
 left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 group by hd.ma_hop_dong;
 
 -- task 6
 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
 group by dv.ma_dich_vu having dv.ma_dich_vu not in 
 (select dv.ma_dich_vu from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
 where (month(hd.ngay_lam_hop_dong) between 1 and 3) and year(hd.ngay_lam_hop_dong) = 2021);
 
-- task 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(ngay_lam_hop_dong) = 2020
group by dv.ma_dich_vu
having dv.ma_dich_vu not in 
( select dv.ma_dich_vu from dich_vu dv
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(ngay_lam_hop_dong) = 2021);
 
-- task 8
-- c1:
select khach_hang.ho_ten from khach_hang
group by khach_hang.ho_ten;

-- c2:
select distinct khach_hang.ho_ten from khach_hang
group by khach_hang.ho_ten;

-- c3:
select khach_hang.ho_ten from khach_hang
group by khach_hang.ho_ten
union
select khach_hang.ho_ten from khach_hang
group by khach_hang.ho_ten;

-- task 9
select month(hd.ngay_lam_hop_dong) , count(hd.ngay_lam_hop_dong) as so_luong_khach_hang from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021
group by month(hd.ngay_lam_hop_dong) 
order by month(hd.ngay_lam_hop_dong);

-- task 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong;

-- task 11
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong 
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where ( ten_loai_khach = "Diamond") and ( dia_chi like "%Vinh" or dia_chi like "%Quảng Ngãi");
 
-- task 12
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong), hd.tien_dat_coc from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where (month(hd.ngay_lam_hop_dong) between 10 and 12) and year(hd.ngay_lam_hop_dong) = 2020
group by hd.ma_hop_dong not in 
(select hd.ngay_lam_hop_dong from hop_dong
where (month(hd.ngay_lam_hop_dong) between 1 and 6) and year(hd.ngay_lam_hop_dong) = 2021);

-- task 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem , sum(hdct.so_luong) as so_luong_dich_vu_di_kem from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) >= all (select sum(hdct.so_luong) from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem group by dvdk.ma_dich_vu_di_kem);
 
-- task 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung = 1 
order by ma_hop_dong ;

-- task 15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi from bo_phan bp
join nhan_vien nv on bp.ma_bo_phan = nv.ma_bo_phan
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
left join hop_dong hd on nv.ma_nhan_vien =  hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3 
order by ma_nhan_vien;

-- task 16
update nhan_vien nv
set `check` = 1
where nv.ma_nhan_vien in ( select * from (select nv.ma_nhan_vien from nhan_vien nv
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.ma_nhan_vien not in(
select nv.ma_nhan_vien from nhan_vien nv
right join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
group by ma_nhan_vien ))temp );
select ma_nhan_vien, ho_ten from nhan_vien where `check` = 1;

-- task 17
update khach_hang 
set ma_loai_khach = 1 
where ma_loai_khach in (select * from(
select lk.ma_loai_khach from loai_khach lk
left join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where (year(hd.ngay_lam_hop_dong) = 2021) and (ifnull(dv.chi_phi_thue,0) + ifnull(so_luong * dvdk.gia,0) > 10000000)
group by kh.ma_khach_hang
having lk.ma_loai_khach = 2)temp);

-- task 18
update khach_hang kh
set `check` = 1
where kh.ma_khach_hang in ( select * from (select kh.ma_khach_hang from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) = 2020
group by kh.ma_khach_hang )temp );

select ma_khach_hang, ho_ten from khach_hang where `check` = 1;
 
 -- task 19
update dich_vu_di_kem dvdk
set dvdk.gia = dvdk.gia * 2 where ma_dich_vu_di_kem in ( select * from (
select dvdk.ma_dich_vu_di_kem from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where (hdct.so_luong > 10) and year(hd.ngay_lam_hop_dong) = 2020 
group by dvdk.gia) temp) ;
 
 -- task 20
 select nv.ma_nhan_vien as id , nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv
 union 
 select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh