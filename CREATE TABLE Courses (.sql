CREATE TABLE Courses (
id_course serial PRIMARY KEY,
title VARCHAR (100) NOT NULL,
description TEXT,
hours INTEGER DEFAULT (40)
);

CREATE TABLE Students (
    id_stud SERIAL PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    surname VARCHAR (50) NOT NULL
);

CREATE TABLE Exams (
    id_stud INTEGER REFERENCES Students(id_stud ) ON DELETE SET NULL ON UPDATE CASCADE,
    id_course INTEGER REFERENCES Courses (id_course) ON DELETE SET NULL ON UPDATE CASCADE,
    mark INTEGER CHECK (mark>0) NOT NULL
);

INSERT INTO COURSES (TITLE, HOURS) VALUES 
('COORSE1', 60), ('COURSE2', 70), ('COURSE3', 90), ('COURSE4', 65);


INSERT INTO STUDENTS (NAME, SURNAME) VALUES
('NAME1', 'SURNAME1'),
('NAME2', 'SURNAME2'),
('NAME3', 'SURNAME3'),
('NAME4', 'SURNAME4'),
('NAME5', 'SURNAME5'),
('NAME6', 'SURNAME6'),
('NAME7', 'SURNAME7'),
('NAME8', 'SURNAME8'),
('NAME9', 'SURNAME9'),
('NAME10', 'SURNAME10');

INSERT INTO Exams VALUES
(1,1,3), (1,2,4), (1,3,4), (1,4,4),
(2,1,4), (2,4,3),
(3,2,3), (3,3,3), (3,4,3),
(4, 1, 4), (4,2,3),
(5,2,4), (5,3,4), (5,4,3),
(6,1,5), (6,2,5), (6,3,5), (6,4,5),
(7,1,5), (7,2,4), (7,3,4), (5,4,5),
(8,1,4), (8,4,3),
(9,2,3), (9,3,3), (9,4,3),
(10, 1, 4), (10,2,3), (10, 3,4), (10,4,4);

-- получить список студентов

SELECT *
FROM STUDENTS;

-- получить список курсов

SELECT *
FROM COURSES;

SELECT *
FROM EXAMS;

-- список студентов , которые учатся на конкретном курсе
SELECT COURSES.TITLE, STUDENTS.NAME, STUDENTS.SURNAME
FROM EXAMS 
JOIN Courses ON EXAMS.id_course = COURSES.id_course 
JOIN STUDENTS ON STUDENTS.id_stud = EXAMS.id_stud
WHERE Exams.id_course = 1;

-- вывести журнал оценок в виде fullName + mark
SELECT CONCAT (S.NAME,' ',S.SURNAME) AS FULLNAME, E.MARK
FROM EXAMS AS E
JOIN STUDENTS AS S ON S.id_stud = E.id_stud
WHERE E.id_course = 1;

-- список курсов который изучает конкретный студент
SELECT C.TITLE
FROM COURSES AS C
JOIN EXAMS AS E ON E.id_course= C.id_course
JOIN STUDENTS AS S ON S.id_stud=E.id_stud
WHERE S.id_stud = 1;

-- список курсов которые идут более 40 часов
SELECT C.TITLE
FROM COURSES AS C
WHERE C.HOURS > 60;

-- средний бал студента по вмем предметам
SELECT e.id_stud, CONCAT (s.NAME, ' ', s.SURNAME), ROUND (AVG(e.MARK),2)
FROM EXAMS as e
JOIN STUDENTS as s ON e.id_stud = s.id_stud
GROUP BY e.id_stud, s.NAME, s.SURNAME
ORDER BY e.id_stud;

--  какой предмет студент сдал лучше остальных
SELECT CONCAT (S.NAME, ' ', S.SURNAME) AS "FULLNAME", MAX(E.MARK) AS MV, C.TITLE
FROM STUDENTS AS S
JOIN Exams AS E ON e.id_stud= S.id_stud 
JOIN Courses AS C ON E.id_course = C.id_course
GROUP BY "FULLNAME", C.TITLE
ORDER BY "FULLNAME",  MV DESC
;


SELECT concat(S.name, ' ', S.surname) as "fullName", MAX(E.mark) as BM
FROM Exams as E
JOIN Courses as C ON E.id_course = C.id_course
JOIN Students as S ON S.id_stud = E.id_stud
GROUP BY "fullName";

SELECT Courses.TITLE, MAX (EXAMS.MARK)
FROM EXAMS
JOIN Courses USING (id_course)
JOIN STUDENTS USING (id_stud)
GROUP BY Courses.TITLE
;

--СРЕДНИЙ БАЛЛ ПО ГРУППЕ СТУДЕНТОВ ПО КАЖДОМУ КУРСУ
SELECT C.TITLE, ROUND (AVG(E.MARK),2)
FROM EXAMS AS E
JOIN COURSES AS C USING (id_course)
GROUP BY C.TITLE;

--КТО ИЗ СТУДЕНТОВ КОНКРЕТНОГО КУРСА ЛУЧШЕ УЧИТСЯ
SELECT C.TITLE, MAX (E.MARK)
FROM Courses AS C
JOIN EXAMS AS E USING (id_course)
GROUP BY C.TITLE;

CREATE DATABASE PRACTICE_1106;