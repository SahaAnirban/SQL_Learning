create database shirts_db;
use shirts_db;
SELECT DATABASE();

CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(50),
    color VARCHAR(50),
    shirt_size VARCHAR(1),
    last_worn INT
);

desc shirts;

INSERT into shirts (article, color, shirt_size, last_worn) values 
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT into shirts (article, color, shirt_size, last_worn) values ('polo shirt', 'purple', 'M', 50);

select * from shirts;
select * from shirts where shirt_size='m';
update shirts set shirt_size='L' where article='polo shirt';
update shirts set last_worn=0 where last_worn=15;
update shirts set color='off white', shirt_size='XS' where color='white';
delete from shirts where last_worn=200;
delete from shirts where article='tank top';
delete from shirts;
drop table shirts;
show tables;
desc shirts;