-- drop table Workers;

-- CREATE DATABASE studs;

-- CREATE TABLE Stud(
--     id serial,
--     firstName varchar(250),
--     lastName varchar(250),
--     birthday date,
--     address varchar(300),
--     isMale boolean,
--     yearOfStudy SMALLINT
-- );

-- INSERT into stud VALUES 
-- ('Tom', 'Adson', '01.01.2020', 'ZP', true, 2),
-- ('Alice', 'Adson', '01.06.2020', 'ZP', false, 2),
-- ('Tom', 'Adson', '01.05.2020', 'ZP', true, 2),
-- ('Tom', 'Adson', '01.12.2020', 'ZP', true, 2),
-- ('Tom', 'Adson', '01.01.2001', 'ZP', true, 2);

-- SELECT *
-- FROM stud;

-- SELECT *
-- FROM stud
-- limit 3;

-- SELECT *
-- from stud
-- order by yearOfStudy ASC;

-- SELECT *
-- from stud
-- order by yearOfStudy DESC;

-- SELECT firstName, lastName, yearOfStudy
-- FROM stud
-- order by yearOfStudy DESC
-- LIMIT 5;

-- CREATE TABLE Workers (
--     id serial,
--     имя varchar (20),
--     фамилия varchar (20),
--     отчество varchar (20),
--     должность varchar (20),
--     зарплата money,
--     дата_найма date,
--     телефон varchar (20),
--     адрес varchar (20),
--     почта varchar (20)
-- );

-- INSERT into Workers (имя, фамилия, отчество, должность, зарплата, дата_найма, телефон, адрес, почта) VALUES 
--  ('Степан', 'Шевченко', 'Андреевич', 'директор', 20000, '20/05/2020', '+380258693142', 'Киев', '123@google.com'),
--  ('Анжелла', 'Петрова', 'Константиновна', 'менеджер', 15000, '05/06/2021', '+380854369724', 'Киев','456@google.com'),
--  ('Павел', 'Чернобров', 'Васильевич', 'рабочий', 10000, '24/08/2019', '+380123456789', 'Харьков','856@google.com');

-- SELECT * from Workers ORDER by зарплата DESC;

-- SELECT * from Workers ORDER by дата_найма ASC;

-- SELECT * from Workers ORDER by дата_найма DESC limit 3;

-- DELETE from Workers
-- where id=2;

-- SELECT *
-- from workers;

-- SELECT имя, фамилия, отчество, должность
-- from workers
-- where id=3;

-- SELECT *
-- from Workers
-- where зарплата >= money (15000);

-- SELECT *
-- from Workers
-- where дата_найма >= '01/01/2019';


-- SELECT имя, фамилия, отчество, должность
-- from workers
-- LIMIT 3 OFFSET 3;

-- drop table Workers;

-- CREATE DATABASE studs;

-- CREATE TABLE Stud(
--     id serial,
--     firstName varchar(250),
--     lastName varchar(250),
--     birthday date,
--     address varchar(300),
--     isMale boolean,
--     yearOfStudy SMALLINT
-- );

-- INSERT into stud VALUES 
-- ('Tom', 'Adson', '01.01.2020', 'ZP', true, 2),
-- ('Alice', 'Adson', '01.06.2020', 'ZP', false, 2),
-- ('Tom', 'Adson', '01.05.2020', 'ZP', true, 2),
-- ('Tom', 'Adson', '01.12.2020', 'ZP', true, 2),
-- ('Tom', 'Adson', '01.01.2001', 'ZP', true, 2);

-- SELECT *
-- FROM stud;

-- SELECT *
-- FROM stud
-- limit 3;

-- SELECT *
-- from stud
-- order by yearOfStudy ASC;

-- SELECT *
-- from stud
-- order by yearOfStudy DESC;

-- SELECT firstName, lastName, yearOfStudy
-- FROM stud
-- order by yearOfStudy DESC
-- LIMIT 5;

-- CREATE TABLE Workers (
--     id serial,
--     имя varchar (20),
--     фамилия varchar (20),
--     отчество varchar (20),
--     должность varchar (20),
--     зарплата money,
--     дата_найма date,
--     телефон varchar (20),
--     адрес varchar (20),
--     почта varchar (20)
-- );

-- INSERT into Workers (имя, фамилия, отчество, должность, зарплата, дата_найма, телефон, адрес, почта) VALUES 
--  ('Степан', 'Шевченко', 'Андреевич', 'директор', 20000, '20/05/2020', '+380258693142', 'Киев', '123@google.com'),
--  ('Анжелла', 'Петрова', 'Константиновна', 'менеджер', 15000, '05/06/2021', '+380854369724', 'Киев','456@google.com'),
--  ('Павел', 'Чернобров', 'Васильевич', 'рабочий', 10000, '24/08/2019', '+380123456789', 'Харьков','856@google.com');

-- SELECT * from Workers ORDER by зарплата DESC;

-- SELECT * from Workers ORDER by дата_найма ASC;

-- SELECT * from Workers ORDER by дата_найма DESC limit 3;

-- DELETE from Workers
-- where id=2;

-- SELECT *
-- from workers;

-- SELECT имя, фамилия, отчество, должность
-- from workers
-- where id=3;

-- SELECT *
-- from Workers
-- where зарплата >= money (15000);

-- SELECT *
-- from Workers
-- where дата_найма >= '01/01/2019';


-- SELECT имя, фамилия, отчество, должность
-- from workers
-- LIMIT 3 OFFSET 3;


-- создание таблицы
CREATE DATABASE STUDY;
CREATE table Дисциплина (
    название varchar(50),
    описание varchar(300),
    количество_часов integer
);
CREATE table Экзамен(
    фио_студента varchar (200),
    какая_дисциплина_сдана varchar (50),
    оценка integer,
    дата_сдачи date
);
-- 1 добавьте (вставьте данные)
INSERT into Дисциплина
VALUES ('математика', 'общий курс', 150),
    ('физика', 'углубленный курс', 200),
    ('история', 'общий курс', 100),
    ('английский язык', 'для физиков', 120);
INSERT into Экзамен
VALUES ('Андреев И.П.', 'история', 4, '03.05.2023'),
    ('Васильева А.А.', 'физика', 5, '07.05.2023'),
    (
        'Бородин В.С',
        'английский язык',
        3,
        '12.05.2023'
    ),
    ('Сергеева С.С.', 'математика', 4, '09.05.2023');
-- 2 получить список предметов
SELECT название
from Дисциплина;
-- 3 студенты которые учатся на курсе “data base”
INSERT into Экзамен
VALUES ('John Bubble', 'data base', 5, '01.05.2023'),
    ('Alison Ford', 'data base', 4, '08.05.2023'),
    ('Alex Damage', 'data base', 4, '09.05.2023');
INSERT into Дисциплина
VALUES ('data base', 'beginner', 30);
SELECT *
FROM Дисциплина
    INNER JOIN Экзамен ON (
        Дисциплина.название = Экзамен.какая_дисциплина_сдана
    )
WHERE название = 'data base';
-- 4 студенты кто сдал на отлично курс data base
SELECT *
FROM Дисциплина
    INNER JOIN Экзамен ON (
        Дисциплина.название = Экзамен.какая_дисциплина_сдана
    )
WHERE название = 'data base'
    AND оценка = 5;
-- 5 получить список курсов которые прошел конкретный студент 
SELECT какая_дисциплина_сдана
from Экзамен
WHERE фио_студента = 'Alison Ford';
-- 6 получить список курсов которые идут более 40 часов
SELECT название
from Дисциплина
WHERE количество_часов > 40;
-- 7 обновите информацию о какой-то конкретной дисциплине
UPDATE Дисциплина
SET количество_часов = 30
WHERE название = 'физика';
SELECT *
FROM Дисциплина;
-- 8 удалите любую дисциплину
DELETE from Дисциплина
where описание = 'углубленный курс';
SELECT *
FROM Дисциплина;


CREATE TABLE Users (
    id serial PRIMARY KEY,
    name varchar (50) NOT NULL,
    surname varchar (50) NOT NULL,
    isMale boolean,
    age integer CHECK (age>0) ,
    tel char (20) Unique,
    email varchar (50) NOT NULL UNIQUE
);

CREATE TABLE Tasks (
    id serial PRIMARY KEY,
    name varchar (100),
    description text,
    createdDate date Default now(),
    deadline date NOT NULL,
    salary money DEFAULT 0 NOT NULL CHECK(salary >= money(0)),
    userId integer REFERENCES Users (id)
);


drop table Users;
drop table Tasks;

INSERT INTO Users (name, surname, isMale, age, email) VALUES
('Name1', 'Surname1', true, 20, 'name1@mail.com'),
('Name2', 'Surname2', false, 22, 'name2@mail.com'),
('Name3', 'Surname3', true, 18, 'name3@mail.com'),
('Name4', 'Surname4', true, 20, 'name4@mail.com'),
('Name5', 'Surname5', true, 25, 'name5@mail.com'),
('Name6', 'Surname6', true, 28, 'name6@mail.com'),
('Name7', 'Surname7', false, 21, 'name7@mail.com');

INSERT INTO Tasks(name, deadline, salary, userId) VALUES
('task1', '2023-06-03', 1000, 1),
('task1', '2023-06-09', 1200, 3),
('task1', '2023-06-08', 1040, 4),
('task2', '2023-06-07', 1220, 1),
('task2', '2023-06-08', 2000, 7),
('task3', '2023-06-05', 1400, 2),
('task3', '2023-06-06', 2500, 7),
('task4', '2023-06-03', 2050, 6),
('task5', '2023-06-07', 2430, 7);

SELECT *
from Users;

SELECT Tasks.name, Tasks.deadline, Users.surname, Users.email
from Tasks, Users
WHERE Tasks.userid = Users.id and Tasks.name = 'task1';

SELECT Tasks.name, Tasks.deadline, Users.surname, Users.email
from Tasks, Users
WHERE Tasks.userid = Users.id and Users.email='name1@mail.com';

SELECT name, surname, ismale, age, email
from Users
where ismale='true' and age>20
ORDER by age DESC ;

SELECT Users.name, Users.surname, Users.ismale, Tasks.name
from Users, Tasks
where tasks.userId=Users.id and Users.ismale=false;


update users 
set email = 'name11@mail.com'
where name = 'Name3';

DELETE from Users 
where id='3';

SELECT name, deadline 
from tasks
where deadline BETWEEN '05.06.2023' and '08.06.2023';

update tasks 
set deadline = deadline+2
where deadline BETWEEN '05.06.2023' and '08.06.2023';

UPDATE tasks
set salary = salary *1.2
where name = 'task2';


CREATE DATABASE DB;

CREATE table Roles (
    id serial PRIMARY key UNIQUE,
    name VARCHAR (50) NOT
     NULL UNIQUE,
    description VARCHAR (300),
    idGroup INTEGER
);

CREATE table Groups (
    id serial  PRIMARY key,
    name VARCHAR (50) NOT NULL UNIQUE
);

CREATE TABLE Users (
    id serial PRIMARY KEY,
    email VARCHAR (50) NOT NUll UNIQUE,
    login VARCHAR (50) NOT NUll UNIQUE,
    passwordHash TEXT NOT NUll UNIQUE,
    fullName VARCHAR (200) NOT NULL,
    idRole INTEGER REFERENCES Roles (id)
);

INSERT INTO Groups (name) VALUES 
('users_dev'), ('users_home'), ('users_main'), ('moderator'), ('super');

insert into Roles (name, idGroup) VALUES 
('starter', 1), ('beginner', 1), ('middle', 1), ('senior', 1), 
('unknown', 1), ('guest', 1), ('moderator_db', 2), ('moderator_net', 2),
('moderator_pro', 2), ('admin_db', 3), ('admin_pro',3);

INSERT into Users (email, login, passwordHash, fullName, idRole) VALUES
('man1@mail.com', 'man1', 'qwerty', 'man1 man1', 1),
('man2@mail.com', 'man2', 'qwerty1', 'man2 man2', 10),
('man3@mail.com', 'man3', 'qwerty2', 'man3 man3', 1),
('man4@mail.com', 'man4', 'qwerty3', 'man4 man4', 2),
('man5@mail.com', 'man5', 'qwerty4', 'man5 man5', 7),
('man6@mail.com', 'man6', 'qwerty5', 'man6 man6', 7),
('man7@mail.com', 'man7', 'qwerty6', 'man7 man7', 2),
('man8@mail.com', 'man8', 'qwerty7', 'man8 man8', 9),
('man9@mail.com', 'man9', 'qwerty8', 'man9 man9', 8),
('man10@mail.com', 'man10', 'qwerty9', 'man10 man10', 11),
('man11@mail.com', 'man11', 'qwerty10', 'man11 man11', 3),
('man12@mail.com', 'man12', 'qwerty11', 'man12 man12', 3),
('man13@mail.com', 'man13', 'qwerty12', 'man13 man13', 4),
('man14@mail.com', 'man14', 'qwerty13', 'man14 man14', 1),
('man15@mail.com', 'man15', 'qwerty14', 'man15 man15', 4);

--список ролей в группе users_dev
SELECT Roles.name
from Roles,Groups
Where Groups.name = 'users_dev' AND Groups.id=Roles.idGroup;


--список людей по роли 'starter'
SELECT Users.fullName
from Users, Roles
where Roles.name = 'starter' and Roles.id=Users.idRole;

--список людей в группе 'users_dev'
SELECT Users.fullName
from Users, Roles, Groups
where Groups.name='users_dev' and users.idRole = Roles.id and Groups.id=Roles.idGroup;

--вывести 5 пользователей, отсрортированных по роли
SELECT Users.fullName, Roles.name
from Users, Roles
where users.idRole = Roles.id
ORDER BY Roles.name
LIMIT 5;

--вывести список ролей отсортированных по названию группы
SELECT Groups.NAME, Roles.NAME
from Roles, Groups
WHERE Groups.id=Roles.idGroup
ORDER by Groups.NAME

--вывести юзеров, у которых в логине присутствует комбинация man1
SELECT Users.fullName
From Users
WHERE Users.login like '%man1%'


--вывести 5 юзеров отсортированных по группк
select Users.fullName, Groups.name
from Users, Roles, Groups
Where Users.idRole=Roles.id and roles.idGroup=Groups.id
ORDER by Groups.name
LIMIT 5;

CREATE DATABASE Orders;

CREATE table Sales (
    id serial PRIMARY KEY,
    dateSale date DEFAULT now(), 
    idProduct INTEGER REFERENCES Product(id),
    countProduct INTEGER DEFAULT 1 CHECK (countProduct>=-1),
    sumProduct money DEFAULT(money(0)) CHECK (sumProduct>=money(0)) not null
);

CREATE table Product (
    id serial PRIMARY KEY,
    name VARCHAR (100),
    price money CHECK (price>=money(0)) not null
)

INSERT into Product (name, price) VALUES
('bread',20), ('beer', 22), ('milk', 15), ('spread', 12),
('meet', 120), ('lemonade', 8), ('water', 6), ('choko', 35);

INSERT into Sales (dateSale, idProduct, countProduct) VALUES 
('01.02.2023', 1, 3),
('06.02.2023', 4, 2),
('08.02.2023', 2, 3),
('12.02.2023', 3, 1),
('16.02.2023', 5, 3),
('24.02.2023', 4, 1),
('28.02.2023', 8, 3),
('01.03.2023', 6, 5),
('11.03.2023', 3, 2),
('15.03.2023', 5, 1),
(now (), 8,1),
(now (), 5,2),
(now (), 3,2),
(now (), 1,5),
(now (), 2,3);

SELECT *
from Sales

update Sales 
set sumProduct =  Sales.countProduct* Product.price
from Product
Where Sales.idProduct = Product.id 

-- для конкретной покупки 

update Sales 
set sumProduct =  money (0)
where Sales.id = 2; 

update Sales 
set sumProduct =  Sales.countProduct* Product.price
from Product
Where Sales.idProduct = Product.id and Sales.id=2;


CREATE DATABASE Practice;