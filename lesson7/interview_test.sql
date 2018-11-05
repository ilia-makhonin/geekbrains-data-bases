-- Пользователи и количество лайков, которые они поставили
select 
	setters.id, 
	setters.login, 
	count(likes.setter) as 'from'
from likes
	left join users as setters on setters.id = likes.setter
	left join users as getters on getters.id = likes.getter
group by setters.id;

-- #############################################################
-- Количество взаимных лайков у пользователей
select users.login, count(users.id) as matual_likes from likes 
left join users on users.id = likes.getter
left join likes as child on child.setter = likes.getter
where likes.setter = child.getter
group by users.id;

-- От кого взаимные лайки
select users.login as 'from', setters.login  as 'to' from likes 
left join users on users.id = likes.getter
left join likes as child on child.setter = likes.getter
left join users as setters on setters.id = likes.setter
where likes.setter = child.getter;
-- #############################################################

-- Пользователи, которые не поставили лайк 3 пользователю
select * from users where id not in (
select users.id from users
left join likes on likes.setter = users.id
where likes.getter = 3);