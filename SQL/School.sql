CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);


INSERT INTO departments (dept_id, dept_name)
VALUES
(1, 'Engineering'),
(2, 'Data Analytics'),
(3, 'Human Resources'),
(4, 'Finance'),
(5, 'Marketing');


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    dept_id INT REFERENCES departments(dept_id),
    is_active BOOLEAN NOT NULL
);



INSERT INTO employees
(employee_id, name, salary, dept_id, is_active)
VALUES
-- Engineering
(101, 'Amit',    95000, 1, TRUE),
(102, 'Rahul',   72000, 1, TRUE),
(103, 'Priya',   68000, 1, TRUE),
(104, 'Neha',    85000, 1, FALSE),
(105, 'Vikas',   60000, 1, TRUE),
(106, 'Anjali',  88000, 2, TRUE),
(107, 'Rohan',   76000, 2, TRUE),
(108, 'Sneha',   62000, 2, TRUE),
(109, 'Karan',   55000, 2, FALSE),
(110, 'Pooja',   65000, 3, TRUE),
(111, 'Ravi',    58000, 3, TRUE),
(112, 'Meena',   52000, 3, TRUE),
(113, 'Arjun',   48000, 3, FALSE),
(114, 'Suresh',  92000, 4, TRUE),
(115, 'Kavita',  78000, 4, TRUE),
(116, 'Nitin',   70000, 4, FALSE),
(117, 'Deepak',  60000, 4, TRUE),
(118, 'Simran',  74000, 5, TRUE),
(119, 'Varun',   66000, 5, TRUE),
(120, 'Isha',    58000, 5, FALSE);


-- CTE


WITH
emp_details AS (
SELECT d.dept_id,d.dept_name, AVG(e.salary)
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name,d.dept_id
),
emp_normal_details AS(
SELECT employee_id,name,salary,dept_id
FROM employees
)



SELECT e.employee_id,e.name,e.salary,ed.dept_name
FROM emp_normal_details e
JOIN emp_details ed
ON e.dept_id = ed.dept_id
WHERE e.salary> ed.avg;



CREATE VIEW emp_view AS 
SELECT *
FROM employees 
WHERE salary > 60000;

SELECT *
FROM emp_view
WHERE is_active = TRUE

UPDATE emp_view SET name = 'Varun Kumar' WHERE employee_id = 119;


SELECT * FROM employees;

SELECT * FROM emp_view;

-- view --standard view vs materializied


DROP view emp_view;















