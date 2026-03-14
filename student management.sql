CREATE DATABASE StudentManagement;
use StudentManagement;
CREATE TABLE students (
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Grade varchar(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
    );
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
	('Riya','Female',15,'B',75,93,87),
    ('Arun','Male',16,'A',80,99,97),
    ('Kiran','Male',16,'B',75,83,77),
    ('Alice','Male',15,'B',76,92,86),
    ('Bob','Male',14,'C',78,60,90),
    ('Shruthi','Female',16,'B',95,83,77),
    ('Madhu','Male',15,'C',85,73,87),
    ('Arya','Male',15,'A',91,95,89),
    ('Adithi','Female',16,'A',99,91,97),
    ('Vasu','Male',16,'A',91,93,97),
    ('Siri','Female',15,'A',95,93,91);
-- display the table
SELECT * FROM students;

-- total count of students
select count(*) from students;

-- average score in each subject
SELECT AVG(MathScore) AS AVG_MATH,
AVG(ScienceScore) AS AVG_SCIENCE,
AVG(EnglishScore) AS AVG_ENGLISH FROM students;

-- top performer (Highest total score)
SELECT Name, (MathScore+sciencescore+englishscore) AS TOTAL_SCORE FROM STUDENTS
ORDER BY TOTAL_SCORE DESC
LIMIT 1;

-- total count by grade
SELECT Grade, COUNT(*) FROM students
GROUP BY grade;

-- average score by gender
SELECT gender, AVG(mathscore+sciencescore+englishScore) AS AVG_TOTALSCORE FROM Students 
GROUP BY Gender;

-- Students with Math>80
SELECT Name, MathScore FROM Students WHERE MathScore>80;

-- update a student grade
UPDATE Students SET Grade = 'B' WHERE studentID = 5;
