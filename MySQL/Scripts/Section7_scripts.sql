-- in mysql-ctl cli -- source filename.sql
create database book_shop;
use book_shop;
show tables;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

desc books;
select * from books;

select concat(author_fname, ' ', author_lname) as 'full_name' from books;
select concat_ws(' - ', title, author_fname,author_lname) from books;

select substring('Hello World', 1, 4);
select substring('Hello World', 7);
select substring('Hello World', -3);
select substring(title, 1, 10) as short_title from books;
select substr(title, 1, 10) as short_title from books;
select concat(substr(title, 1, 10), '...') as short_title from books;

select replace('Hello World', 'Hell', '@#$%');
select replace('HellO world', 'o', '*'); #case sensitive

select substr(replace(title, 'e', '3'),1,10) from books;
select reverse('Hello World');
select char_length('Hello World');

select author_lname, char_length(title) as title_length from books where char_length(title) > 7; 
SELECT UPPER('Hello World');
select lower('Hello World');