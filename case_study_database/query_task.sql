use case_study;
 
-- task 2
select * from nhan_vien
where (ho_ten like "h%" or ho_ten like "t%" or ho_ten like "k%" ) and char_length(ho_ten) <= 15;

-- task 3
select * from khach_hang 
where ((year(now()) - year(ngay_sinh) between 18 and 50) and (dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị")); 
 
 -- task 4
 select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) as so_lan_dat_phong from loai_khach lk
 join khach_hang kh on kh.ma_loai_khach = lk.ma_loai_khach 
 join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
 where ten_loai_khach = "Diamond"
 group by kh.ma_khach_hang;
 
 -- task 5
 select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
 ifnull(dv.chi_phi_thue + hdct.so_luong*dvdk.gia, 0) as tong_tien
 from khach_hang kh
 left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 group by kh.ma_khach_hang;
 
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
where  year(hd.ngay_lam_hop_dong) = 2021
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
 ;
 