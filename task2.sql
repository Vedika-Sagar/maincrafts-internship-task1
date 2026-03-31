USE studentmanagement;
CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- all students enrolled in each course
SELECT c.name AS course_name, s.name AS student_name
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id
ORDER BY c.name;

-- average grade per course
SELECT c.name AS course_name, AVG(e.grade) AS avg_grade
FROM enrollments e
JOIN courses c ON e.course_id = c.id
GROUP BY c.name;

-- top 3 students
SELECT s.name, AVG(e.grade) AS avg_grade
FROM enrollments e
JOIN students s ON e.student_id = s.id
GROUP BY s.name
ORDER BY avg_grade DESC
LIMIT 3;

-- student who failed count
SELECT COUNT(DISTINCT student_id) AS failed_students
FROM enrollments
WHERE grade < 40;