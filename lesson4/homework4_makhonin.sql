-- ONE EXAMPLE
-- Средняя зарплата отделов
USE employees;
CREATE VIEW average AS
	SELECT ROUND(AVG(salary), 2) AS avg_salary, departments.dept_name FROM `employees`
	JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
	JOIN `dept_emp` ON `dept_emp`.emp_no = `employees`.emp_no
	JOIN `departments` ON `departments`.dept_no = `dept_emp`.dept_no
	WHERE `salaries`.to_date > NOW()
	GROUP BY `departments`.dept_no;

-- SELECT * FROM average;

-- Максимальная зарплата
CREATE VIEW max_salary AS
	SELECT MAX(salary) FROM `salaries` WHERE to_date > NOW();

-- SELECT * FROM max_salary;

-- Сотрудник с максимальной зарплатой
CREATE VIEW employee_max_salary AS
	SELECT 
		CONCAT(`employees`.first_name,' ',`employees`.last_name) AS full_name, 
		salaries.salary
	FROM `employees`
	JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
	WHERE `salaries`.salary = (
		SELECT MAX(salary) FROM `salaries` WHERE to_date > NOW()
	);
    
-- SELECT * FROM employee_max_salary;

-- С помощью вложенного представления
CREATE VIEW employee_max_salary_two_ex AS
	SELECT 
		CONCAT(`employees`.first_name,' ',`employees`.last_name) AS full_name, 
		salaries.salary
	FROM `employees`
	JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
	WHERE `salaries`.salary = (SELECT * FROM max_salary);

-- Удалить одного сотрудника, у которого максимальная зарплата
DELETE FROM `employees` WHERE emp_no = (SELECT * FROM employee_max_salary);

-- Посчитать количество сотрудников во всех отделах
CREATE VIEW employee_count AS
	SELECT COUNT(emp_no) AS employees_quantity, `departments`.dept_name FROM `dept_emp`
	LEFT JOIN `departments` ON `departments`.dept_no = `dept_emp`.dept_no
	WHERE `dept_emp`.to_date > NOW()
	GROUP BY `dept_emp`.dept_no;
    
-- SELECT * FROM employee_count;

-- Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел
CREATE VIEW total_salary_from_dept AS
	SELECT 
		COUNT(`dept_emp`.emp_no) AS employee_quantity,
		SUM(`salaries`.salary) AS total_salary,
		`departments`.dept_name
	FROM `dept_emp`
	LEFT JOIN `salaries` ON `salaries`.emp_no = `dept_emp`.emp_no
	LEFT JOIN `departments` ON `dept_emp`.dept_no = `departments`.dept_no
	WHERE `dept_emp`.to_date > NOW() AND `salaries`.to_date > NOW()
	GROUP BY `dept_emp`.dept_no;
    
-- SELECT * FROM total_salary_from_dept;
    
-- TWO EXAMPLE
-- Найти менеджера по имени и фамилии (Выводит полное имя, название отдела, дату рождения и зарплату)

delimiter //
CREATE FUNCTION get_manager (f_name CHAR(20), l_name CHAR(20))
	RETURNS CHAR(250) 
    BEGIN
		RETURN (SELECT
			CONCAT('Birth date: ',birth_date, 
				', Fullname: ', first_name, ' ', last_name, 
				', Gender: ', gender, 
				', Deportment: ', dept_name, 
				', Salary: ', salary)
			FROM `employees`
				JOIN `dept_manager` ON `dept_manager`.emp_no = `employees`.emp_no
				JOIN `departments` ON `departments`.dept_no = `dept_manager`.dept_no
				JOIN `salaries` ON `salaries`.emp_no = `employees`.emp_no
			WHERE first_name = f_name
				AND last_name = l_name
				AND `dept_manager`.to_date > NOW() 
				AND `salaries`.to_date > NOW()
			LIMIT 1);
	END//
delimiter ;

-- SELECT get_manager ('Leon', 'DasSarma') AS manager;
-- SELECT get_manager ('Dung', 'Pesch') AS manager;

-- DROP FUNCTION get_manager;

-- THREE EXAMPLE
-- При добавлении нового сотрудника ему на счёт зачисляется бонус "1000"

delimiter //
CREATE TRIGGER bonus AFTER INSERT ON `employees`.salaries
FOR EACH ROW
BEGIN
	SET NEW.salary = salary + 1000;
END//
delimiter ;