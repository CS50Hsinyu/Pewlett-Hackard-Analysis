--Deliverable 1: The Number of Retiring Employees by Title

--Step 1~7
--Create Retirement Titles table
--holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.
--Retrieve emp_no, first_name, last_name from employees table
--Retrieve title, from_date, to_date from titles table
--Join two tables and filter employees born during 1954 to 1955
SELECT ee.emp_no, 
	ee.first_name, 
	ee.last_name, 
	t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM employees as ee
JOIN titles as t
ON ee.emp_no = t.emp_no
WHERE ee.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;



-- Step 8~14
-- Use DISTINCT with Orderby to remove duplicate rows to create Unigue titles table
-- DISTINCT keeps only the first row of each set of rows where the given expressions.
-- ORDER BY descending order of to_date to ensure that latest title appears the first row.
-- and the following duplicated rows will be removed by distinct function.
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;



-- Step 15~20
-- Create a Retiring Titles table
-- contains the number of titles filled by employees who are retiring.
-- COUNT the number of employees by their most recent job title.
-- GROUP BY title and then ORDER BY descending of count number
SELECT COUNT(title), title
INTO retiring_title
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



-- Deliverable 2:The Employees Eligible for the Mentorship Program
-- Mentorship-eligibility table 
-- holds the current employees who were born between January 1, 1965 and December 31, 1965.
SELECT DISTINCT ON (ee.emp_no) ee.emp_no,
	ee.first_name, 
	ee.last_name, 
	ee.birth_date,
	dm.from_date,
	dm.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as ee
JOIN dept_emp as dm
ON ee.emp_no = dm.emp_no
JOIN titles as t
ON ee.emp_no = t.emp_no
Where (ee.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND dm.to_date='9999-01-01'
ORDER BY ee.emp_no, t.to_date DESC, dm.to_date DESC;

--Deliverable 3 :
--How many roles will need to be filled as the "silver tsunami" begins to make an impact?
--JOIN unique_title and dept_emp ON emp_no, and to_date. Then JOIN departments ON dept_no. 
--Count the number of emp_no.
--only employee who will retire (ie to_date is 9999-01-01, they are working for company now), No need to filter birthday since it is done in unique_titles
--Group by dept_name and title so that we can know the count number in which title in which department
--Sort data by count number
SELECT d.dept_name,
u.title,
COUNT(u.emp_no) AS silver_tsunami
INTO silver_tsunami_summary
FROM unique_titles as u
JOIN dept_emp as de
ON (u.emp_no = de.emp_no) AND (u.to_date = de.to_date)
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE u.to_date = '9999-01-01'
GROUP BY d.dept_name, u.title
ORDER BY silver_tsunami DESC

--Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees
--JOIN mentorship_eligibility and dept_emp on emp_no, and to_date. Then JOIN departments ON dept_no. 
--Count emp_no from of emp_no.
--Group by dept_name and title so that we can know the count number in which title in which department
--Sort data by count number
SELECT d.dept_name,
me.title,
COUNT(me.emp_no) AS mentee
INTO mentee
FROM mentorship_eligibility AS me
JOIN dept_emp as de 
ON (me.emp_no = de.emp_no ) AND (me.to_date = de.to_date)
JOIN departments as d
ON de.dept_no = d.dept_no
GROUP BY d.dept_name, me.title
ORDER BY mentee DESC