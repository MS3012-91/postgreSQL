CREATE DATABASE SALES;

CREATE TABLE PRODUCT (
    ID_PRODUCT SERIAL PRIMARY KEY,
    NAME VARCHAR (50) NOT NULL,
    PRICE MONEY NOT NULL CONSTRAINT POSITIVE_CHECK CHECK (PRICE> MONEY(0))
);

CREATE TABLE PAYCHECK (
    ID_SALE INTEGER PRIMARY KEY,
    ID_PRODUCT INTEGER REFERENCES PRODUCT (ID_PRODUCT) ON DELETE SET NULL ON UPDATE CASCADE,
    COUNT_PRODUCT INTEGER CHECK (COUNT_PRODUCT > 0)
);

CREATE TABLE SALE (
    ID_SALE INTEGER REFERENCES PAYCHECK(ID_SALE) ON DELETE SET NULL ON UPDATE CASCADE,
    DATE DATE DEFAULT NOW (),
    SUM_SALE MONEY CONSTRAINT POSITIVE_CHECH CHECK (SUM_SALE>=MONEY (0))
);


DROP TABLE PAYCHECK;
DROP TABLE SALE;
DROP TABLE PRODUCT;


INSERT  INTO PRODUCT (NAME,PRICE) VALUES
('LAPTOP HP2000', 30000), 
('LAPTOP SAMSUNG120Q-A', 25000), 
('LAPTOP ASUS12-QW', 32000), 
('PHONE IPHONE 12', 25000),
('PHONE IPHONE X', 18000),
('PHONE IPHONE 12 PRO MAX', 28000),
('PHONE SAMSUNG123', 8000),
('PHONE SAMSUNG13', 12000),
('PHONE HUAWEI5', 9000),
('PHONE HUAWEI6', 11000),
('PHONE HUAWEI6 BLUE', 11500);

INSERT INTO SALE (ID_SALE, DATE) VALUES
(1, '2023-06-01'), (2, '2023-06-01'), (3, '2023-06-01'),
(4, '2023-06-02'), (5, '2023-06-02'), (6, '2023-06-02'), (7, '2023-06-02'),
(8, '2023-06-03'), (9, '2023-06-03'),
(10, '2023-06-04'), (11, '2023-06-04'), (12, '2023-06-04'),(13, '2023-06-04'), (14, '2023-06-04'),
(15, '2023-06-05'), (16, '2023-06-05'), (17, '2023-06-05'),
(18, '2023-06-06');

INSERT INTO SALE (SUM_SALE) 
SELECT  SUM (PAYCHECK.COUNT_PRODUCT*PRODUCT.PRICE)
    FROM PAYCHECK, PRODUCT
    WHERE PAYCHECK.ID_SALE = ID_SALE AND paycheck.ID_PRODUCT = PRODUCT.ID_PRODUCT;

INSERT INTO SALE (SUM_SALE) 
(SELECT COUNT_PRODUCT FROM PAYCHECK WHERE id_sale


 SUM (PAYCHECK.COUNT_PRODUCT*PRODUCT.PRICE)
    FROM PAYCHECK 
    JOIN PRODUCT ON PAYCHECK.ID_PRODUCT = PRODUCT.ID_PRODUCT
    WHERE PAYCHECK.ID_SALE = SALE.ID_SALE) 

INSERT INTO PAYCHECK (ID_SALE, ID_PRODUCT, COUNT_PRODUCT) VALUES 
(1,1,1),
(2, 10, 2),
(3, 2, 4 ), 
(4,8,2 ),
(5, 9, 1), 
(7,8,2 ),
(8, 10,1), (6, 3,2), 
(9, 1,3 ),
(10,1,4), (11,4,1), 
(12, 10, 2), 
(13, 8, 3 ), 
(14,6 , 5 ),
(15, 8, 4), 
(16,5,3),
(17,9,1  ), 
(18, 3,1);


--2) вывести информацию о покупке : состав ее и сумму к оплате


SELECT S.ID_SALE, P.NAME, P.PRICE, PC.COUNT_PRODUCT, (PC.COUNT_PRODUCT*P.PRICE) AS SUM_SALE
FROM SALE AS S
JOIN PAYCHECK AS PC ON S.ID_SALE =PC.ID_SALE
JOIN PRODUCT AS P ON PC.ID_PRODUCT = P.ID_PRODUCT
GROUP BY S.ID_SALE, PC.ID_SALE, P.NAME, P.PRICE, PC.COUNT_PRODUCT, S.SUM_SALE
ORDER BY ID_SALE;

--3) вывести список товаров используя like
SELECT * FROM PRODUCT
WHERE product.NAME LIKE '%PHONE%'

--4) вывести товары до 10000грн 
SELECT * FROM PRODUCT
WHERE product.PRICE < MONEY (10000)

--5) подсчитать количество продаж за день (период 5 дней)
SELECT DATE, COUNT (*) FROM SALE
WHERE DATE BETWEEN '2023-06-01' AND '2023-06-05'
GROUP BY DATE
ORDER BY DATE;

--6) подсчитать сумму продаж за сегодня
SELECT SUM (PC.COUNT_PRODUCT*P.PRICE) AS SUM_SALE_2023_06_03
FROM SALE AS S
JOIN PAYCHECK AS PC ON S.ID_SALE =PC.ID_SALE
JOIN PRODUCT AS P ON PC.ID_PRODUCT = P.ID_PRODUCT
WHERE DATE = '2023-06-03';


--7) подсчитать количество продаж за сегодня 
SELECT COUNT (*) FROM SALE
WHERE DATE = '2023-06-03';

CREATE DATABASE PRACTICE_17_06;


SELECT * FROM pg_timezone_names;

ALTER DATABASE practice_17_06
SET TIMEZONE TO 'Europe/Warsaw';

show timezone;

SELECT CURRENT_TIMESTAMP;