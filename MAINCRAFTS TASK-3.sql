CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Students (
    sid INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Courses (
    cid INT PRIMARY KEY,
    cname VARCHAR(50)
);

CREATE TABLE Enrollments (
    sid INT,
    cid INT,
    marks INT,
    FOREIGN KEY (sid) REFERENCES Students(sid),
    FOREIGN KEY (cid) REFERENCES Courses(cid)
);

INSERT INTO Students VALUES
(1, 'Asha'),
(2, 'Ravi'),
(3, 'Kiran'),
(4, 'Neha'),
(5, 'Arjun');

INSERT INTO Courses VALUES
(101, 'Maths'),
(102, 'Physics'),
(103, 'Chemistry');

INSERT INTO Enrollments VALUES
(1, 101, 85),
(1, 102, 78),
(2, 101, 92),
(2, 103, 60),
(3, 102, 35),
(3, 103, 55),
(4, 101, 40),
(4, 102, 42),
(5, 103, 88);

-- Top student per course
SELECT c.cname, s.name, e.marks
FROM Enrollments e
JOIN Students s ON e.sid = s.sid
JOIN Courses c ON e.cid = c.cid
WHERE (e.cid, e.marks) IN (
    SELECT cid, MAX(marks)
    FROM Enrollments
    GROUP BY cid
);
-- Pass rate per course (marks ≥ 40)
SELECT c.cname,
       COUNT(CASE WHEN e.marks >= 40 THEN 1 END) * 100.0 / COUNT(*) AS pass_rate
FROM Enrollments e
JOIN Courses c ON e.cid = c.cid
GROUP BY c.cname
HAVING COUNT(*) > 0;
-- Overall topper across all courses
SELECT s.name, SUM(e.marks) AS total_marks
FROM Enrollments e
JOIN Students s ON e.sid = s.sid
GROUP BY s.sid, s.name
HAVING SUM(e.marks) = (
    SELECT MAX(total_marks)
    FROM (
        SELECT sid, SUM(marks) AS total_marks
        FROM Enrollments
        GROUP BY sid
    ) AS temp
);
-- Students enrolled in multiple courses
SELECT s.name, COUNT(e.cid) AS course_count
FROM Enrollments e
JOIN Students s ON e.sid = s.sid
GROUP BY s.sid, s.name
HAVING COUNT(e.cid) > 1;