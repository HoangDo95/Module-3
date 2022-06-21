create database ss03_b2_quan_ly_bh;

use ss03_b2_quan_ly_bh;

create table customer(
	c_id int primary key auto_increment,
    c_name varchar(50),
    c_age int
);

create table `order`(
	o_id int primary key auto_increment,
    c_id int,
    o_date date,
    o_tolal_price int,
    foreign key (c_id) references customer(c_id)
);

create table product(
	p_id int primary key auto_increment,
    p_name varchar(50),
    p_price int
);

create table `order_detail`(
	od_qty int,
    o_id int,
    p_id int,
    primary key (o_id , p_id),
    foreign key (o_id) references `order`(o_id),
    foreign key (p_id) references product(p_id)
);

insert into customer (c_name, c_age) 
values ("minh quang" , 10),("ngoc oanh" , 20),("hong ha" , 50);

insert into `order` (c_id, o_date, o_tolal_price) 
values (1 , '2006-03-21', null),(2 , "2006-03-23", null),(1 , "2006-03-16", null);

insert into product (p_name, p_price)
values ("may giac" , 3), ("tu lanh" , 5),("dieu hoa" , 7),("quat" , 1),("bep dien" , 2);

insert into `order_detail` (od_qty, o_id, p_id)
values ( 3 , 1, 1), (7, 1, 3), (2, 1, 4), (1, 2, 1), (8, 3, 1), (4, 2, 5), (3, 2, 3);
