-- Source: https://www.geeksforgeeks.org/sql-tutorial and ChatGPT

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

-- -----------------------------------------------------------------------------------------------
-- SQL Queries
-- SQL SELECT Query

CREATE TABLE Customer_Select(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  Phone int(10)
);
DROP TABLE Customer_Select;
-- Insert some sample data into the Customers table
INSERT INTO Customer_Select (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','982653147'),
       (2, 'Aman ', 'Chopra', 'Australia','21','789456123'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','698745123'),
       (4, 'Aditya', 'Arpan', 'Austria','21','885858505'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','789456123');
       
-- Retrieve Data using SELECT Query
SELECT CustomerName, LastName FROM Customer_Select;

-- Fetch All Table using SELECT Statement
SELECT * FROM Customer_Select;

-- SQL TOP, LIMIT, FETCH FIRST Clause
/*SQL TOP Clause is used in SQL Server and Sybase to limit the number of records returned.
SQL LIMIT Clause is utilized in MySQL, PostgreSQL, and SQLite.
SQL FETCH FIRST Clause is part of the SQL standard and is supported by Oracle, DB2, PostgreSQL, and SQL Server (as part of OFFSET-FETCH).*/
CREATE TABLE Employee_C (
   EmpId INTEGER PRIMARY KEY, 
   EmpName VARCHAR(225) NOT NULL,  
   Email VARCHAR(225) NOT NULL,   
   Address VARCHAR(225) NOT NULL,
   Age INT NOT NULL,
   Salary INT NOT NULL
);
INSERT INTO Employee_C (EmpId, EmpName, Email, Address, Age, Salary)
VALUES (1, 'Shubham', 'shubham@example.com', 'India', 23, 50000.00),
       (2, 'Aman', 'aman@example.com', 'Australia', 21, 45000.00),
       (3, 'Naveen', 'naveen@example.com', 'Sri Lanka', 24, 55000.00),
       (4, 'Aditya', 'aditya@example.com', 'Austria', 21, 42000.00),
       (5, 'Nishant Saluja', 'nishant@example.com', 'Spain', 22, 48000.00);

-- SQL SELECT LIMIT Clause
SELECT * FROM Employee_C ORDER BY Salary DESC LIMIT 4;

-- SQL LIMIT With OFFSET Clause Example
SELECT * FROM Employee_C LIMIT 2 OFFSET 2;

-- SQL – SELECT RANDOM
/*SELECT col_1,col_2, ... FROM Table_Name
ORDER BY RAND()
LIMIT 1*/
SELECT * FROM Employee_C 
ORDER BY RAND() LIMIT 1;

-- SQL SELECT IN Statement
CREATE TABLE COURSE(
    course_id INT,
    course_name VARCHAR(20),
    duration_of_course INT,
    PRIMARY KEY(course_id)
); 

CREATE TABLE STUDENT(
    roll_no INT,
    student_name VARCHAR(20),
    course_id INT,
    PRIMARY KEY(roll_no)
); 

INSERT INTO COURSE(course_id, course_name, duration_of_course) 
VALUES
    (1, 'BCA', 3),
    (2, 'MCA', 3),
    (3, 'B.E.', 4),
    (4, 'M.E.', 2),
    (5, 'Integrated BE and ME', 5);

INSERT INTO STUDENT(roll_no, student_name, course_id) 
VALUES
    (1, 'ANDREW', 1),
    (2, 'BOB', 1),
    (3, 'CHARLES', 1),
    (4, 'DAIZY', 3),
    (5, 'EMMANUEL', 2),
    (6, 'FAIZAL', 2),
    (7, 'GEORGE', 4),
    (8, 'HARSH', 5),
    (9, 'ISHA', 2),
    (10, 'JULIAN', 2),
    (11, 'KAILASH', 3),
    (12, 'LAIBA', 5),
    (13, 'MICHAEL', 3);
    
SELECT * FROM COURSE;
SELECT * FROM STUDENT;
    
SELECT * FROM STUDENT
WHERE course_id
IN (1, 2, 3);
    
SELECT * FROM STUDENT WHERE course_id IN (SELECT course_id  FROM COURSE
      WHERE duration_of_course = 3);
      
-- SQL SELECT Multiple 
SELECT EmpId, EmpName, Email, Address, Age, Salary
FROM Employee_C 
WHERE Address = 'India';

-- SQL SELECT Date
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);

-- Insert sample data into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-01-01 10:00:00', 250.75),
(2, '2024-01-15 14:30:00', 150.50),
(3, '2024-02-05 09:45:00', 350.20),
(4, '2024-03-10 16:00:00', 220.90),
(5, '2023-12-28 11:00:00', 180.00),
(6, '2024-01-01 14:00:00', 299.99);

select * FROM Orders;

SELECT * FROM Orders WHERE OrderDate = '2024-01-01 10:00:00';

-- SQL Query to Insert Multiple Rows
CREATE TABLE employee_details(
   emp_id VARCHAR(8),
   emp_name VARCHAR(20),
   emp_dept_id VARCHAR(20),
   emp_age INT);

INSERT INTO employee_details VALUES('E40001','PRADEEP','E101',36);
INSERT INTO employee_details VALUES('E40002','ASHOK','E102',28);
INSERT INTO employee_details VALUES('E40003','PAVAN KUMAR','E103',28); 

SELECT * FROM employee_details;

INSERT INTO employee_details VALUES('E40005','THAMAN','E103',26),
('E40006','HARSH','E101',25),
  ('E40007','SAMHITH','E102',26);

-- SQL UPDATE Statement
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  Phone int(10)
);

-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','789456123'),
       (2, 'Aman ', 'Chopra', 'Australia','21','789456127'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','789456126'),
       (4, 'Aditya', 'Arpan', 'Austria','21','789456125'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','789456124'); 
       
Select * from Customer;

SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET CustomerName = 'Manish' WHERE Age = 22;
UPDATE Customer SET CustomerName = 'Satyam', 
Country = 'USA' WHERE CustomerID = 1;

-- SQL DELETE Statement
CREATE TABLE GFG_Employees (
   id INT PRIMARY KEY,
   name VARCHAR (20) ,
   email VARCHAR (25),
   department VARCHAR(20)
);
INSERT INTO GFG_Employees (id, name, email, department) VALUES 
(1, 'Jessie', 'jessie23@gmail.com', 'Development'),
(2, 'Praveen', 'praveen_dagger@yahoo.com', 'HR'),
(3, 'Bisa', 'dragonBall@gmail.com', 'Sales'),
(4, 'Rithvik', 'msvv@hotmail.com', 'IT'),
(5, 'Suraj', 'srjsunny@gmail.com', 'Quality Assurance'),
(6, 'Om', 'OmShukla@yahoo.com', 'IT'),
(7, 'Naruto', 'uzumaki@konoha.com', 'Development');
Select * From GFG_Employees

DELETE FROM GFG_Employees WHERE NAME = 'Rithvik';  

DELETE FROM GFG_Employees 
WHERE department = 'Development';

DELETE FROM GFG_Employees;

-- -----------------------------------------------------------------------------------------
-- SQL Clauses
