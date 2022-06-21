create database ss02_b2;

use ss02_b2;

create table customer(
	c_id int primary key auto_increment,
    c_name varchar(50),
    c_age int
);

create table `order`(
	o_id int primary key auto_increment,
    o_date date,
    o_tolal_price int,
    id_customer int,
    foreign key (id_customer) references customer(c_id)
);

create table product(
	p_id int primary key auto_increment,
    p_name varchar(50),
    p_price int
);

create table order_detail(
	od_qty int,
    id_order int,
    id_product int,
    primary key (id_order , id_product),
    foreign key (id_order) references `order`(o_id),
    foreign key (id_product) references product(p_id)
);