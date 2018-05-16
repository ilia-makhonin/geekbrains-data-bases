USE `employees`;

-- EXPLAIN
EXPLAIN SELECT ROUND(AVG(salary), 2) AS avg_salary, departments.dept_name FROM `employees`
	JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
	JOIN `dept_emp` ON `dept_emp`.emp_no = `employees`.emp_no
	JOIN `departments` ON `departments`.dept_no = `dept_emp`.dept_no
	WHERE `salaries`.to_date > NOW()
	GROUP BY `departments`.dept_no;
    
EXPLAIN SELECT 
	CONCAT(`employees`.first_name,' ',`employees`.last_name) AS full_name, salaries.salary
	FROM `employees`
		JOIN `salaries` ON `employees`.emp_no = `salaries`.emp_no
	WHERE `salaries`.salary = (
		SELECT MAX(salary) FROM `salaries` WHERE to_date > NOW()
	);
    
EXPLAIN SELECT 
		COUNT(`dept_emp`.emp_no) AS employee_quantity,
		SUM(`salaries`.salary) AS total_salary,
		`departments`.dept_name
	FROM `dept_emp`
		LEFT JOIN `salaries` ON `salaries`.emp_no = `dept_emp`.emp_no
		LEFT JOIN `departments` ON `dept_emp`.dept_no = `departments`.dept_no
	WHERE `dept_emp`.to_date > NOW() AND `salaries`.to_date > NOW()
	GROUP BY `dept_emp`.dept_no;