CREATE table Roles (
    id serial PRIMARY key,
    name VARCHAR (50) NOT
     NULL UNIQUE,
    description VARCHAR (300),
    idGroup serial
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
    idRole serial REFERENCES Roles (id)
);

DROP TABLE users CASCADE;
DROP TABLE Roles CASCADE;
Drop TABLE Groups CASCADE;


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


CREATE TABLE weather (
    city            varchar(80),
    temp_lo         int,           
    temp_hi         int,           
    prcp            real,          
    date            date
);

CREATE TABLE cities (
    name            varchar(80),
    location        point
);

INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
    VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');
INSERT INTO weather (date, city, temp_hi, temp_lo)
    VALUES ('1994-11-29', 'Hayward', 54, 37);

    SELECT * FROM weather
    ORDER BY city;

    SELECT * from cities;


    SELECT *
    FROM weather LEFT OUTER JOIN cities ON weather.city = cities.name;

    SELECT * 
    from weather join cities ON weather.city = cities.name;