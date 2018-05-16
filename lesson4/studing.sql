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

SELECT
	birth_date, 
	CONCAT(first_name, ' ', last_name) AS full_name, 
	gender, 
	dept_name, 
	salary 
FROM `employees`
	JOIN `dept_manager` ON `dept_manager`.emp_no = `employees`.emp_no
	JOIN `departments` ON `departments`.dept_no = `dept_manager`.dept_no
	JOIN `salaries` ON `salaries`.emp_no = `employees`.emp_no
WHERE first_name LIKE '%'
AND last_name LIKE '%' 
AND `dept_manager`.to_date > NOW() 
AND `salaries`.to_date > NOW();