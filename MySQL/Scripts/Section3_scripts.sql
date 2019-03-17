show databases;
create database hello_world_db;
drop database hello_world_db;
create database learning_db;
create database dog_walking_app;
use dog_walking_app;
select database();

-- table creation
CREATE TABLE cats (
    name VARCHAR(100),
    age INT
);

insert into cats(name, age) values ('Blue', 1);

show tables;
show columns from cats;
desc cats;

drop table cats;
show tables;