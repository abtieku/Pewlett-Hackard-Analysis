SELECT e.emp_no, e.first_name, e.last_name,
t.title, t.from_date, t.to_date
INTO retirement_titles
from employees as e LEFT JOIN
titles as t on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

select * from employees;
select * from titles;
select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

--INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
---
select * from unique_titles;
--------
SELECT COUNT(title) as count,
title
INTO retiring_titles
FROM unique_titles 

GROUP BY title
ORDER BY count DESC;
------
select * from employees;
select * from titles;
select * from dept_emp;
select * from retiring_titles;
select * from mentorship_eligibility;
--------Summary Additional Queries
SELECT count, title
--INTO engineering_titles
FROM retiring_titles
WHERE title IN ('Engineer','Senior Engineer','Assistant Engineer');

---Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e LEFT JOIN
dept_emp as de ON (e.emp_no = de.emp_no) LEFT JOIN
titles as t ON (e.emp_no = t.emp_no)

WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

---potential table to augment mentorship_eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, e.gender,
de.from_date, de.to_date,
t.title,
s.salary
--INTO mentorship_eligibility_salary
FROM employees as e LEFT JOIN
dept_emp as de ON (e.emp_no = de.emp_no) LEFT JOIN
titles as t ON (e.emp_no = t.emp_no) LEFT JOIN
salaries as s on (e.emp_no = s.emp_no)

WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;




