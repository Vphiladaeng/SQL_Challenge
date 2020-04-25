CREATE TABLE Employees(
emp_no INT   NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
gender VARCHAR NOT NULL,
hire_date DATE NOT NULL
)

CREATE TABLE Salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
)

SELECT * FROM salaries

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT E.emp_no,
	E.last_name,
	E.first_name,
	E.gender,
	S.salary

FROM Employees as E

LEFT JOIN Salaries as S

ON E.emp_no = S.emp_no;

--2.List employees who were hired in 1986.
SELECT E.emp_no,
	E.last_name,
	E.first_name

FROM Employees as E

WHERE E.hire_date BETWEEN '01/01/1986' AND '12/31/1986';

CREATE TABLE Departments (
dept_no VARCHAR NOT NUll,
dept_name VARCHAR NOT NULL
)

CREATE TABLE Dept_Emp (
emp_no INT NOT NULL,
dept_no VARCHAR NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
)

CREATE TABLE Dept_Manager(
dept_no VARCHAR NOT NULL,
emp_no INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
)

CREATE TABLE Titles(
emp_no INT NOT NULL,
title VARCHAR NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
)

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT DM.dept_no,
	D.dept_name,
	DM.emp_no,
	E.last_name,
	E.first_name,
	DM.from_date,
	DM.to_date FROM Dept_Manager as DM 
LEFT JOIN Departments as D ON (DM.dept_no = D.dept_no)
LEFT JOIN Employees as E ON (DM.emp_no = E.emp_no);


--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT E.emp_no,
	E.last_name,
	E.first_name,
	D.dept_name
FROM Employees as E LEFT JOIN Dept_Emp as DE ON (E.emp_no = DE.emp_no)
LEFT JOIN Departments as D ON (D.dept_no = DE.dept_no);


--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT E.first_name,
	E.last_name,
	E.gender
FROM Employees as E WHERE E.first_name = 'Hercules' AND E.last_name LIKE 'B%';


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT E.emp_no,
	E.last_name,
	E.first_name,
	D.dept_name
FROM Employees as E INNER JOIN Dept_Emp as DE ON (E.emp_no = DE.emp_no)
LEFT JOIN Departments as D ON (D.dept_no = DE.dept_no)
WHERE D.dept_name = 'Sales' ORDER BY E.emp_no;

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT E.emp_no,
	E.last_name,
	E.first_name,
	D.dept_name
FROM Employees as E INNER JOIN Dept_Emp as DE ON (E.emp_no = DE.emp_no)
LEFT JOIN Departments as D ON (D.dept_no = DE.dept_no)
WHERE D.dept_name IN ('Sales', 'Development') ORDER BY E.emp_no;

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT (last_name) AS "frequency"
FROM Employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;