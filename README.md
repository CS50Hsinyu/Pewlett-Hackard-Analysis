# Pewlett-Hackard-Analysis

## Overview of the analysis
The project is to help Bobby, a HR analyst works in Pewlett Hackard, to build employee database from the csv files with SQL to find the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program.

## Results
* Deliverable 1: The Number of Retiring Employees by Title
1. To create Retirement Titles table containing employee number, first name, last name, title, from date and to date, we have to join employees and title table by employee number and then filtering employees born during 1954 to 1955. However, some employees may have multiple titles because promotion records are kept in the database.

2. However, some employees may have multiple titles in Retirement Titles table because promotion records are kept in title table.

3. On top of Retirement Titles table, we use DISTINCT to remove duplicate rows and keep the latest job title. Distinct function keeps only the first row of each set of rows so that the data has to ORDER BY descending order of to_date to ensure that latest title appears the first row. In this way, we can generate unique titles table which include only the most recent title information.

## Summary
