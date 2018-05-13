-- I SECTION
USE `geodata`;

-- ONE EXAMPEL
SELECT `_cities`.title, `_regions`.title, `countries`.title FROM `_cities`
	LEFT JOIN `_regions` ON `_regions`.id = `_cities`.region_id
    LEFT JOIN `_countries` ON `_countries`.id = `_cities`.country_id;
    
-- TWO EXAMPEL
SELECT `_cities`.title, `_regions`.title FROM `_cities`
	LEFT JOIN `_regions` ON `_regions`.id = `_cities`.region_id
    WHERE `_regions`.title = 'Moscow';


-- II SECTION
USE `employees`;

-- ONE EXAMPLE
SELECT AVG(`salaries`.salary) AS `avg_salary`, `departments`.dept_name FROM `salaries`
LEFT JOIN `dept_emp` ON `salaries`.emp_no = `dept_emp`.emp_no
LEFT JOIN `departments` ON `dept_emp`.dept_no = `departments`.dept_no
GROUP BY `departments`.dept_name;


-- TWO EXAMPLE
SELECT 
CONCAT(`employees`.first_name, ' ', `employees`.last_name) AS `full_name`,
`salaries`.salary AS `max_salary` FROM `employees`
LEFT JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
WHERE `salaries`.salary = (SELECT MAX(salary) FROM `salaries`);


-- THREE EXAMPLE
-- Удаление всех сотрудников с именем Tokuyasu Pesch по номеру 43624
DELETE FROM `employees` WHERE emp_no = (
	SELECT 
	`salaries`.emp_no FROM `employees`
	LEFT JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
	WHERE `salaries`.salary = (SELECT MAX(salary) FROM `salaries`)
);

-- Удаление только сотрудника Tokuyasu Pesch с зарплатой 158220
DELETE FROM `employees` WHERE emp_no = (
	SELECT 
	`salaries`.emp_no FROM `employees`
	LEFT JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
	WHERE `salaries`.salary = (SELECT MAX(salary) FROM `salaries`)
) LIMIT 1;

-- FOUR EXAMPLE
SELECT COUNT(`employees`.emp_no) AS `count`, dept_name FROM `employees`
	LEFT JOIN `dept_emp` ON `employees`.emp_no = `dept_emp`.emp_no
	LEFT JOIN `departments` ON `dept_emp`.dept_no = `departments`.dept_no
GROUP BY dept_name;

-- FIVE EXAMPLE
SELECT 
COUNT(`employees`.emp_no) AS `count`, dept_name, SUM(`salaries`.salary) AS `full_sum` FROM `employees`
	LEFT JOIN `dept_emp` ON `employees`.emp_no = `dept_emp`.emp_no
	LEFT JOIN `departments` ON `dept_emp`.dept_no = `departments`.dept_no
	LEFT JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
GROUP BY dept_name;
