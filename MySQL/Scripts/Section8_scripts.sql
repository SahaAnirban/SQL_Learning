use book_shop;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
        
desc books;
select * from books;

select distinct author_lname from books;
select distinct concat(author_fname, ' ', author_lname) as 'full name' from books;
select distinct author_fname, author_lname from books;	

select title from books order by title; # asc by default
select title, author_fname, released_year from books order by released_year desc; #released_year can be left out of select
select title , author_fname, author_lname from books order by 2;

#sort 2 columns
select author_fname, author_lname from books order by 1,2;

select * from books limit 3;
select title, released_year from books order by released_year desc limit 5;
select title, released_year from books order by released_year desc limit 0, 5; # 0 row to 5th row
select title, released_year from books order by released_year desc limit 0, 164894356468754654; 

select title, author_fname from books where author_fname like '%da%';
select title, stock_quantity from books where stock_quantity like '____';
