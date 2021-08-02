SELECT DISTINCT ON (employees.emp_no) employees.emp_no, employees.first_name, employees.last_name,
titles.title,titles.from_date,titles.to_date
INTO unique_titles
FROM employees
LEFT JOIN titles on employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no, titles.to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(*) as count, title
INTO retiring_titles
FROM unique_titleS
GROUP BY title
ORDER BY count DESC;

--Create a Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) 
e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
titles.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no DESC;