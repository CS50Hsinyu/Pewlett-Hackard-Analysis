# Pewlett-Hackard-Analysis

## Overview of the analysis
The project is to help Bobby, a HR analyst works in Pewlett Hackard, to build employee database from the csv files with SQL to find the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program.

## Results
* Deliverable 1: The Number of Retiring Employees by Title

 1. To create Retirement Titles table containing employee number, first name, last name, title, from date and to date, we have to use JOIN fuction with employees and title table on employee number and then filtering employees born during 1954 to 1955. However, some employees may have multiple titles because promotion records are kept in the database.

![Step1_7](Resources/Step1_7.PNG)

![Retirement_Titles_table](Resources/Retirement_Titles_table.png)

 2. On top of Retirement Titles table, we use DISTINCT function to remove duplicate rows and keep the latest job title in the list. Distinct function keeps only the first row of each set of rows so that the data has to ORDER BY descending order of to_date to ensure that latest title appears the first row. In this way, we can generate unique titles table which include only the most recent title information.

![Step8_14](Resources/Step8_14.PNG)

 3. To calculate the number of employees who are about to retire, we use COUNT function to count by emp_no the number of employees.

![Step15_20](Resources/Step15_20.PNG)

4. Last, apply GROUP BY function to group the table by title, then sort the count column in descending order.



* Deliverable 2: The Employees Eligible for the Mentorship Program

 1.

 2.

 3.

 4.

![Deliverable_2](Resources/Deliverable_2.png)


## Summary

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

In order to count how many roles will need to be filled in each department, we need to select employees who are born during 1954 to 1955, working currently, and summarize according to what their title is and what department they work for. As unique_titles generated in Deliverable 1 provides employees’ title who are eligible to retire, we can use the data. However, unique_titles table contains employees who already retired. To filter out upcoming “silver tsunami”, we count employees whose employees' to_date records show "9999-01-01" in dept_emp table by applying “WHERE u.to_date = '9999-01-01'.” To include department name in the summary, we join unique_titles table and dept_emp table on emp_no and to_date so that dept_no information is included to be the join key to add dept_name from departments table. Finally, we use GROUP BY dept_name and title to summarize the silver tsunami number into the new table silver_tsunami_summary.

Please see picture below. It is code of silver_tsunami_summary and partial summary. From the table, we can what role in what department will need to be filled as upcoming retirement impact. The first one is that there are 11,644 Senior Engineer are going to retire soon in Development department, second one is that there are 10,189 Senior Engineer are going to retire soon in Production department, and the third one is that there are 8,685 Senior Staff are going to retire soon in Sales.



* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?



