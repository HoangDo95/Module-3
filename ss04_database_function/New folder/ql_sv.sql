create database ss04_bt_qlsv;

use ss04_bt_qlsv;

create table class(
	class_id int primary key auto_increment,
    class_name varchar(60),
    star_date datetime,
    status bit
);

create table student(
    student_id int primary key auto_increment,
    student_name varchar(30)  ,
    address varchar(50),
    phone varchar(20),
    status bit,
    class_id int,
    foreign key (class_id) references class (class_id)
);
create table `subject`(
    sub_id int primary key auto_increment,
    sub_name varchar(30),
    credit tinyint not null default 1 check ( credit >= 1 ),
    status bit default 1
);

create table mark(
    mark_id int primary key auto_increment,
    sub_id int ,
    student_id int,
    mark float default 0 check ( mark between 0 and 100),
    exam_times tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references subject (sub_id),
    foreign key (student_id) references student (student_id)
);

insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);

insert into student (student_name, address, phone, status, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name, address, status, class_id)
values ('Hoa', 'Hai phong', 1, 1);
insert into student (student_name, address, phone, status, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into `subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert into mark (sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);