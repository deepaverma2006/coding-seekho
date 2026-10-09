CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    enrollment_date DATE
);

INSERT INTO students
(name, age, gender, city, enrollment_date)
VALUES
('Aarav Sharma', 17, 'Male', 'Delhi', '2023-04-01'),
('Priya Gupta', 16, 'Female', 'Mumbai', '2023-04-03'),
('Rahul Verma', 18, 'Male', 'Delhi', '2022-06-15'),
('Sneha Patel', 15, 'Female', 'Lucknow', '2023-07-20'),
('Amit Singh', 17, 'Male', 'Jaipur', '2022-09-10'),
('Divya Nair', 16, 'Female', 'Chennai', '2023-01-05'),
('Karan Mehta', 18, 'Male', 'Delhi', '2021-11-22'),
('Anjali Yadav', 15, 'Female', 'Lucknow', '2023-03-18'),
('Vikram Joshi', 17, 'Male', 'Mumbai', '2022-08-30'),
('Neha Tiwari', 16, 'Female', 'Delhi', '2023-05-14');


CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    teacher_name VARCHAR(100),
    max_marks INT
);


INSERT INTO subjects
(subject_name, teacher_name, max_marks)
VALUES
('Mathematics', 'Mr. Rajesh Kumar', 100),
('Science', 'Mrs. Sunita Sharma', 100),
('English', 'Mr. Anil Verma', 80),
('History', 'Mrs. Pooja Mishra', 80),
('Computer', 'Mr. Deepak Singh', 100);



CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    subject_id INT REFERENCES subjects(subject_id),
    marks_obtained INT,
    exam_date DATE
);

INSERT INTO grades
(student_id, subject_id, marks_obtained, exam_date)
VALUES
(1, 1, 88, '2024-03-10'),
(1, 2, 72, '2024-03-11'),
(1, 3, 65, '2024-03-12'),
(1, 4, 70, '2024-03-13'),
(1, 5, 91, '2024-03-14'),
(2, 1, 92, '2024-03-10'),
(2, 2, 78, '2024-03-12'),
(2, 3, 75, '2024-03-12'),
(2, 4, 68, '2024-03-14'),
(2, 5, 95, '2024-03-14'),
(3, 1, 65, '2024-03-10'),
(3, 2, 55, '2024-03-11'),
(3, 3, 60, '2024-03-12'),
(3, 4, 52, '2024-03-13'),
(3, 5, 72, '2024-03-14'),
(4, 1, 80, '2024-03-10'),
(4, 2, 75, '2024-03-11'),
(4, 3, 70, '2024-03-12'),
(4, 4, 62, '2024-03-13'),
(4, 5, 88, '2024-03-14'),
(5, 1, 45, '2024-03-10'),
(5, 2, 50, '2024-03-11'),
(5, 3, 55, '2024-03-12'),
(5, 4, 48, '2024-03-13'),
(5, 5, 60, '2024-03-14'),
(6, 1, 80, '2024-03-10'),
(6, 2, 74, '2024-03-11'),
(6, 3, 68, '2024-03-12'),
(6, 4, 63, '2024-03-13'),
(6, 5, 90, '2024-03-14'),
(7, 1, 91, '2024-03-10'),
(7, 2, 85, '2024-03-11'),
(7, 3, 77, '2024-03-12'),
(7, 4, 72, '2024-03-13'),
(7, 5, 96, '2024-03-14'),
(8, 1, 33, '2024-03-10'),
(8, 2, 40, '2024-03-11'),
(8, 3, 45, '2024-03-12'),
(8, 4, 38, '2024-03-13'),
(8, 5, 55, '2024-03-14'),
(9, 1, 68, '2024-03-10'),
(9, 2, 63, '2024-03-11'),
(9, 3, 70, '2024-03-12'),
(9, 4, 55, '2024-03-13'),
(9, 5, 78, '2024-03-14'),
(10, 1, 95, '2024-03-10'),
(10, 2, 90, '2024-03-11'),
(10, 3, 82, '2024-03-12'),
(10, 4, 75, '2024-03-13'),
(10, 5, 99, '2024-03-14');



-- Q1. students Table — SELECT & WHERE
-- Based on the students table, answer the following:

-- a) Retrieve the name, age, and city of all students who are from 'Delhi' and older than 16 years. Sort the result by name in ascending order.
SELECT name, age, city
FROM students
WHERE city = 'Delhi'
AND age > 16
ORDER BY name ASC;

-- b) Display all distinct cities from which students have enrolled.
SELECT DISTINCT city
FROM students;

-- c) Fetch the complete details of all female students.
SELECT *
FROM students
WHERE gender = 'Female'

-- d) List all students who enrolled after 1st January 2023, ordered by enrollment_date in descending order.
SELECT name,enrollment_date
FROM students
WHERE enrollment_date>'01-01-2023'
ORDER BY enrollment_date DESC;

-- e) Show all students whose age is between 15 and 18 (inclusive).
SELECT name,age
FROM students
WHERE age BETWEEN '15' AND '18';



-- Q2. students Table — DISTINCT & LIKE
-- Based on the students table, answer the following:

-- a) Retrieve the name and city of all students whose name starts with 'A'.
SELECT name,city
FROM students
WHERE name LIKE 'A%';

-- b) Find all students whose city ends with the letter 'i'. 
SELECT *
FROM students
WHERE city LIKE '%i';

-- c) Display all distinct gender values present in the table. 
SELECT DISTINCT gender
FROM students;

-- d) List students whose name contains the word 'Kumar' anywhere. 
SELECT *
FROM students
WHERE name LIKE '%Kumar%';

-- e) Retrieve the first 5 students (by student_id) from the table. 
SELECT *
FROM students
ORDER BY student_id ASC
LIMIT 5;


-- Q3. subjects Table — Filtering & Sorting 
-- Based on the subjects table, answer the following:

-- a) Retrieve all subjects where max_marks is 100.
SELECT *
FROM subjects
WHERE max_marks = 100;

-- b) Display subject_name and teacher_name sorted alphabetically by subject_name.
SELECT subject_name,teacher_name
FROM subjects
ORDER BY subject_name ASC;

-- c) Find all subjects taught by teachers whose name starts with 'Mr.'. 
SELECT *
FROM subjects
WHERE teacher_name LIKE 'Mr.%';

-- d) List all subjects where  is less than 100.
SELECT *
FROM subjects
WHERE max_marks<100;

-- e) Show all distinct max_marks values available in the subjects table.
SELECT DISTINCT max_marks
FROM subjects;


-- Q4. grades Table — Basic Queries
-- Based on the grades table, answer the following: 

-- a) Retrieve all grade records where marks_obtained > 80. 
SELECT *
FROM grades
WHERE marks_obtained > 80;

-- b) Display all records where marks_obtained < 50 (failing students).
SELECT *
FROM grades
WHERE marks_obtained < 50; 

-- c) Fetch all grade records for exam_date '2024-03-10'.
SELECT *
FROM grades
WHERE exam_date = '2024-03-10';

-- d) List all grade records where marks_obtained is between 60 and 90. 
SELECT *
FROM grades
WHERE marks_obtained BETWEEN 60 AND 90;

-- e) Show all grade records ordered by marks_obtained descending. Display only the top 5.
SELECT *
FROM grades
ORDER BY marks_obtained DESC
LIMIT 5;


-- Q5. students Table — ORDER BY & LIMIT
-- Based on the students table, answer the following:

-- a) Retrieve the name and enrollment_date of the 3 most recently enrolled students.
SELECT name, enrollment_date
FROM students
ORDER BY enrollment_date DESC
LIMIT 3;

-- b) Display all male students from 'Delhi', sorted by age descending.
SELECT *
FROM students
WHERE gender = 'Male'
AND city = 'Delhi'
ORDER BY age DESC;

-- c) List all students whose age is NOT 17.
SELECT *
FROM students
WHERE age <> 17;

-- d) Show students from either 'Mumbai' or 'Lucknow'.
SELECT *
FROM students
WHERE city = 'Mumbai'
OR city = 'Lucknow';

-- e) Write a query to display all students where city is NULL.
SELECT *
FROM students
WHERE city IS NULL;

-- Q6. grades Table — Aggregate Functions
-- Based on the grades table, answer the following: 

-- a) Find the total number of grade records in the table.
SELECT COUNT(*) AS total_records
FROM grades;

-- b) Calculate the average marks_obtained across all records.
SELECT AVG(marks_obtained) AS average_marks
FROM grades;

-- c) Find the highest marks_obtained in the entire table.
SELECT MAX(marks_obtained) AS highest_marks
FROM grades;

-- d) Find the lowest marks_obtained in the entire table.
SELECT MIN(marks_obtained) AS lowest_marks
FROM grades;

-- e) Calculate the sum of marks_obtained for student_id = 2.
SELECT SUM(marks_obtained) AS total_marks
FROM grades
WHERE student_id = 2;

-- Q7. grades Table — GROUP BY
-- Based on the grades table, use GROUP BY:

-- a) Find the total marks scored by each student (group by student_id).
SELECT student_id, SUM(marks_obtained) AS total_marks
FROM grades
GROUP BY student_id;

-- b) Find the average marks scored per subject (group by subject_id).
SELECT subject_id, AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY subject_id;

-- c) Count how many exams each student has appeared in.
SELECT student_id, COUNT(*) AS total_exams
FROM grades
GROUP BY student_id;

-- d) Find the maximum marks scored by each student across all subjects. 
SELECT student_id, MAX(marks_obtained) AS highest_marks
FROM grades
GROUP BY student_id;

-- e) Find the minimum marks scored in each subject.
SELECT subject_id, MIN(marks_obtained) AS lowest_marks
FROM grades
GROUP BY subject_id;

-- Q8. grades Table — HAVING Clause
-- Based on the grades table, use GROUP BY + HAVING:

-- a) Find all students whose total marks are greater than 200.
SELECT student_id, SUM(marks_obtained) AS total_marks
FROM grades
GROUP BY student_id
HAVING SUM(marks_obtained) > 200;

-- b) Find subjects where the average marks are above 70.
SELECT subject_id, AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY subject_id
HAVING AVG(marks_obtained) > 70;

-- c) List students who have appeared in more than 2 exams.
SELECT student_id, COUNT(*) AS total_exams
FROM grades
GROUP BY student_id
HAVING COUNT(*) > 2;

-- d) Find subjects where the maximum marks scored is greater than 90.
SELECT subject_id, MAX(marks_obtained) AS highest_marks
FROM grades
GROUP BY subject_id
HAVING MAX(marks_obtained) > 90;

-- e) Find students whose average marks across all subjects is less than 60.
SELECT student_id, AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY student_id
HAVING AVG(marks_obtained) < 60;


-- Q9. subjects Table — COUNT & AVG
-- Based on the subjects table, answer the following:

-- a) Count the total number of subjects available.
SELECT COUNT(*) AS total_subjects
FROM subjects;

-- b) Find the average max_marks across all subjects.
SELECT AVG(max_marks) AS average_max_marks
FROM subjects;

-- c) Find the subject with the highest max_marks.
SELECT subject_name, max_marks
FROM subjects
WHERE max_marks = (
    SELECT MAX(max_marks)
    FROM subjects
);

-- d) Count how many subjects have max_marks = 100.
SELECT COUNT(*) AS total_subjects
FROM subjects
WHERE max_marks = 100;

-- e) List each teacher name and count how many subjects they teach.
SELECT teacher_name, COUNT(*) AS total_subjects
FROM subjects
GROUP BY teacher_name;


-- Q10. students Table — Aggregates + Filters
-- Based on the students table, answer the following: 

-- a) Count the total number of students enrolled.
SELECT COUNT(*) AS total_students
FROM students;

-- b) Count students grouped by city.
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city;

-- c) Count students grouped by gender.
SELECT gender, COUNT(*) AS total_students
FROM students
GROUP BY gender;

-- d) Find the average age of all students.
SELECT AVG(age) AS average_age
FROM students;

-- e) Find all cities that have more than 2 students enrolled.
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city
HAVING COUNT(*) > 2;


-- Q11. JOIN — students + grades
-- Perform JOIN operations between the students and grades tables:

-- a) Display each student's name along with their marks_obtained and exam_date. (INNER JOIN)
SELECT s.name, g.marks_obtained, g.exam_date
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id;

-- b) List all students and their total marks. Include students with no grade records. (LEFT JOIN)
SELECT s.name,
       COALESCE(SUM(g.marks_obtained), 0) AS total_marks
FROM students s
LEFT JOIN grades g
ON s.student_id = g.student_id
GROUP BY s.student_id, s.name;

-- c) Find the name of the student who scored the highest marks_obtained overall. 
SELECT s.name, g.marks_obtained
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id
WHERE g.marks_obtained = (
    SELECT MAX(marks_obtained)
    FROM grades
);

-- d) Show all students from 'Delhi' along with their marks in each exam.
SELECT s.name, g.marks_obtained, g.exam_date
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id
WHERE s.city = 'Delhi';

-- e) Count the number of exams each student appeared in, and show the student name alongside the count.
SELECT s.name, COUNT(g.grade_id) AS total_exams
FROM students s
LEFT JOIN grades g
ON s.student_id = g.student_id
GROUP BY s.student_id, s.name;


-- Q12. JOIN — students + grades + subjects (3-table JOIN)
-- Perform 3-table JOIN operations across students, grades, and subjects:

-- a) Display each student's name, subject_name, and marks_obtained.
SELECT s.name, sub.subject_name, g.marks_obtained
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id
INNER JOIN subjects sub
ON g.subject_id = sub.subject_id;

-- b) Find all students who scored more than 80 in 'Mathematics'. Show student name and marks.
SELECT s.name, g.marks_obtained
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id
INNER JOIN subjects sub
ON g.subject_id = sub.subject_id
WHERE sub.subject_name = 'Mathematics'
AND g.marks_obtained > 80;

-- c) List all subjects along with the average marks scored by students in that subject.
SELECT sub.subject_name,
       AVG(g.marks_obtained) AS average_marks
FROM subjects sub
LEFT JOIN grades g
ON sub.subject_id = g.subject_id
GROUP BY sub.subject_id, sub.subject_name;

-- d) Show names of students who scored above the average marks in 'Computer'.
SELECT s.name, g.marks_obtained
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id
INNER JOIN subjects sub
ON g.subject_id = sub.subject_id
WHERE sub.subject_name = 'Computer'
AND g.marks_obtained > (
    SELECT AVG(g2.marks_obtained)
    FROM grades g2
    INNER JOIN subjects sub2
    ON g2.subject_id = sub2.subject_id
    WHERE sub2.subject_name = 'Computer'
);

-- e) Display full result: student name, subject name, marks obtained, exam date — sorted by student name, then subject name.
SELECT s.name,
       sub.subject_name,
       g.marks_obtained,
       g.exam_date
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id
INNER JOIN subjects sub
ON g.subject_id = sub.subject_id
ORDER BY s.name ASC, sub.subject_name ASC;


-- Q13. Library Records System
-- A school library wants to maintain a record of books borrowed by students — including which book was taken, when it was borrowed, and when it was returned.

-- a) Design a suitable table (e.g. library_records) with appropriate columns and data types. Write the CREATE TABLE statement.
CREATE TABLE library_records (
    record_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    book_name VARCHAR(100) NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE
);

-- b) Insert at least 6 sample records into your table.
-- c) Retrieve all books that are currently borrowed and not yet returned.
-- d) Find all books borrowed by a student named 'Rahul'.
-- e) Count how many books each student has borrowed. Show only students who borrowed more than 2 books.



