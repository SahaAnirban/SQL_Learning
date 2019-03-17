SELECT 
    *
FROM
    cats;

insert into cats (name, age) values 
('Killi1', 23), 
('Billi1', 12),
('Billi2', 13);

insert into cats (name, age) values ('Billi3', 'abcdef');
INSERT INTO cats(name, age)
VALUES('This is some text blah blah blah blah blah text text text something about cats lalalalal meowwwwwwwwwww', 10);
show warnings;

desc cats;

insert into cats (name) values ('Anirban');
insert into cats() values ();

CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

desc cats2;


select * from cats2;
insert into cats2 (name) values ('Anri');
insert into cats2 (age) values (9);

create table cats3(
	name varchar(20) default 'no name provided',
	age int default 99
);

desc cats3;

insert into cats3 (age) values (4);

select * from cats3;

CREATE TABLE unique_cats (
    cat_Id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

desc unique_cats;

create table unique_cats2 (
	cat_id int not null auto_increment,
    name varchar(39),
    age int,
    primary key (cat_id)
);

desc unique_cats2;

insert into unique_cats2 (name, age) values ('Billi', 32);    
select * from unique_cats2;
