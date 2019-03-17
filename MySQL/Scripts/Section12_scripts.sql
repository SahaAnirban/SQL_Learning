show databases;
create database relationship_db;
use relationship_db;

drop table customers, orders;

CREATE TABLE customers ( 
	id INT auto_increment PRIMARY KEY,
	first_name varchar(100),
	last_name varchar(100),
	email varchar(50)
);

create table orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date datetime,
	amount decimal(8,2),
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
insert into orders (order_date, amount, customer_id) values ('2010-12-12', 99.99, 89); #failes

