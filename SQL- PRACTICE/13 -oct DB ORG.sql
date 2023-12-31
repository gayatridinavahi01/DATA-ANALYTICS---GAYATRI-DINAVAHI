CREATE DATABASE ORG;
DROP DATABASE ORG ;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
DROP TABLE WORKER ;
select * from worker ;

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '21-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '21-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '21-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '21-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '21-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '21-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '21-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '21-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

select * from Bonus ;
DROP TABLE BONUS ;

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '23-02-20'),
		(002, 3000, '23-06-11'),
		(003, 4000, '23-02-20'),
		(001, 4500, '23-02-20'),
		(002, 3500, '23-06-11');
        
        
        
        
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        on delete cascade
);
 drop table title ;
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2023-02-20 00:00:00'),
 (002, 'Executive', '2023-06-11 00:00:00'),
 (008, 'Executive', '2023-06-11 00:00:00'),
 (005, 'Manager', '2023-06-11 00:00:00'),
 (004, 'Asst. Manager', '2023-06-11 00:00:00'),
 (007, 'Executive', '2023-06-11 00:00:00'),
 (006, 'Lead', '2023-06-11 00:00:00'),
 (003, 'Lead', '2023-06-11 00:00:00');
 
--  1) write a query for TO FIND THE POSITION OF 'a' IN A NAME ;

SELECT * FROM WORKER ;
SELECT POSITION('A' IN  FIRST_NAME)  AS POSITION_A FROM WORKER WHERE FIRST_NAME = 'MONIKA' ;
 SELECT LOCATE('A' , FIRST_NAME) FROM WORKER  WHERE FIRST_NAME = 'MONIKA' ;
 SELECT INSTR( FIRST_NAME , "A") FROM WORKER  WHERE FIRST_NAME = 'MONIKA' ;

-- 2) write a query to  remove the space in a group of words 
select * from worker ;

SELECT rTRIM('                 GAYATRI             DINAVAHI      ');
SELECT LTRIM('                 GAYATRI             DINAVAHI      ');


-- 3) WRITE A QUERY TO REPLACE A LETTER WITH ANOTHER IN A WORD
select replace(first_name , 'a' , 'i' ) from worker where first_name like 'Monika' ;
select replace ('GAYATRI', 'A','U') ;

-- 4) WRITE A QUERY TO  FIND NAME WHOSE NAME HAS 'A' AND SALARY < 80000;
SELECT FIRST_NAME , LAST_NAME, SALARY FROM WORKER  
WHERE FIRST_NAME  LIKE '%A%' AND SALARY < 80000;

-- 5)  WRITE A QUERY TO DISPLAY FIRST HALF ROWS ;
SELECT COUNT(*) FROM WORKER ;    

SELECT * FROM WORKER WHERE COUNT(*)/2 ;

SELECT * FROM WORKER WHERE (WORKER_ID) <= (SELECT COUNT(WORKER_ID) /2 FROM WORKER  ) ;

SELECT ( COUNT(WORKER_ID) ) / 2 FROM WORKER;
SELECT * FROM WORKER WHERE (SELECT COUNT(SALARY ) < 2 FROM WORKER ) ;

SELECT * , ROW_NUMBER() OVER (partition by  WORKER_ID) FROM WORKER
WHERE ROW_NUMBER() OVER (PARTITION BY WORKER_ID)<=  COUNT(*)/2 ;
SELECT COUNT(*)/2 FROM WORKER;

--  

