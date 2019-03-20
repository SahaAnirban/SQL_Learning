use instagram_app;

select * from users order by created_at limit 5;

-- 2. Most Popular Registration Date
select
	dayname(created_at) as day,
	count(*) as total
from
	users
group by day
order by total desc
limit 2;

select
	username,
	image_url
from
	users
left JOIN photos on
	users.id = photos.user_id
where
	photos.id is null;
	
-- 4. Identify most popular photo (and user who created it)
select
	username,
	image_url,
	count(*) as likes_count
from
	users
join photos on
	users.id = photos.user_id
join likes on
	photos.id = likes.photo_id
group by image_url, username
order by likes_count desc
limit 1;

-- 5 most popular hashtags
select
	tag_name,
	count(*) as tag_count
from
	photo_tags
Inner join tags on
	tags.id = photo_tags.tag_id
group by
	tags.id
order by
	tag_count desc
limit 5;

-- finding bots who have liked every single photo
select
	username,
	count(*) as num_likes
from
	users
INNER join likes on
	users.id = likes.user_id
group by
	likes.user_id
HAVING
	num_likes = (select count(*) from photos);