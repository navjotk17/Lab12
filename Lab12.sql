-- Display all courses
SELECT * 
FROM courses;

-- Display the first 10 rows from assignments
SELECT * 
FROM assignments
LIMIT 10;

-- Count the total number of courses
SELECT count(*) 
FROM courses;

-- Find the earliest assignment due date
SELECT min(due_date) AS earliest_due_date
FROM assignments;

-- Find all courses with names starting with 'Intro'
SELECT * 
FROM courses
WHERE course_name LIKE 'Intro%';

-- Find all assignments not completed, ordered by due date
SELECT * 
FROM assignments
WHERE status != 'Completed'
ORDER BY due_date;

-- Filter assignments for a specific course prefix and due date
SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'	
  AND course_id LIKE 'COMM%'
  AND due_date < '2024-12-31'
ORDER BY due_date;

-- Assignments for the course COMP1234
SELECT title, due_date 
FROM assignments 
WHERE course_id = 'COMP1234';

-- Find the earliest assignment due date
SELECT min(due_date) AS earliest_due_date 
FROM assignments;

-- Find the latest assignment due date
SELECT max(due_date) AS latest_due_date 
FROM assignments;

-- Find assignments due on 2024-10-08
SELECT title, course_id 
FROM assignments 
WHERE due_date = '2024-10-08';

-- Find all assignments due in October 2024
SELECT title, due_date 
FROM assignments 
WHERE due_date LIKE '2024-10%';

-- Find the most recent completed assignment
SELECT max(due_date) AS most_recent_completed_due_date 
FROM assignments 
WHERE status = 'Completed';

-- Count the total number of "Not Started" assignments
SELECT count(*) AS not_started_count
FROM assignments 
WHERE status = 'Not Started';

-- Find courses with labs on Tuesday
SELECT course_id, course_name 
FROM courses 
WHERE course_name LIKE '%Tue%';

-- Join courses and assignments tables to show assignments with course details
SELECT courses.course_id, courses.course_name, assignments.title, assignments.due_date
FROM courses 
JOIN assignments 
  ON courses.course_id = assignments.course_id;
  
  
-- Add an assignment with NULL due_date
INSERT INTO assignments (course_id, title, status) 
VALUES ('COMP1238', 'Assignment with no date', 'Not Started');

SELECT * FROM assignments
LIMIT 10; 

SELECT count(*) FROM courses;

SELECT min(due_date) FROM assignments;

SELECT *
FROM  courses
WHERE course_name LIKE 'Intro%';

SELECT sqlite_version();

SELECT upper('ABCxyz');

SELECT length('abcde');

SELECT 7*5;

SELECT concat('ABC', '-', 'xyz');

SELECT date();

SELECT strftime('%Y', due_date) AS Year, * 
FROM assignments;

-- SUBSTRING(string, start, length)
SELECT DISTINCT SUBSTRING(course_id, 1, 4) 
FROM courses;

-- Count how many courses there are with each prefix like 'MATH' and 'COMP'
SELECT SUBSTRING(course_id, 1, 4) AS prefix, count(*)
FROM courses
GROUP BY prefix;

SELECT *
FROM  assignments
WHERE status != 'Completed'
ORDER BY due_date;

-- Use this query as a reference for the next step
SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'	
  AND course_id LIKE 'COMM%'
  AND due_date < '2024-12-31'
ORDER BY due_date;

--Exercise Queries
-- 1. Concatenate Course Name and Semester
SELECT course_name || ' - ' || semester AS course_semester
FROM courses;

-- 2. Find Courses with Labs on Fridays
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE '%Friday%';

-- 3. Upcoming Assignments
SELECT *
FROM assignments
WHERE due_date > date('now');

-- 4. Count Assignments by Status
SELECT status, COUNT(*) AS assignment_count
FROM assignments
GROUP BY status;

-- 5. Longest Course Name
SELECT course_name, LENGTH(course_name) AS name_length
FROM courses
ORDER BY LENGTH(course_name) DESC
LIMIT 1;

-- 6. Uppercase Course Names
SELECT UPPER(course_name) AS course_name_uppercase
FROM courses;

-- 7. Assignments Due in September
SELECT title
FROM assignments
WHERE due_date LIKE '____-09-%';

-- 8. Assignments with Missing Due Dates
SELECT *
FROM assignments
WHERE due_date IS NULL;

-- Optional 1: Total Assignments per Course
SELECT courses.course_id, COUNT(assignments.id) AS total_assignments
FROM courses
LEFT JOIN assignments ON courses.course_id = assignments.course_id
GROUP BY courses.course_id;

-- Optional 2: Courses Without Assignments
SELECT courses.course_id, courses.course_name
FROM courses
LEFT JOIN assignments ON courses.course_id = assignments.course_id
WHERE assignments.id IS NULL;
