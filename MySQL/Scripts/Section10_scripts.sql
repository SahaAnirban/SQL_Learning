create database others_examples_db;
use others_examples_db;
show tables;

create table items (price decimal(5,2)); # 999.99
desc items;

insert into items (price) values (7);
insert into items (price) values (456); #won't allow 4567
insert into items (price) values (77.23);
select * from items;

create table items2 (price float);
insert into items2(price) values (12344556.77);
select * from items2;

create table people(name varchar(100), birthday DATE, birthtime TIME, birthdatetime DATETIME);
desc people;

insert into people (name, birthday, birthtime, birthdatetime) values ('Padma', '1983-11-11', '20:11:11', '1983-11-11 20:11:11');
insert into people (name, birthday, birthtime, birthdatetime) values ('Padma Shree', '1984-12-11', '20:56:11', '1984-12-11 20:56:11');

select now();
select curdate(), curtime();
insert into people (name, birthday, birthtime, birthdatetime) values ('James Bond', current_date(), current_time(), now());
select * from people; 

select name, birthday, day(birthday),dayname(birthday),dayofweek(birthday),dayofyear(birthday)  from people;
select date_format('1983-11-11 20:11:11', '%W %M %Y');
select date_format(birthdatetime, '%m/%d/%Y') from people;

select name, birthdatetime, datediff(now(), birthdatetime) from people;
SELECT birthdatetime, date_add(birthdatetime, interval 1 month) from people;
SELECT birthdatetime, date_add(birthdatetime, interval 30 second) from people;

select birthdatetime, birthdatetime + interval 1 day from people;
select birthdatetime, birthdatetime - interval 5 month from people;
select birthdatetime, birthdatetime - interval 4 month + interval 10 hour from people;

create table comments(content varchar(100), created_at timestamp default now()); #timestamp takes less space
desc comments;
insert into comments(content) values ('lol this is so funny article');
insert into comments(content) values ('I find this offensive');
select * from comments;

create table comments2(content varchar(100), changed_at timestamp default now() on update current_timestamp);
desc comments2;
insert into comments2(content) values ('lol this is so funny article');
insert into comments2(content) values ('I find this offensive');
select * from comments2;
update comments2 set content='this is hard' limit 1;