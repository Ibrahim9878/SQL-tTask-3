--TASK1
--CREATE DATABASE TEACHERS

--USE TEACHERS

GO

CREATE TABLE Posts
(
Id int PRIMARY KEY,
[PName] nvarchar(20) NOT NULL,
CONSTRAINT UQ_PId UNIQUE(Id),
)

GO

CREATE TABLE Teacher
(
Id int PRIMARY KEY,
[TName] nvarchar(20) ,
Code char(10) ,
IdPost int,
Tel char(7) ,
Salary int,
Rise numeric(6,2) ,
HireDate datetime DEFAULT(SYSDATETIME()),
CONSTRAINT UQ_TId UNIQUE(Id),
CONSTRAINT FK_TId FOREIGN KEY(IdPost) REFERENCES Posts(Id) 
											ON DELETE CASCADE
											ON UPDATE CASCADE,
CONSTRAINT UQ_IdPost UNIQUE(IdPost)
) 

DROP TABLE Teacher
--TASK2

ALTER TABLE Teacher
DROP CONSTRAINT FK_TId
DROP TABLE Posts

--TASK3
ALTER TABLE Teacher
DROP CONSTRAINT FK_TId
ALTER TABLE Teacher
DROP CONSTRAINT UQ_IdPost
ALTER TABLE Teacher
DROP COLUMN IdPost

--TASK4
ALTER TABLE Teacher
ADD CONSTRAINT CK_HireDate CHECK(YEAR(HireDate) > 1999 AND MONTH(HireDate) > 1 AND DAY(HireDate) > 1)

--TASK5

ALTER TABLE Teacher
ADD CONSTRAINT UQ_Code UNIQUE (Code)

--TASK6
ALTER TABLE Teacher
DROP COLUMN Salary
ALTER TABLE Teacher
ADD Salary numeric(6,2)

--TASK7
ALTER TABLE Teacher
ADD CONSTRAINT CK_Salary CHECK(Salary > 1000 AND Salary < 5000)

--TASK8
EXEC sp_rename 'Teacher.Tel', 'Phone', 'COLUMN'

--TASK9
ALTER TABLE Teacher
DROP COLUMN Phone
ALTER TABLE Teacher
ADD Phone char(11) 

--TASK10
CREATE TABLE Posts
(
Id int PRIMARY KEY IDENTITY(1, 1),
[PName] nvarchar(20) NOT NULL,
CONSTRAINT UQ_PId UNIQUE(Id),
)
DROP Table Posts

--TASK11
ALTER TABLE Posts
ADD CONSTRAINT CK_PName CHECK(PName = 'professor' OR PName = 'assistant professor' OR PName = 'teacher' OR PName = 'assistant' )

--TASK12
ALTER TABLE Teacher
ADD CONSTRAINT CK_TName CHECK(TName NOT LIKE '%[0-9]%')
--TASK13 
--VAR MELLIM YUXARIDA

--TASK14
--MELLIM BUDA VAR CREATE TABLEDA

--TASK15
INSERT INTO Posts (Id, PName)
VALUES (1, N'Professor')
INSERT INTO Posts (Id, PName)
VALUES (2, N'Docent')
INSERT INTO Posts (Id, PName)
VALUES (3, N'Teacher')
INSERT INTO Posts (Id, PName)
VALUES (4, N'Assistant')

SET ANSI_WARNINGS OFF;
INSERT INTO Teacher (Id, TName, Code, IdPost, Phone, Salary, Rise, HireDate)
VALUES (1, N'Sidorov ',' 0123456789 ', 1, NULL, 1070, 470, '01.09.1992')
INSERT INTO Teacher (Id, TName, Code, IdPost, Phone, Salary, Rise, HireDate)
VALUES (2, N'Ramishevsky ',' 4567890123 ', 2,' 4567890 ', 1110, 370, '09.09.1998')
INSERT INTO Teacher (Id, TName, Code, IdPost, Phone, Salary, Rise, HireDate)
VALUES (3, N'Horenko ',' 1234567890 ', 3, NULL, 2000, 230, '10.10.2001')
INSERT INTO Teacher (Id, TName, Code, IdPost, Phone, Salary, Rise, HireDate)
VALUES (4, N'Vibrovsky ',' 2345678901 ', 4, NULL, 4000, 170, '01.09.2003')
INSERT INTO Teacher (Id, TName, Code, IdPost, Phone, Salary, Rise, HireDate)
VALUES (5, N'Voropaev ', NULL, 4, NULL, 1500, 150, '02.09.2002')
INSERT INTO Teacher (Id, TName, Code, IdPost, Phone, Salary, Rise, HireDate)
VALUES (6, N'Kuzintsev ',' 5678901234 ', 3,' 4567890 ', 3000, 270, '01.01.1991')
SET ANSI_WARNINGS ON;