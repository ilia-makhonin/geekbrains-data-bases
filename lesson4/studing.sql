use `employees`;
show tables;

create view newview as select * from `employees`.employees limit 5;
select * from newview;

delimiter //
create procedure newprocedure1 (out param varchar(60))
begin
	select concat(first_name, ' ', last_name) as `full_name` 
    into param from `employees`.employees limit 1;
end//
delimiter ;

call newprocedure1(@a);
select @a;

create function myfunc (param float)
returns int
return round(param);

select myfunc(60.05);

drop view newview;
drop procedure newprocedure;
drop procedure newprocedure1;
drop function myfunc;