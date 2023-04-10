-- Number of Retiring Employees by title 

Select e.emp_no,
	   e.firSt_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO reitrement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Part 2 Clean it up B!

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
					rt.first_name,
					rt.last_name,
					rt.title
INTO unique_titles
FROM reitrement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

select * from unique_titles;


-- Part 3, "Another One"

SELECT COUNT(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Deliverable 2 Mentorship Program?




