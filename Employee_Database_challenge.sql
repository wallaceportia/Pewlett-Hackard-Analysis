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