--Deliverable 1: The Number of Retiring Employees by Title

--Step 1~7
--Create Retirement Titles table
--holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.
--Retrieve emp_no, first_name, last_name from employees talbe
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
ORDER BY COUNT(title) DESC



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