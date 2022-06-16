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
 