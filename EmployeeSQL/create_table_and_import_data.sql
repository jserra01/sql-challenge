-- Employee SQL Challenge

--1.  Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(4)   NOT NULL,
    dept_name VARCHAR(20)   NOT NULL,
    PRIMARY KEY (dept_no)   
);

--Import data using import/export functionality

--Check data
SELECT * FROM departments LIMIT 10
;


--2.  Create titles table
CREATE TABLE titles (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(20)   NOT NULL,
    PRIMARY KEY (title_id)
);

--Import data using import/export functionality

--Check data
SELECT * FROM titles LIMIT 10
;


--3.  Create employees table
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--Import data using import/export functionality

--Check data
SELECT * FROM employees LIMIT 10
;


--4.  Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(4)   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Import data using import/export functionality

--Check data
SELECT * FROM dept_emp LIMIT 10
;


--5.  Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4)   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Import data using import/export functionality

--Check data
SELECT * FROM dept_manager LIMIT 10
;


--6.  Create salaries table
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Import data using import/export functionality

--Check data
SELECT * FROM salaries LIMIT 10
;
