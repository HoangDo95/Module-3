create database ss01_student_management;
use ss01_student_management;
create table class(
	id int primary key auto_increment,
    `name` varchar (50));
create table teacher(
	id int primary key auto_increment,
     `name` varchar (50),
     `age` varchar (50),
     `contry` varchar (50));
    
    
    
    