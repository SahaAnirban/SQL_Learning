show databases;
use mysql_node_app;
select count(*) from users;

select * from users order by created_at desc;

insert into users(email) values ("anirban@gmail.com");