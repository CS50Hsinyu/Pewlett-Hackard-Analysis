# Pewlett-Hackard-Analysis

## Overview of the analysis
The project is to help Bobby, a HR analyst works in Pewlett Hackard, to build employee database from the csv files with SQL to find the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program.

## Results
* Deliverable 1: The Number of Retiring Employees by Title

 1. First, we create "retirement_titles" table which contains data of employee number, first name, last name, title, from_date and to_date by joining employees and title tables, data from csv file, on common share key "emp_no." We use the function "WHERE" to filter out employees who were born during 1954 to 1955. In the retirement titles table, we can find some employees may have multiple rows in different title, from_date and to_date. This is because promotion records are kept in the database. SQL will provide all information after we join the two tables. 

![Step1_7](Resources/Step1_7.PNG)

 2. Then, we use the data from retirement titles table, and we use DISTINCT ON function to remove duplicate rows and keep the latest job title in the list. Distinct function keeps only the first row of each set of rows. That is why we use ORDER BY function to make on to_date in descending order. While to_date is in descending order, it ensure that latest title appears on the first row and distinct function delete the rest of history title rows. Therefore, we can generate "unique_title" table which includes only the most recent title information.

![Step8_14](Resources/Step8_14.PNG)

 3. Next, we count the number of employees who are about to retire by their most recent title and sort the rows in descending count number order. And create "retiring_title" table to save the data.

![Step15_20](Resources/Step15_20.PNG)

* Deliverable 2: The Employees Eligible for the Mentorship Program

 4. We create "Mentorship-eligibility" table to include data of employees, dept_emp and title table on emp_no to include emp_no, first_name, last_name, birth_date, from_date, to_date, and title. We filter out current employees who were born in 1965. Then, as we did in Retirement Titles table to get rid of duplicated rows, we applied DISTINCT ON function on emp_no, while we sorted to_date in descending order in titles and emp_dept tables to make sure the latest data will be the first row on the table. In the end, we get a list of employees who are eligible to participate mentorship program and save the data into Mentorship eligibility.

![Deliverable_2](Resources/Deliverable_2.png)


## Summary

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

  In order to count how many roles will need to be filled in each tilte and in each department, we filtered out current employees who were born during 1954 to 1955 and summarized the number of employees according to what their titles are and what department they work for. The summary is saved into "silver_tsunami_summary" table. 

  Please see picture below. From the table, we can see what roles are going to retire soon in what department. The first is 11,644 Senior Engineer in Development department, the second is 10,189 Senior Engineer in Production department, and the third is 8,685 Senior Staff in Sales.

![tsunami](Resources/silver_tsunami.png)


* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

  From above, we know how many employees are going to retire soon in each title and department. Now, we need to compare the count how many employees who are eligible to participate in mentorship program in each tilte and in each department with the counts in silver tsunami summary.

  Please see the frist picture below. From the table, we can see what role in what department will be eligible to mentorship program. The first is 244 Senior Engineer in Development department, the second is 207 Senior Engineer in Production department, and the third is 187 Senior Staff in Sales. Comparing with the number in silver_tsunami_summary, we have enough mentors to coach mentees.

  Please see the second picture below. The result column below shows that the number of silver_tsunami, employees who are going to retire, is great than the number of mentees, employees who are eligible to participate Mentorship Program. This means there are enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees.
  
![mentee](Resources/mentee.png)


![Deliverable_3](Resources/Deliverable_3.png)
