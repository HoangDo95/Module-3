CREATE DATABASE case_study2;

use case_study2;

CREATE TABLE position (
position_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50)
);

CREATE TABLE education_degree (
education_degree_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45)
); 

CREATE TABLE division (
division_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45)
);

CREATE TABLE `role` (
role_id INT PRIMARY KEY AUTO_INCREMENT,
`role_name` VARCHAR(255)
);

CREATE TABLE `user` (
user_name VARCHAR(255) PRIMARY KEY,
`password` VARCHAR(255)
);

CREATE TABLE user_role (
role_id int,
user_name VARCHAR(45),
FOREIGN KEY(role_id) REFERENCES  `role`(role_id),
FOREIGN KEY(user_name) REFERENCES  `user`(user_name)
);

CREATE TABLE employee(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) not null,
date_of_birth DATE not null,
id_card VARCHAR(45) not null,
salary DOUBLE not null,
phone_number VARCHAR(45) not null,
email VARCHAR(45),
address VARCHAR(45),
position_id int,
education_degree_id INT,
division_id int ,
user_name VARCHAR(255),
FOREIGN KEY(position_id) REFERENCES position (position_id),
FOREIGN KEY(education_degree_id) REFERENCES  education_degree (education_degree_id),
FOREIGN KEY(division_id) REFERENCES  division (division_id),
FOREIGN KEY(user_name) REFERENCES  `user`(user_name)
);

CREATE TABLE customer_type (
customer_type_id INT PRIMARY KEY AUTO_INCREMENT,
customer_type_name VARCHAR(45)
);

CREATE TABLE customer (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_type_id INT,
FOREIGN KEY(customer_type_id) REFERENCES  customer_type (customer_type_id),
customer_name VARCHAR(45) not null,
customer_birthday DATE not null,
customer_gender bit(1) not null,
customer_id_card VARCHAR(45) not null,
customer_phone VARCHAR(45) not null,
customer_email VARCHAR(45),
customer_address VARCHAR(45)
);

CREATE TABLE facilyti_type (
facilyti_type_id INT PRIMARY KEY AUTO_INCREMENT,
facilyti_type_name VARCHAR(45)
);

CREATE TABLE rent_type (
rent_type_id INT PRIMARY KEY AUTO_INCREMENT,
rent_type_name VARCHAR(45)
);

CREATE TABLE facilyti (
facilyti_id INT PRIMARY KEY AUTO_INCREMENT,
facilyti_name VARCHAR(45) NOT NULL,
facilyti_area INT,
facilyti_cost DOUBLE NOT NULL,
facilyti_max_people int,
rent_type_id INT ,
facilyti_type_id int,
FOREIGN KEY(rent_type_id) REFERENCES  rent_type (rent_type_id),
FOREIGN KEY(facilyti_type_id) REFERENCES  facilyti_type (facilyti_type_id),
standard_room VARCHAR(45),
description_other_convenience VARCHAR(45),
pool_area DOUBLE,
number_of_floors INT,
facilyti_free text
);

CREATE TABLE contract(
contract_id INT PRIMARY KEY AUTO_INCREMENT,
contract_star_date DATETIME not null,
contract_end_date DATETIME not null,
contract_deposit DOUBLE not null,
contract_total_money DOUBLE not null,
employee_id int,
customer_id int,
facilyti_id int,
FOREIGN KEY(employee_id) REFERENCES  employee (employee_id),
FOREIGN KEY(customer_id) REFERENCES  customer (customer_id),
FOREIGN KEY(facilyti_id) REFERENCES  facilyti (facilyti_id)
);

CREATE TABLE attach_facilyti (
attach_facilyti_id INT PRIMARY KEY AUTO_INCREMENT,
attach_facilyti_name VARCHAR(45) not null,
attach_facilyti_cost DOUBLE not null,
attach_facilyti_unit int not null,
attach_facilyti_status VARCHAR(45)
);

CREATE TABLE contract_detail (
contract_detail_id INT PRIMARY KEY AUTO_INCREMENT,
contract_id INT,
attach_facilyti_id INT,
FOREIGN KEY(contract_id) REFERENCES  contract (contract_id),
FOREIGN KEY(attach_facilyti_id) REFERENCES  attach_facilyti (attach_facilyti_id),
quantity int  not null
);


