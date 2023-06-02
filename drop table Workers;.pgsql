drop table Workers;

CREATE DATABASE studs;

CREATE TABLE Stud(
    id serial,
    firstName varchar(250),
    lastName varchar(250),
    birthday date,
    address varchar(300),
    isMale boolean,
    yearOfStudy SMALLINT
);

INSERT into stud VALUES 
('Tom', 'Adson', '01.01.2020', 'ZP', true, 2),
('Alice', 'Adson', '01.06.2020', 'ZP', false, 2),
('Tom', 'Adson', '01.05.2020', 'ZP', true, 2),
('Tom', 'Adson', '01.12.2020', 'ZP', true, 2),
('Tom', 'Adson', '01.01.2001', 'ZP', true, 2);

SELECT *
FROM stud;

SELECT *
FROM stud
limit 3;

SELECT *
from stud
order by yearOfStudy ASC;

SELECT *
from stud
order by yearOfStudy DESC;

SELECT firstName, lastName, yearOfStudy
FROM stud
order by yearOfStudy DESC
LIMIT 5;

CREATE TABLE Workers (
    id serial,
    имя varchar (20),
    фамилия varchar (20),
    отчество varchar (20),
    должность varchar (20),
    зарплата money,
    дата_найма date,
    телефон varchar (20),
    адрес varchar (20),
    почта varchar (20)
);

INSERT into Workers (имя, фамилия, отчество, должность, зарплата, дата_найма, телефон, адрес, почта) VALUES 
 ('Степан', 'Шевченко', 'Андреевич', 'директор', 20000, '20/05/2020', '+380258693142', 'Киев', '123@google.com'),
 ('Анжелла', 'Петрова', 'Константиновна', 'менеджер', 15000, '05/06/2021', '+380854369724', 'Киев','456@google.com'),
 ('Павел', 'Чернобров', 'Васильевич', 'рабочий', 10000, '24/08/2019', '+380123456789', 'Харьков','856@google.com');

SELECT * from Workers ORDER by зарплата DESC;

SELECT * from Workers ORDER by дата_найма ASC;

SELECT * from Workers ORDER by дата_найма DESC limit 3;

DELETE from Workers
where id=2;

SELECT *
from workers;

SELECT имя, фамилия, отчество, должность
from workers
where id=3;

SELECT *
from Workers
where зарплата >= money (15000);

SELECT *
from Workers
where дата_найма >= '01/01/2019';


SELECT имя, фамилия, отчество, должность
from workers
LIMIT 3 OFFSET 3;

drop table Workers;

CREATE DATABASE studs;

CREATE TABLE Stud(
    id serial,
    firstName varchar(250),
    lastName varchar(250),
    birthday date,
    address varchar(300),
    isMale boolean,
    yearOfStudy SMALLINT
);

INSERT into stud VALUES 
('Tom', 'Adson', '01.01.2020', 'ZP', true, 2),
('Alice', 'Adson', '01.06.2020', 'ZP', false, 2),
('Tom', 'Adson', '01.05.2020', 'ZP', true, 2),
('Tom', 'Adson', '01.12.2020', 'ZP', true, 2),
('Tom', 'Adson', '01.01.2001', 'ZP', true, 2);

SELECT *
FROM stud;

SELECT *
FROM stud
limit 3;

SELECT *
from stud
order by yearOfStudy ASC;

SELECT *
from stud
order by yearOfStudy DESC;

SELECT firstName, lastName, yearOfStudy
FROM stud
order by yearOfStudy DESC
LIMIT 5;

CREATE TABLE Workers (
    id serial,
    имя varchar (20),
    фамилия varchar (20),
    отчество varchar (20),
    должность varchar (20),
    зарплата money,
    дата_найма date,
    телефон varchar (20),
    адрес varchar (20),
    почта varchar (20)
);

INSERT into Workers (имя, фамилия, отчество, должность, зарплата, дата_найма, телефон, адрес, почта) VALUES 
 ('Степан', 'Шевченко', 'Андреевич', 'директор', 20000, '20/05/2020', '+380258693142', 'Киев', '123@google.com'),
 ('Анжелла', 'Петрова', 'Константиновна', 'менеджер', 15000, '05/06/2021', '+380854369724', 'Киев','456@google.com'),
 ('Павел', 'Чернобров', 'Васильевич', 'рабочий', 10000, '24/08/2019', '+380123456789', 'Харьков','856@google.com');

SELECT * from Workers ORDER by зарплата DESC;

SELECT * from Workers ORDER by дата_найма ASC;

SELECT * from Workers ORDER by дата_найма DESC limit 3;

DELETE from Workers
where id=2;

SELECT *
from workers;

SELECT имя, фамилия, отчество, должность
from workers
where id=3;

SELECT *
from Workers
where зарплата >= money (15000);

SELECT *
from Workers
where дата_найма >= '01/01/2019';


SELECT имя, фамилия, отчество, должность
from workers
LIMIT 3 OFFSET 3;

