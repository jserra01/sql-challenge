--DATA ANALYSIS

--1.  List employee number, last name, first name, sex, and salary of each employee.
SELECT a.emp_no, a.last_name, a.first_name, a.sex, CAST(b.salary AS MONEY)
FROM employees AS a INNER JOIN salaries AS b
ON a.emp_no = b.emp_no
ORDER BY emp_no ASC
;


--2.  List first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
;

--3.  List manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT a.dept_no, b.dept_name, a.emp_no, c.last_name, c.first_name
FROM dept_manager AS a 
INNER JOIN departments as b ON a.dept_no = b.dept_no
INNER JOIN employees as c ON a.emp_no = c.emp_no
ORDER BY dept_no ASC, last_name ASC
;


--4.  List department number for each employee along with employee’s employee number, last name,
--first name, and department name.
SELECT a.emp_no, b.last_name, b.first_name, a.dept_no, c.dept_name
FROM dept_emp AS a 
INNER JOIN employees AS b ON a.emp_no = b.emp_no
INNER JOIN departments AS c ON a.dept_no = c.dept_no
ORDER BY emp_no ASC, dept_no ASC
;


--5.  List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE UPPER(first_name) = 'HERCULES' AND UPPER(last_name) LIKE ('B%')
;


--6.  List each employee in the Sales department, including their employee number, last name, and
--first name.
SELECT a.emp_no, c.last_name, c.first_name, a.dept_no, b.dept_name
FROM dept_emp AS a
INNER JOIN departments AS b ON a.dept_no = b.dept_no
INNER JOIN employees AS c ON a.emp_no = c.emp_no
WHERE b.dept_name = 'Sales'
;

--7.  List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT a.emp_no, c.last_name, c.first_name, a.dept_no, b.dept_name
FROM dept_emp AS a
INNER JOIN departments AS b ON a.dept_no = b.dept_no
INNER JOIN employees AS c ON a.emp_no = c.emp_NO
WHERE b.dept_name IN ('Development', 'Sales')
;


--8.  List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC
;