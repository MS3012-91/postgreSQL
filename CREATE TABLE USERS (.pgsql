CREATE TABLE USERS (
    ID_USER SERIAL PRIMARY KEY,
    LOGIN VARCHAR (50) UNIQUE NOT NULL
);

CREATE TABLE POSTS (
    ID_POST SERIAL PRIMARY KEY,
    ID_USER INTEGER REFERENCES USERS ON DELETE SET NULL ON UPDATE CASCADE,
    TITLE VARCHAR (300),
    BODY TEXT
);

CREATE TABLE MARK_POSTS (
ID_USER INTEGER REFERENCES USERS ON DELETE SET NULL ON UPDATE CASCADE,
ID_POST INTEGER REFERENCES POSTS ON DELETE SET NULL ON UPDATE CASCADE,
PRIMARY KEY (ID_USER, ID_POST)
);

INSERT INTO Users(login) VALUES
('alex7'), ('bob14'), ('ann'), ('alex111'),('johnn');

INSERT INTO POSTS(ID_USER, TITLE, BODY) VALUES
(1, 'post title from 1', 'some text'),
(1, 'post title from 1', 'some text'),
(2, 'post title from 2', 'some text'),
(3, 'post title from 3', 'some text'),
(3, 'post title from 3', 'some text'),
(3, 'post title from 3', 'some text'),
(2, 'post title from 2', 'some text'),
(5, 'post title from 5', 'some text');

INSERT INTO MARK_POSTS VALUES
(1,2), (1,3), (1,6), (1,7), (1,8),
(2,1), (2,4), (2,5),
(4,1), (4,2), (4,3), (4,4), (4,5), (4,6), (4,7), (4,8),
(5,1), (5,4), (5,7), (5,8), (1,4);

/* 1. полная информация о конкретном посте
2. количество лайков для каждого поста
3. количество лайков для определенного поста
4. информация о посте + количество лайков
5. список постов которые лайкнули более 2 раз
6. сколько постов написал каждый юзер
7. сколько постов написал конкретный юзер
8. какой пост был самым популярным */

SELECT P.TITLE, U.LOGIN 
FROM POSTS AS P
JOIN USERS AS U USING (ID_USER)
GROUP BY U.LOGIN, P.TITLE;

SELECT P.TITLE, COUNT(MP.ID_USER) 
FROM POSTS AS P
JOIN MARK_POSTS AS MP USING (ID_POST)
GROUP BY P.TITLE
ORDER BY P.TITLE
;

SELECT P.TITLE, COUNT(MP.ID_USER) 
FROM POSTS AS P
JOIN MARK_POSTS AS MP USING (ID_POST)
WHERE P.ID_POST = 1
GROUP BY P.TITLE
ORDER BY P.TITLE
;

SELECT P.TITLE, MP.ID_POST, COUNT(MP.ID_USER) 
FROM MARK_POSTS AS MP
JOIN POSTS AS P USING (ID_POST)
GROUP BY P.TITLE, MP.ID_POST
HAVING MP.ID_POST = 1
ORDER BY P.TITLE
;

SELECT P.TITLE, U.LOGIN, COUNT(MP.ID_USER) 
FROM POSTS AS P
JOIN MARK_POSTS AS MP USING (ID_POST)
JOIN USERS AS U USING (ID_USER)
WHERE P.ID_POST = 1
GROUP BY P.TITLE, U.LOGIN
ORDER BY P.TITLE
;



SELECT ID_POST, COUNT(ID_USER) 
FROM MARK_POSTS
GROUP BY ID_POST
HAVING COUNT(ID_USER) >3
;

--6. сколько постов написал каждый юзер
SELECT U.LOGIN, COUNT (P.ID_POST)
FROM USERS AS U 
JOIN POSTS AS P USING (ID_USER)
GROUP BY U.LOGIN;

--сколько постов написал конкретный юзер
SELECT U.LOGIN, COUNT (P.ID_POST)
FROM USERS AS U 
JOIN POSTS AS P USING (ID_USER)
GROUP BY U.LOGIN
HAVING U.LOGIN = 'bob14';

--какой пост был самым популярным 
SELECT P.TITLE, COUNT (MP.ID_USER)
FROM POSTS AS P 
JOIN MARK_POSTS AS MP USING (ID_POST)
GROUP BY P.TITLE
ORDER BY COUNT (MP.ID_USER) DESC
LIMIT 1
;
