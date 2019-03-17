use dog_walking_app;
drop table cats;

CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

desc cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
select * from cats;
select name, age from cats where breed='Tabby';
select cat_id, age from cats where cat_id=age;

select name as 'CAT Name', breed as 'Kitty Breed' from cats;

UPDATE cats 
SET 
    breed = 'Short hair'
WHERE
    breed = 'Tabby';


select * from cats where name = 'egg';
delete from cats where name='egg'; #deletes Egg
delete from cats;

