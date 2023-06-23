CREATE TYPE product_type AS ENUM ('pizza', 'additive');

CREATE TABLE PRODUCTS (
    ID SERIAL PRIMARY KEY,
    TYPE product_type NOT NULL,
    NAME VARCHAR (60) NOT NULL,
    DESCRIPTION VARCHAR (300)
);

CREATE TABLE MANUFACTURERS (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR (100) NOT NULL, 
    GAIN NUMERIC (3,2) NOT NULL CHECK (GAIN <=100 AND GAIN >=0)
);

CREATE TABLE CLIENTS (
    ID SERIAL PRIMARY KEY,
    TEL VARCHAR (20),
    EMAIL VARCHAR (60),
    NAME VARCHAR (60),
    CARD VARCHAR (60),
    DISCOUNT INTEGER CHECK (DISCOUNT<=100 AND DISCOUNT >=0)
);

CREATE TABLE ORDERS (
    ID SERIAL PRIMARY KEY,
    ID_MANUFACTURER INTEGER REFERENCES MANUFACTURERS ON DELETE SET NULL ON UPDATE CASCADE,
    ID_CLIENT INTEGER REFERENCES CLIENTS ON DELETE SET NULL ON UPDATE CASCADE,
    TOTAL_SUM MONEY CHECK (TOTAL_SUM>=MONEY(0)) DEFAULT 0,
    DATE DATE DEFAULT NOW()
);

CREATE TABLE PRODUCTS_TO_OREDER (
    ID_ORDER INTEGER REFERENCES ORDERS ON DELETE SET NULL ON UPDATE CASCADE,
    ID_PRODUCT INTEGER REFERENCES PRODUCTS ON DELETE SET NULL ON UPDATE CASCADE,
    COUNT INTEGER DEFAULT 1 CHECK (COUNT>0) NOT NULL
);



CREATE TABLE PRODUCTS_TO_MANUFACTURERS (
    ID_PRODUCT INTEGER REFERENCES PRODUCTS ON DELETE SET NULL ON UPDATE CASCADE,
    ID_MANUFACTURER INTEGER REFERENCES MANUFACTURERS ON DELETE SET NULL ON UPDATE CASCADE,
    WEIGHT NUMERIC (5,1) NOT NULL CHECK (WEIGHT>0),
    PRICE MONEY CHECK (PRICE>MONEY (0)) NOT NULL
);

DROP TABLE PRODUCTS_TO_MANUFACTURERS;

INSERT INTO PRODUCTS (TYPE,NAME, DESCRIPTION) VALUES 
('pizza', 'PIZZA NAME1', 'PIZZA DESCR'),
('pizza', 'PIZZA NAME2', 'PIZZA DESCR'),
('pizza', 'PIZZA NAME3', 'PIZZA DESCR'),
('pizza', 'PIZZA NAME4', 'PIZZA DESCR'),
('pizza', 'PIZZA NAME5', 'PIZZA DESCR'),
('pizza', 'PIZZA NAME6', 'PIZZA DESCR'),
('additive', 'ADDITIVE NAME1', 'ADDITIVE DESCR'),
('additive', 'ADDITIVE NAME2', 'ADDITIVE DESCR'),
('additive', 'ADDITIVE NAME3', 'ADDITIVE DESCR'),
('additive', 'ADDITIVE NAME4', 'ADDITIVE DESCR'),
('additive', 'ADDITIVE NAME5', 'ADDITIVE DESCR');

SELECT * FROM PRODUCTS;

INSERT INTO MANUFACTURERS (NAME, GAIN) VALUES
('PIZZERIA1', 3),
('PIZZERIA2', 5),
('PIZZERIA3', 8),
('PIZZERIA4', 7),
('PIZZERIA5', 6);

SELECT * FROM MANUFACTURERS;

INSERT INTO CLIENTS (NAME, TEL) VALUES
('CLIENT1', '0123456789'),
('CLIENT2', '1987456123'),
('CLIENT3', '0258963147'),
('CLIENT4', '0963258741'),
('CLIENT5', '0582147936'),
('CLIENT6', '0357894136');

SELECT * FROM CLIENTS;

INSERT INTO ORDERS (ID_MANUFACTURER, ID_CLIENT) VALUES
(11,13), (11,16), (11,18), 
(12,14), (12,17),
(13,16), (13,13),
(14,18), (14,14),
(15, 17), (15,15);

INSERT INTO ORDERS (ID_MANUFACTURER, ID_CLIENT, DATE) VALUES
(15,14,'2023-01-01');

INSERT INTO ORDERS (ID_MANUFACTURER, ID_CLIENT, DATE) VALUES
(15,14,'2023-01-01' AT TIME ZONE 'Europe/Warsaw') ;



SELECT * FROM ORDERS;

INSERT INTO PRODUCTS_TO_OREDER (id_order, id_product, count) VALUES
(36,(SELECT ID FROM Products WHERE name='PIZZA NAME1'),2), 
(36,(SELECT ID FROM Products WHERE name='ADDITIVE NAME1'),2),
(37,(SELECT ID FROM Products WHERE name='PIZZA NAME3'),1), 
(37,(SELECT ID FROM Products WHERE name='ADDITIVE NAME3'),4),
(38,(SELECT ID FROM Products WHERE name='PIZZA NAME1'),5),
(39,(SELECT ID FROM Products WHERE name='PIZZA NAME2'),2),
(40, (SELECT ID FROM Products WHERE name='PIZZA NAME4'),3),
(40, (SELECT id FROM Products WHERE name='ADDITIVE NAME3'),1),
(40, (SELECT id FROM Products WHERE name='ADDITIVE NAME2'),2),
(41, (SELECT id FROM Products WHERE name='PIZZA NAME6'),2),
(41, (SELECT id FROM Products WHERE name='PIZZA NAME1'),3),
(42, (SELECT id FROM Products WHERE name='PIZZA NAME5'),1),
(43, (SELECT id FROM Products WHERE name='PIZZA NAME4'),1),
(43, (SELECT id FROM Products WHERE name='PIZZA NAME6'),4),
(44, (SELECT id FROM Products WHERE name='PIZZA NAME2'),3),
(45, (SELECT id FROM Products WHERE name='PIZZA NAME1'),2),
(45, (SELECT id FROM Products WHERE name='PIZZA NAME2'),5),
(45, (SELECT id FROM Products WHERE name='ADDITIVE NAME5'),4),
(45, (SELECT id FROM Products WHERE name='ADDITIVE NAME3'),2),
(46, (SELECT id FROM Products WHERE name='PIZZA NAME1'),4),
(46, (SELECT id FROM Products WHERE name='ADDITIVE NAME2'),2),
(46, (SELECT id FROM Products WHERE name='ADDITIVE NAME1'),2);

INSERT INTO PRODUCTS_TO_OREDER (id_order, id_product, count) VALUES 
(47, (SELECT id FROM Products WHERE name='ADDITIVE NAME5'), 2),
(47, (SELECT id FROM Products WHERE name='ADDITIVE NAME3'), 3);

SELECT * FROM PRODUCTS_TO_OREDER;

INSERT INTO PRODUCTS_TO_MANUFACTURERS (id_product, id_manufacturer, weight, price) VALUES
(67,11, 800, 300),
(67,12, 750, 250),
(67,13, 1000, 400),
(67,14, 900, 360),
(67,15, 800, 320),
--pizza2
(68,11, 500, 200),
(68,12, 550, 250),
(68,13, 600, 300),
(68,14, 700, 400),
(68,15, 750, 420),
--pizza3
(69,11, 800, 300),
(69,12, 750, 250),
(69,13, 1000, 400),
(69,14, 900, 360),
(69,15, 850, 320),
----pizza4
(70,11, 800, 300),
(70,12, 750, 250),
(70,13, 1000, 400),
(70,14, 900, 360),
(70,15, 950, 340),
--pizza5
(71,11, 800, 300),
(71,12, 750, 250),
(71,13, 1000, 400),
(71,14, 900, 360),
(71,14, 950, 380),
--pizza6
(72,11, 800, 300),
(72,12, 750, 250),
(72,13, 1000, 400),
(72,14, 650, 300),
(72,15, 600, 320),
--additive1
(73,11, 100, 60),
(73,12, 150, 85),
(73,13, 80, 50),
(73,14, 120, 75),
(73,15, 100, 65),
--additive2
(74,11, 100, 60),
(74,12, 150, 85),
(74,13, 80, 50),
(74,14, 120, 75),
(74,15, 130, 80),
--additive3
(75,11, 100, 60),
(75,12, 150, 85),
(75,13, 80, 50),
(75,14, 120, 75),
(75,15, 110, 70),
--additive4
(76,11, 100, 60),
(76,12, 150, 85),
(76,13, 80, 50),
(76,14, 120, 75),
(76,15, 100, 50),

(77,11, 100, 60),
(77,12, 150, 85),
(77,13, 80, 50),
(77,14, 120, 75),
(77,15, 100, 50);

SELECT * FROM PRODUCTS_TO_MANUFACTURERS; 

SELECT * 
FROM Products
WHERE name LIKE 'PIZZA%';

SELECT * 
FROM Products
WHERE name LIKE 'ADDITIVE%';

SELECT O.id_manufacturer, O.id_client, O.total_sum, O.date
FROM Orders AS O;

SELECT M.name, C.name, C.tel, C.email, O.total_sum, O.date
FROM Orders AS O
JOIN Clients AS C ON C.id = O.id_client
JOIN Manufacturers AS M ON M.id = O.id_manufacturer;

SELECT M.name, C.name, C.tel, C.email, O.total_sum, O.date
FROM ORDERS AS O
JOIN CLIENTS AS C ON C.id = O.id_client
JOIN MANUFACTURERS AS M ON M.id = O.id_manufacturer
WHERE O.id = 36;

SELECT PO.id_order, PO.id_product, PO.count
FROM PRODUCTS_TO_OREDER AS PO
WHERE PO.id_order = 36;

SELECT P.type, P.name, PO.count
FROM PRODUCTS_TO_OREDER AS PO
JOIN Products AS P ON P.id = PO.id_product
WHERE PO.id_order = 36;


-- заказ клиента №1
SELECT O.ID, M.NAME AS "PIZZERIA", C.NAME AS "CLIENT", C.tel, O. total_sum, O.date
FROM ORDERS AS O 
JOIN manufacturers AS M ON M.ID=O.id_manufacturer
JOIN clients AS C ON C.ID=O.id_client
WHERE C.TEL = '0123456789' AND O.ID=36;

--инфа о заказе№3 пицерии№1 
SELECT O.ID, M.NAME AS "PIZZERIA", C.NAME AS "CLIENT", C.tel, O. total_sum, O.date
FROM ORDERS AS O 
JOIN manufacturers AS M ON M.ID=O.id_manufacturer
JOIN clients AS C ON C.ID=O.id_client
WHERE M.NAME='PIZZERIA3' ORDER BY O.DATE DESC
LIMIT 1;

----список заказов клиента №4
SELECT C.NAME, C,TEL, O.ID, O.DATE, O.id_manufacturer, PO.COUNT, P.NAME
FROM CLIENTS AS C
JOIN ORDERS AS O ON C.ID=O.id_client
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID=PO.id_product
WHERE C.NAME = 'CLIENT4'
;

--список заказов пицерии №3
SELECT C.NAME, C,TEL, O.ID AS "ORDER NUMBER", O.DATE AT TIME ZONE 'Europe/Warsaw', O.id_manufacturer, PO.COUNT, P.NAME
FROM CLIENTS AS C
JOIN ORDERS AS O ON C.ID=O.id_client
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID=PO.id_product
WHERE O.id_manufacturer = 15;

--список заказов пицерии №3 на сегодня
SELECT C.NAME, C,TEL, O.ID AS "ORDER NUMBER", O.DATE, O.id_manufacturer, PO.COUNT, P.NAME, M.NAME
FROM CLIENTS AS C
JOIN ORDERS AS O ON C.ID=O.id_client
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID=PO.id_product
JOIN manufacturers AS M ON O.id_manufacturer=M.ID
WHERE O.DATE = '2023-06-17'  AT TIME ZONE  AND M.NAME = 'PIZZERIA4';


--список заказов пицерии №3 за неделю
SELECT C.NAME, C.TEL, O.ID AS "ORDER NUMBER", O.DATE, O.id_manufacturer, PO.COUNT, P.NAME, M.NAME
FROM CLIENTS AS C
JOIN ORDERS AS O ON C.ID=O.id_client
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID=PO.id_product
JOIN manufacturers AS M ON O.id_manufacturer=M.ID
WHERE EXTRACT (DAY FROM O.DATE) BETWEEN EXTRACT (DAY FROM NOW()) - 7 AND EXTRACT(DAY FROM now());


SELECT C.NAME, C.TEL, O.ID AS "ORDER NUMBER", O.DATE AT TIME ZONE 'Europe/Warsaw', O.id_manufacturer, PO.COUNT, P.NAME, M.NAME
FROM CLIENTS AS C
JOIN ORDERS AS O ON C.ID=O.id_client
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID=PO.id_product
JOIN manufacturers AS M ON O.id_manufacturer=M.ID
WHERE DATE BETWEEN DATE('2022-12-29') AND DATE('2023-05-01');

--количество заказов по каждому клиенту
SELECT C.NAME, COUNT(O.*)
FROM CLIENTS AS C
JOIN ORDERS AS O ON C.ID=O.id_client
WHERE C.ID= O.id_client
GROUP BY C.NAME;

SELECT C.name, C.tel, count(O.id)
FROM Orders AS O
JOIN Clients AS C ON C.id = O.id_client
GROUP BY C.name, C.tel
ORDER BY C.NAME;

--количество заказов по каждому клиенту за текущий месяц
SELECT C.name, C.tel, count(O.id), O.DATE
FROM Orders AS O
JOIN Clients AS C ON C.id = O.id_client
WHERE EXTRACT (MONTH FROM O.DATE) = EXTRACT (MONTH FROM NOW())
GROUP BY C.name, C.tel, O.DATE
ORDER BY C.NAME;


--количество заказов по каждой пицерии
SELECT M.name, count(O.id) as "orders"
FROM Orders AS O
JOIN Manufacturers AS M ON M.id = O.id_manufacturer
GROUP BY M.name
ORDER BY "orders" DESC, M.name;


----количество заказов по клиенту №4
SELECT C.NAME, COUNT (O.ID)
FROM ORDERS AS O
JOIN CLIENTS AS C ON O.id_client = C.ID
WHERE  C.ID = 14
GROUP BY C.NAME
ORDER BY C.NAME;

--количество заказов по клиенту №4 за текущий месяц
SELECT C.NAME, COUNT (O.ID)
FROM ORDERS AS O
JOIN CLIENTS AS C ON O.id_client = C.ID
WHERE  C.ID = 14 AND EXTRACT (MONTH FROM O.DATE) = EXTRACT (MONTH FROM NOW())
GROUP BY C.NAME
ORDER BY C.NAME;

--количество заказов по пицерии №3
SELECT M.NAME, COUNT (O.id_manufacturer)
FROM manufacturers AS M
JOIN ORDERS AS O ON O.id_manufacturer=M.ID
WHERE M.NAME = 'PIZZERIA5'
GROUP BY M.NAME;

--количество заказов по пицерии №3 за текущий месяц
SELECT M.NAME, COUNT (O.id_manufacturer)
FROM manufacturers AS M
JOIN ORDERS AS O ON O.id_manufacturer=M.ID
WHERE M.NAME = 'PIZZERIA1' AND EXTRACT (MONTH FROM O.DATE) = EXTRACT (MONTH FROM NOW())
GROUP BY M.NAME;


--в каких заказах заказывали пиццу №1
SELECT O.ID AS "ORDER NUMBER", O.DATE, O.id_manufacturer, PO.COUNT, P.NAME
FROM ORDERS AS O 
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID=PO.id_product
WHERE P.NAME LIKE '%PIZZA%' AND P.NAME LIKE '%1%';

--в каких заказах заказывали пиццу №1 за текущий месяц
SELECT O.ID AS "ORDER NUMBER", O.DATE, O.id_manufacturer, PO.COUNT, P.NAME
FROM ORDERS AS O 
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID=PO.id_product
WHERE P.NAME LIKE '%PIZZA%' AND P.NAME LIKE '%5%' AND 
EXTRACT (MONTH FROM DATE) = EXTRACT (MONTH FROM NOW());


--подсчитать общий вес заказа №1
SELECT O.ID, C.NAME, M.NAME, PO.COUNT, P.NAME, SUM (PM.WEIGHT * PO.COUNT)
FROM PRODUCTS_TO_MANUFACTURERS AS PM
JOIN ORDERS AS O ON O.id_manufacturer = PM.id_manufacturer
JOIN clients AS C ON O.id_client = C.ID
JOIN manufacturers AS M ON M.ID=O.id_manufacturer
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID= PO.id_product
WHERE O.ID=36 AND PM.id_product= PO.id_product
GROUP BY O.ID, C.NAME, M.NAME, PO.COUNT, P.NAME;

--подсчитать по каждому продукту промежуточную стоимость для заказа №1 (чек)
SELECT O.ID, C.NAME, M.NAME, PO.COUNT, P.NAME, SUM (PM.PRICE * PO.COUNT)
FROM PRODUCTS_TO_MANUFACTURERS AS PM
JOIN ORDERS AS O ON O.id_manufacturer = PM.id_manufacturer
JOIN clients AS C ON O.id_client = C.ID
JOIN manufacturers AS M ON M.ID=O.id_manufacturer
JOIN products_to_oreder AS PO ON PO.id_order = O.ID
JOIN PRODUCTS AS P ON P.ID= PO.id_product
WHERE O.ID=36 AND PM.id_product= PO.id_product
GROUP BY O.ID, C.NAME, M.NAME, PO.COUNT, P.NAME;

--подсчитать общую стоимость заказа №1 и обновить total_sum Orders
SELECT sum(PO.count * PM.price)
FROM Orders AS O
JOIN products_to_oreder AS PO ON O.id = PO.id_order
JOIN Products_to_Manufacturers AS PM ON O.id_manufacturer = PM.id_manufacturer AND
PM.id_product = PO.id_product
WHERE O.id = 36;

SELECT * FROM pg_timezone_names;

ALTER DATABASE practice_17_06
SET TIMEZONE TO 'PT2H';

show timezone;

SELECT CURRENT_TIMESTAMP;
SELECT CURRENT_DATE;



SELECT NOW()::date;
SELECT NOW()::timestamp; (correct / gmt+2)


select LOCALTIME;
select LOCALTIMESTAMP;

SELECT DATE(LOCALTIMESTAMP);

CREATE DATABASE hOMEWORK_SUCHI;



