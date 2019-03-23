create database mysql_node_app;
show databases;
use mysql_node_app;

npm install /path/to/mysql-connector-nodejs-8.0.15.tar.gz

create table users (
	email varchar(255) primary key,
	created_at timestamp default now()
);

show tables;

insert into users (email) values ("katie32@yahoo.com"), ("tunde@gmail.com");
select * from users order by created_at desc;


select 
date_format(min(created_at),'%M %D %Y') as earliest_date
from users;