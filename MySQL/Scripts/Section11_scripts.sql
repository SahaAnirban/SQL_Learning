use book_shop;
select title, author_lname from books where author_lname != 'Harris';
select title from books where title NOT like 'W%';

select 99 > 1;
select * from books where author_lname='eggers' and released_year > 2010;
select * from books where author_lname='eggers' && released_year > 2010;

select author_lname, title from books where author_lname = 'eggers' OR released_year > 2010;
select author_lname, title from books where author_lname = 'eggers' || released_year > 2010 or stock_quantity > 100;

select title, released_year from books where released_year between 2004 and 2015;
select title, released_year from books where released_year not between 2004 and 2015;

select cast('2017-10-10' As datetime);

use others_examples_db;
select name, birthdatetime from people where birthdatetime between cast('1980-01-01' as datetime) and cast('2000-01-01' as datetime);

select author_fname, author_lname,
	case 
		when count(*) = 1 then '1 book'
        else concat(count(*), ' books')
	end as count
from books
group by author_lname, author_fname;

select title, author_lname from books where author_lname in ('Carver', 'Lahiri', 'Smith');
select title, released_year from books where released_year >= 2000 and released_year % 2 != 0;

select title, released_year,
case 
	when released_year >= 2000 then 'Modern Lit' 
    Else '20th Century Lit' 
    end as genre 
from books;

select title, stock_quantity,
case 
	when stock_quantity between  0 and 50 then '*'
    when stock_quantity between 50 and 100 then '**'
    else '***'
end as stock
from books;

select title, stock_quantity,
case 
	when stock_quantity <= 50 then '*'
    when stock_quantity <= 100 then '**'
    else '***'
end as stock
from books;