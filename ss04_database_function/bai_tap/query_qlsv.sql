use ss04_bt_qlsv;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select sub.*, max(credit) from `subject` sub ;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select sub.*, max(mark) from `subject` sub 
join mark m on sub.sub_id = m.sub_id
group by sub_id
having max(mark) >= all( select avg(mark) from mark group by mark.sub_id);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.*, avg(mark) as diem_trung_binh from student s
join mark m on s.student_id = m.student_id
group by student_id
order by diem_trung_binh desc
;