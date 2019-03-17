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

#cross join, implicit join
select * from customers, orders; 

-- implicit inner join
select * from customers, orders where customers.id = customer_id;
select first_name, last_name, email, amount from customers, orders where customers.id = customer_id;

-- explicit inner join
select first_name, last_name, email, amount from customers JOIN orders on customers.id = orders.customer_id;

select
	first_name,
	last_name,
	sum(amount) as total_spent
from
	customers
JOIN orders on
	customers.id = orders.customer_id
group by
	last_name,
	first_name
order by
	total_spent desc;

-- left join
select * from customers LEFT JOIN orders on customers.id = orders.customer_id;

select 
	first_name,
	last_name,
	ifnull(sum(amount), 0) as total_spent
from customers LEFT JOIN orders on customers.id = orders.customer_id
group by customers.id
order by total_spent;

create table orders2 (
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date datetime,
	amount decimal(8,2),
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customers(id) on delete CASCADE
);

INSERT INTO orders2 (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

 -- exercise
  create table students (
  	id int AUTO_INCREMENT PRIMARY KEY,
  	first_name varchar(100)
  );

drop table papers;
 
create table papers (
	id int AUTO_INCREMENT PRIMARY KEY,
	title varchar(100),
	grade int,
	student_id int,
	FOREIGN KEY(student_id) REFERENCES students(id) on delete CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select first_name, title, grade from students INNER JOIN papers on students.id = papers.student_id order by grade desc;

select first_name, title, grade from students LEFT JOIN papers on students.id = papers.student_id;

select first_name, ifnull(title, 'MISSING'), ifnull(grade, 0) from students LEFT JOIN papers on students.id = papers.student_id;

select first_name, avg(ifnull(grade, 0)) as average from students LEFT JOIN papers on students.id = papers.student_id group by students.id order by average desc;

select
	first_name,
	avg(ifnull(grade, 0)) as average,
	case 
		when avg(ifnull(grade, 0)) >= 75 then 'PASSING'
		ELSE 'FAILING'
	END AS 'passing_status'
from
	students
LEFT JOIN papers on
	students.id = papers.student_id
group by
	students.id
order by
	average desc;