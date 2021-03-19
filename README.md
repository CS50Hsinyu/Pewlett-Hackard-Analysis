# Pewlett-Hackard-Analysis

## Overview of the analysis
The project is to help Bobby, a HR analyst works in Pewlett Hackard, to build employee database from the csv files with SQL to find the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program.

## Results
* Deliverable 1: The Number of Retiring Employees by Title

 1. To create Retirement Titles table containing employee number, first name, last name, title, from date and to date, we have to join employees and title table by employee number and then filtering employees born during 1954 to 1955. However, some employees may have multiple titles because promotion records are kept in the database.

![Step1_7](Resources/Step1_7.PNG)

 2. However, some employees may have multiple titles in Retirement Titles table because promotion records are kept in title table.

![Retirement_Titles_table](Resources/Retirement_Titles_table.png)

 3. On top of Retirement Titles table, we use DISTINCT function to remove duplicate rows and keep the latest job title. Distinct function keeps only the first row of each set of rows so that the data has to ORDER BY descending order of to_date to ensure that latest title appears the first row. In this way, we can generate unique titles table which include only the most recent title information.

![Step8_14](Resources/Step8_14.PNG)

 4. To retrieve the number of employees by their most recent job title who are about to retire, we use COUNT and GROUP BY function to count the number of employees by their most recent job title group and use ORDER BY to present a descending of count number.

![Step15_20](Resources/Step15_20.PNG)


* Deliverable 2: The Employees Eligible for the Mentorship Program

 1.

 2.

 3.

 4.

![Deliverable_2](Resources/Deliverable_2.png)


## Summary
