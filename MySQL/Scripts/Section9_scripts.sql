use book_shop;
select count(*) from books;
select count(distinct author_fname) from books;
show tables;
desc books;
select count(distinct author_fname, author_lname) from books;
select count(*) from books where title like '%the%';

select author_lname, count(*) from books group by author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname; #error
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_fname, author_lname;
select released_year, count(*) from books group by released_year; 

select min(pages) from books;
select max(pages), title from books;
show warnings;
SELECT @@sql_mode;

select * from books where pages = (select min(pages) from books);
select * from books order by pages asc limit 1; #same as above 
select title, pages from books where pages = (select max(pages) from books);

select author_fname, author_lname, min(released_year) from books group by  author_lname, author_fname;
select author_fname, author_lname, max(pages) from books group by  author_lname, author_fname;

select sum(pages) from books;
select author_fname, author_lname, sum(pages) from books group by  author_lname, author_fname;

select avg(pages) from books;
select released_year, avg(stock_quantity) from books group by released_year;
select author_fname, author_lname, avg(pages) from books group by  author_lname, author_fname;


select released_year as year, count(*) as '# books', avg(pages) as 'avg pages' from books group by year order by year asc;