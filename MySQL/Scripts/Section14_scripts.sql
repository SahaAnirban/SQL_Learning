show databases;

create database instagram_app;
use instagram_app;

drop table users, photos, comments, likes;

create table users (
	id int AUTO_INCREMENT PRIMARY KEY,
	username varchar(255) UNIQUE NOT NULL,
	created_at timestamp default now()
);

create table photos(
	id integer AUTO_INCREMENT PRIMARY KEY,
	image_url varchar(255) NOT NULL,
	user_id integer not NULL,
	created_at timestamp default now(),
	foreign key(user_id) REFERENCES users(id)
);

create table comments(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	comment_text varchar(255) not null,
	user_id int not null,
	photo_id int not null,
	created_at timestamp default now(),
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(photo_id) REFERENCES photos(id)
);

create table likes (
	user_id int not null,
	photo_id int not null,
	created_at timestamp default now(),
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(photo_id) references photos(id),
	PRIMARY KEY(user_id, photo_id)
);

drop table follows;

create table follows(
	follower_id int not null,
	followee_id int not null,
	created_at timestamp default now(),
	FOREIGN KEY(follower_id) references users(id),
	FOREIGN KEY(followee_id) REFERENCES users(id),
	PRIMARY KEY(follower_id, followee_id)
); 

create table tags (
	id integer AUTO_INCREMENT PRIMARY KEY,
	tag_name varchar(255) unique,
	created_at timestamp default now()
);

create table photo_tags(
	photo_id integer not null,
	tag_id integer not null,
	FOREIGN KEY(photo_id) references photos(id),
	FOREIGN KEY(tag_id) references tags(id),
	PRIMARY KEY(photo_id, tag_id)
);

