drop database if exists ss05_demo;
create database ss05_demo ;

use ss05_demo;

create table product (
id int primary key auto_increment,
product_code varchar (45),
product_name varchar (45),
product_price double,
product_amount int,
product_description varchar (45),
product_status bit(1)
);

insert into product (id, product_code,product_name,product_price,product_amount,product_description,product_status) 
value 
(1, 'Honda', 'Sonic', 100, 5, 'Hàng mới', 1),
(2, 'Yamaha', 'R15', 150, 2, 'Hàng mới', 1),
(3, 'Suzuki', 'Satria', 200, 3, 'Hàng mới', 0)
;
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table product add unique ( product_code );

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index `index`  on product(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from product where product_code;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as select product_code,product_name,product_price,product_status from product;
select * from product_view;

-- Tiến hành sửa đổi view
update product_view set product_code = 1,
product_name = "Cbr150",
product_price = 120,
product_status = 1
where product_code = "Honda";

-- Tiến hành xoá view
delete from product_view
 where product_name = "Cbr150" ;
 
 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 delimiter //
 create procedure procedure_product()
 begin
 select * from product;
 end 
 // delimiter ;
 
 -- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure product_add( 
in product_code varchar(45) ,
in product_name varchar(45) ,
in product_price double ,
in product_amount int ,
in product_description varchar(45) ,
in product_status bit(1))

begin
insert into product(  product_code ,product_name ,product_price ,product_amount , product_description, product_status)
values ( product_code ,product_name ,product_price ,product_amount ,product_description ,product_status) ;
end 
// delimiter ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure product_update ( update_name varchar(45))

begin
update product set  product_name  = update_name 
where id = 3;
end
// delimiter ;
call product_update('Raider');

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure product_delete( delete_id int )
begin
	delete from product where id = delete_id;
end
// delimiter ;
call product_delete(2);

 
 