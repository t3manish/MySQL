-- Source: https://www.geeksforgeeks.org/sql-tutorial/

-- creating a database
CREATE DATABASE GitHub_MYSQL;

-- DROP DATABASE database_name;
DROP DATABASE manish1tr;

-- Shows DBs
SHOW DATABASES;

-- ALTER DATABASE [current_database_name] MODIFY NAME = [new_database_name];
-- RENAME DATABASE [current_database_name] TO [new_database_name];

USE GitHub_MYSQL;
-- Why do we need to Select a Database?
-- ANS: We need to Select a Database to state SQL about the database we will be using for storing the data.

-- ----------------------------------------------------------------------------------------------------
-- Tables in SQL

/* CREATE table table_name
(
Column1 datatype (size),
column2 datatype (size),
.
.
columnN datatype(size)
); */

CREATE TABLE First_Table_1(
	Employee_ID INT PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    Department varchar(255),
    Salary DECIMAL(10,2)
);

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone int(10)
);

INSERT INTO Customer(CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Manish', 'Thota', 'India', '24','985762130'),
		(2, 'Jashu', 'Thota', 'India', '22','985863230'),
        (3, 'Roopa', 'Chukka', 'India', '18','905762680'),
        (4, 'Anu', 'Ch', 'India', '23','985882130'),
        (5, 'Aman ', 'Chopra', 'Australia','21','93687512'),
       (6, 'Naveen', 'Tulasi', 'Sri lanka','24','987456123'),
       (7, 'Aditya', 'Arpan', 'Austria','21','95872111');
       
-- Reads the table
SELECT * FROM Customer;

-- deletes the entire table 
DROP TABLE Customer;

-- Create Table From Another Table
/*CREATE TABLE new_table_name AS
    SELECT column1, column2,…
    FROM existing_table_name
    WHERE ….;
*/

CREATE TABLE Dupe AS 
SELECT CustomerID, CustomerName
FROM Customer;

/*DELETE FROM table_name
WHERE some_condition;*/
DELETE FROM Customer WHERE CustomerID = 5;

-- ALTER (RENAME) in SQL

/*ALTER TABLE table_name
RENAME TO new_table_name;*/

CREATE TABLE Student (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  email VARCHAR(50),
  phone VARCHAR(20)
);

INSERT INTO Student (id, name, age, email, phone) 
VALUES 
(1, 'Amit', 20, 'amit@gmail.com', '9999999999'),
(2, 'Rahul', 22, 'rahul@yahoo.com', '8888888888'),
(3, 'Priya', 21, 'priya@hotmail.com', '7777777777'),
(4, 'Sonia', 23, 'sonia@gmail.com', '6666666666'),
(5, 'Kiran', 19, 'kiran@yahoo.com', '5555555555');

-- ALTER TABLE Student RENAME COLUMN Column_NAME TO FIRST_NAME;
ALTER TABLE Student RENAME Column name TO FIRST_NAME;
-- Change the name of the table Student to Student_Details.
ALTER TABLE Student RENAME TO Student_Details;
SELECT * FROM Student_Details;

-- To Add a New Column with ALTER TABLE
/*ALTER TABLE table_name
ADD column_name datatype;*/
ALTER TABLE Student_Details ADD marks INT;



-- SQL DROP AND TRUNCATE Statement Examples
DROP TABLE Student_details;
CREATE TABLE Student_details (
ROLL_NO INT,
NAME VARCHAR(25),
ADDRESS VARCHAR(25),
PHONE INT(15) ,
AGE INT(2) ); 

-- Inserting the data in Student Table
INSERT INTO Student_details(ROLL_NO,NAME,ADDRESS,PHONE,AGE) 
VALUES  (1,'Ram','Delhi',941553635,24),
(2,'Ramesh','Gurgaon',941457635,21),
(3,'Sujit','Delhi',981553235,20),
(4,'Suresh','Noida',911553695,21),
(5,'Kajal','Gurgaon',891556735,28),
(6,'Garima','Rohtak',701555635,23);

TRUNCATE TABLE Student_details;
-- After running the above query Student_details table will be truncated, i.e, 
SELECT * FROM Student_details;
-- the data will be deleted but the structure will remain in the memory for further operations.


-- SQL Query to Copy, Duplicate or Backup Table
-- SQL Backup Table with All Columns Data Example
CREATE TABLE stud_1 AS SELECT * FROM Student_details;
SELECT * FROM stud_1;

-- SQL Backup Table with Specific Column Data Example
CREATE TABLE stud_2 AS
SELECT ROLL_NO,NAME FROM Student_details;
SELECT * FROM stud_2;

-- SQL Backup Table with No Data Example
CREATE TABLE geeks_student AS SELECT * FROM student_information
WHERE 1!=1; -- Here it returns false only columns
SELECT * FROM geeks_student;

-- Temporary Table in SQL
CREATE TEMPORARY TABLE EmpDetails (
    id INT,
    name VARCHAR(25)
);

INSERT INTO EmpDetails VALUES 
(1, 'Lalit'), 
(2, 'Atharva');
SELECT * FROM EmpDetails;
DROP TEMPORARY TABLE IF EXISTS EmpDetails;
