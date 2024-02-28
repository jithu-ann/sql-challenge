--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees e
	inner join salaries s on e.emp_no = s.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date FROM employees e 
	WHERE EXTRACT(YEAR FROM e.hire_date) =1986;

--List the manager of each department along with their 
--department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
	FROM dept_manager as dm INNER JOIN employees e ON e.emp_no=dm.emp_no 
		INNER JOIN departments as d ON dm.dept_no=d.dept_no;

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no,e.last_name, e.first_name, d.dept_name FROM departments as d
	INNER JOIN dept_emp as de ON de.dept_no=d.dept_no
		INNER JOIN employees as e ON e.emp_no=de.emp_no;
		
--List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees 
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
	
--List each employee in the Sales department, including their 
--employee number, last name, and first name.
SELECT emp_no, last_name, first_name FROM employees 
		WHERE emp_no IN(SELECT emp_no FROM dept_emp 
						WHERE dept_no IN(SELECT dept_no FROM departments 
										 WHERE dept_name= 'Sales' ));
										 
--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM employees e
		INNER JOIN dept_emp de ON de.emp_no = e.emp_no 
			INNER JOIN departments d ON d.dept_no=de.dept_no 
				WHERE d.dept_name = 'Sales' OR d.dept_name ='Development';
				
--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
		
		



		

