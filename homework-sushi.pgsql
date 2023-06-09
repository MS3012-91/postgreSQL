-- Спроектировать базу данных (пострис) и разработать схему 
данных для приложения доставки суши.

-- Предусмотрите название блюда с описанием состава, 
его вес и цену. Начисление скидки 2% при заказе клиента от 1000 грн.

-- Ваше приложение получает 3% от суммы заказа.


CREATE TABLE INGREDIENTS (
    ID SERIAL PRIMARY KEY,
    INGREDIENT_NAME VARCHAR (100) NOT NULL
);

INSERT INTO INGREDIENTS (INGREDIENT_NAME)VALUES 
('INGREDIENT1'),
('INGREDIENT2'),
('INGREDIENT3'),
('INGREDIENT4'),
('INGREDIENT5'),
('INGREDIENT6'),
('INGREDIENT7'),
('INGREDIENT8'),
('INGREDIENT9'),
('INGREDIENT10');

CREATE TABLE DISHES (
    ID SERIAL PRIMARY KEY,
    DISHES_NAME VARCHAR (100) UNIQUE,
    PRICE MONEY CONSTRAINT CORRECT_PRICE CHECK (PRICE>MONEY(0)) NOT NULL
);

INSERT INTO DISHES (DISHES_NAME, PRICE) VALUES
('DISHE1', 200),
('DISHE2', 250),
('DISHE3', 230);

CREATE TABLE INGREDIENTS_INTO_DISHES (
    ID_DISHE INTEGER REFERENCES DISHES ON UPDATE CASCADE ON DELETE SET NULL,
    ID_INGREDIENTS INTEGER REFERENCES INGREDIENTS ON UPDATE CASCADE ON DELETE SET NULL
)

INSERT INTO INGREDIENTS_INTO_DISHES (ID_DISHE, ID_INGREDIENTS) VALUES
(1,2), (1,5), (1,8), (1,10),
(2,1), (2,3), (2,4), (2,8),
(3,2), (3,6), (3,9), (3,10);

CREATE TABLE DISHES_CONTAINER (
    ID_CONTAINER SERIAL PRIMARY KEY,
    ID_DISHES INTEGER REFERENCES DISHES CONSTRAINT ID_DISHES CHECK (ID_DISHES>0) NOT NULL,
    COUNT INTEGER CONSTRAINT COUT_OF_DISHES CHECK (COUNT > 0) NOT NULL,
    SUM MONEY CONSTRAINT SUM_MONEY_CONTAINER CHECK (SUM > MONEY (0))
);

INSERT INTO DISHES_CONTAINER (ID_DISHES, COUNT) VALUES
(1,3),(3,2),
(2,5), (3, 6),
(1,4), (2,3),
(1, 5), (2,1);

UPDATE DISHES_CONTAINER SET
SUM= (
    SELECT SUM (COUNT*DISHES.PRICE)
    FROM DISHES
    WHERE DISHES.ID=DISHES_CONTAINER.ID_DISHES
);

SELECT * FROM  DISHES_CONTAINER;

CREATE TABLE CLIENTS (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR (50),
    TEL VARCHAR (20)
);

INSERT INTO CLIENTS (NAME, TEL) VALUES 
('CLIENT1', '+380123585243'),
('CLIENT2', '+380123589464'),
('CLIENT3', '+380369852147');

CREATE TABLE ORDERS_TO_DISHES_CONTAINER (
    ID_ORDER INTEGER REFERENCES ORDERS ON UPDATE CASCADE ON DELETE SET NULL, 
    ID_DISHES_CONTAINER INTEGER REFERENCES DISHES_CONTAINER ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO ORDERS_TO_DISHES_CONTAINER (ID_ORDER, ID_DISHES_CONTAINER) VALUES
(1,1), (1,2),
(2,3), (2,4), (2,5),
(3,6), (3,7), (3,8);

SELECT * FROM ORDERS_TO_DISHES_CONTAINER;

CREATE TABLE ORDERS (
    ID_ORDER SERIAL PRIMARY KEY,
    ID_CLIENT INTEGER CONSTRAINT ID_CLIENT CHECK (ID_CLIENT > 0) NOT NULL,
    TOTAL_SUM MONEY CONSTRAINT TOTAL_SUM CHECK (TOTAL_SUM>MONEY(0)),
    DATE DATE NOT NULL DEFAULT NOW (),
    HAVE_A_SALE BOOLEAN DEFAULT FALSE,
    SALE NUMERIC (4,2) DEFAULT 02.00,
);

INSERT INTO ORDERS (ID_CLIENT) VALUES 
(1), (2), (3);

ALTER TABLE ORDERS ADD BONUS NUMERIC (4,2) DEFAULT (03.00);

ALTER TABLE ORDERS ADD TOTAL_BONUS MONEY CONSTRAINT TOTAL_BONUS CHECK (TOTAL_BONUS>money(0));


UPDATE ORDERS SET TOTAL_BONUS = (
    SELECT TOTAL_SUM*BONUS/100
);

UPDATE ORDERS SET TOTAL_SUM = (
    SELECT SUM (DISHES_CONTAINER.SUM)
    FROM DISHES_CONTAINER
    JOIN ORDERS_TO_DISHES_CONTAINER ON ORDERS_TO_DISHES_CONTAINER.ID_DISHES_CONTAINER=DISHES_CONTAINER.ID_CONTAINER 
    WHERE ORDERS.ID_ORDER=ORDERS_TO_DISHES_CONTAINER.ID_ORDER
);

UPDATE ORDERS SET HAVE_A_SALE = TRUE 
    WHERE TOTAL_SUM  > MONEY (1000);

UPDATE ORDERS SET TOTAL_SUM = TOTAL_SUM-(SALE/100*TOTAL_SUM)
    WHERE HAVE_A_SALE = TRUE ;

-- состав и стоимость (определенного) заказа

CREATE VIEW SALES AS 
SELECT O.ID_ORDER, O.DATE, D.DISHES_NAME, DC.COUNT, DC.SUM, O.SALE, O.HAVE_A_SALE, O.TOTAL_SUM
    FROM DISHES AS D
    JOIN DISHES_CONTAINER AS DC ON D.ID=DC.ID_DISHES
    JOIN ORDERS_TO_DISHES_CONTAINER AS ODC 
        ON ODC.ID_DISHES_CONTAINER=DC.ID_CONTAINER
    JOIN ORDERS AS O ON O.ID_ORDER=ODC.ID_ORDER;

SELECT * FROM SALES WHERE ID_ORDER = 1;

--перечень заказов на сегодня

SELECT * FROM SALES WHERE DATE = '2023-06-23';

--перечень заказов за неделю

SELECT * FROM SALES WHERE DATE BETWEEN '2023-06-23' AND '2023-06-30';

--выручку за день

SELECT SUM (TOTAL_SUM) FROM ORDERS WHERE DATE = '2023-06-23';

--выручку за месяц (сумма всех заказов за месяц)
SELECT SUM (TOTAL_SUM) FROM ORDERS 
WHERE DATE 
BETWEEN '2023-06-01' AND '2023-06-30';

--список клиентов, которые обслуживались в этом месяце
SELECT C.NAME, C.tel
FROM CLIENTS AS C
JOIN ORDERS AS O ON O.ID_CLIENT=C.ID
WHERE O.DATE BETWEEN '2023-06-01' AND '2023-06-30';

--топ 5 блюд за месяц
SELECT Dishes_name, SUM(COUNT) 
FROM SALES
GROUP BY Dishes_name
ORDER BY sum DESC
LIMIT 5;


--Ваш доход от продаж за месяц
SELECT SUM (TOTAL_BONUS)
FROM ORDERS 
WHERE DATE BETWEEN '2023-06-01' AND '2023-06-30';

