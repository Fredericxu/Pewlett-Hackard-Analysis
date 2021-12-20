-- Deliverable 1 
-- Step 1 to Step 7

SELECT employees.emp_no, 
	employees.first_name,
 	employees.last_name,
 	titles.title,
 	titles.from_date,
 	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

-- Here to stop and export the retirement_titles.csv
-- Step 8 - 15

SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY retirement_titles.emp_no ASC, retirement_titles.to_date DESC;

-- Here to stop and export the unique_titles.csv
-- Step 16 - 21

SELECT title, COUNT(emp_no) AS count 
INTO retiring_titles
FROM unique_titles 
GROUP BY title 
ORDER BY count DESC

-- Deliverable 1 finished and retiring_titles.csv could be exported
-- Deliverable 2 start as following:

SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date,
	dep.from_date, dep.to_date,
	tit.title
INTO mentorship_eligibility
FROM employees AS emp
INNER JOIN dept_emp AS dep
ON emp.emp_no = dep.emp_no
INNER JOIN titles AS tit
ON emp.emp_no = tit.emp_no
WHERE (dep.to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;

-- Here to stop and export the mentorship_eligibility.csv