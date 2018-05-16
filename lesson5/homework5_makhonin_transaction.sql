USE `employees`;

-- TRANSACTIONS
-- Добавление нового сотрудника

START TRANSACTION;
		SAVEPOINT point1;
        
	INSERT INTO `employees` (
    emp_no, birth_date, first_name, last_name, gender, hire_date
    ) VALUE (1000001, '1970-09-27', 'Mark', 'Watson', 'M', '1992-03-17');
    
		SAVEPOINT point2;
        
	INSERT INTO `salaries` (
    emp_no, salary, from_date, to_date
    ) VALUE (1000001, 89753, '1992-03-17', '2099-12-31');

    	SAVEPOINT point3;
    
    INSERT INTO `dept_emp` (
    emp_no, dept_no, from_date, to_date
    ) VALUE (1000001, 'd005', '1992-03-17', '2099-12-31');

    	SAVEPOINT point4;
        
	INSERT INTO `titles` (
    emp_no, title, from_date, to_date
    ) VALUE (1000001, 'Senior Engineer', '1992-03-17', '2099-12-31');
    
COMMIT;

-- Удаление сотрудника

START TRANSACTION;
		SAVEPOINT point1;
	DELETE FROM `employees` WHERE emp_no = 1000001;
    
		SAVEPOINT point2;
	DELETE FROM `salaries` WHERE emp_no = 1000001;
    
		SAVEPOINT point3;
    DELETE FROM `dept_emp` WHERE emp_no = 1000001;
    
		SAVEPOINT point3;
	DELETE FROM `titles` WHERE emp_no = 1000001;

COMMIT;
