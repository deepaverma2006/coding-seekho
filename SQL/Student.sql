

CREATE TABLE std_Q (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    marks NUMERIC(5,2)
);

CREATE TABLE courses_Q (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    fee NUMERIC(10,2)
);

CREATE TABLE student_courses (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES stD_Q(student_id),
    course_id INT REFERENCES courses_Q(course_id)
);

INSERT INTO std_Q
(first_name, last_name, email, city, marks)
VALUES
('Rahul', 'Sharma', 'rahul@gmail.com', 'Lucknow', 85),
('Priya', 'Singh', 'priya@gmail.com', 'Kanpur', 72),
('Aman', 'Verma', 'aman@gmail.com', 'Lucknow', 91),
('Neha', 'Gupta', 'neha@gmail.com', 'Delhi', 68),
('Rohit', 'Kumar', 'rohit@gmail.com', 'Lucknow', 76),
('Anjali', 'Mishra', 'anjali@gmail.com', 'Kanpur', 88),
('Vikas', 'Yadav', 'vikas@gmail.com', 'Delhi', 55),
('Sneha', 'Shukla', 'sneha@gmail.com', 'Lucknow', 63),
('Arjun', 'Pandey', 'arjun@gmail.com', 'Kanpur', 79),
('Pooja', 'Tiwari', 'pooja@gmail.com', 'Lucknow', 94),
('Karan', 'Singh', 'karan@gmail.com', 'Delhi', 82),
('Simran', 'Verma', 'simran@gmail.com', 'Lucknow', 71),
('Aditya', 'Sharma', 'aditya@gmail.com', 'Kanpur', 59),
('Nisha', 'Gupta', 'nisha@gmail.com', 'Lucknow', 87),
('Varun', 'Mishra', 'varun@gmail.com', 'Delhi', 73);

INSERT INTO courses_Q
(course_name, fee)
VALUES
('Java', 15000),
('Python', 12000),
('Data Analytics', 18000),
('MERN Stack', 20000),
('C++', 10000);

INSERT INTO student_courses
(student_id, course_id)
VALUES
(1, 1),
(1, 3),

(2, 2),

(3, 1),
(3, 3),
(3, 4),

(4, 2),

(5, 1),
(5, 3),

(6, 2),
(6, 3),

(7, 5),

(8, 3),

(9, 1),
(9, 4),

(10, 3),
(10, 4),

(11, 1),

(12, 3),

(13, 5),

(14, 2),
(14, 3),

(15, 1),
(15, 4);



SELECT * FROM STD_Q;
SELECT * FROM courses_Q;








-- Question: Display student ID, student name and course name for students enrolled in Python.


SELECT s.student_id,s.first_name|| ''  ||s.last_name, cs.course_name, s.marks,s.city
FROM std_Q s
JOIN student_courses scs
ON s.student_id = scs.student_id
JOIN courses_Q AS cs
ON scs.course_id = cs.course_id
-- WHERE cs.course_name = 'Python';
WHERE s.city = 'Lucknow'
ORDER BY s.marks DESC;

-- Question: Display student name, city, course name and marks for students from Lucknow. Sort by marks highest to lowest.

SELECT s.student_id,s.student_name,s.city,cs.course_name,s.marks
FROM student_Q AS s
JOIN student_courses_Q AS sc
ON s.student_id = sc.student_id
JOIN courses_Q AS cs
ON scs.course_id = cs.course_id
WHERE s.city = 'Lucknow'
ORDER BY s.marks DESC;

-- Question: Display the top 5 students by marks who have marks >= 60.

-- Question: Find the number of students enrolled in each course.


-- Question 5 — Courses With More Than 3 Students


-- Question 6 — Average Marks Per Course

-- Question: Calculate the average marks for students scoring at least 60. Show only courses whose average is greater than 70.



-- Question: Find courses where:

-- Students are from Lucknow
-- Marks are >= 60
-- Course has at least 2 qualifying students
-- Show course name and number of students
-- Sort highest to lowest
-- Return only top 5