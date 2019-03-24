trigger_time        
BEFORE, AFTER

trigger_event
INSERT, UPDATE, DELETE

ON  table_name

/*----------------------------------*/

create database trigger_demo;
use trigger_demo;

create table users(
	username varchar(100),
	age int
);

-- changing the delimiter
DELIMITER $$ 

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

insert into users(username, age) values ("Boby", 14);

use instagram_app;
show tables;

-- allowed to follow self
insert into follows (follower_id, followee_id) values (4,4);

DELIMITER $$

CREATE TRIGGER validate_self_follow
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
	     if new.follower_id =new.followee_id
	     THEN
	     	signal SQLSTATE '45000'
	     	set message_text = 'You cannot follow yourself!';
	     END IF;
     END;
$$

DELIMITER ;

insert into follows (follower_id, followee_id) values (5,5);

create table unfollows(
	follower_id int not null,
	followee_id int not null,
	created_at timestamp default now(),
	FOREIGN KEY(follower_id) references users(id),
	FOREIGN KEY(followee_id) REFERENCES users(id),
	PRIMARY KEY(follower_id, followee_id)
); 


/* trigger boilerplate code */
DELIMITER $$

CREATE TRIGGER trigger_name
     trigger_time trigger_event ON table_name FOR EACH ROW
     BEGIN
     END;
$$

DELIMITER ;
/* trigger boilerplate code end*/

DELIMITER $$

CREATE TRIGGER log_unfollows
     AFTER DELETE ON follows FOR EACH ROW
     BEGIN
	     insert into unfollows set follower_id = old.follower_id, followee_id = old.followee_id;
     END;
$$

DELIMITER ;

delete from follows where follower_id=2 and followee_id=1;
select * from unfollows;

show triggers;
drop trigger <triggerName>;
