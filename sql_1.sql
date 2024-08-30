CREATE TABLE Information (
    id int ,
    LastName Varchar(20) ,
    FirstName Varchar(20),
    City Varchar(24),
    Company Varchar(50)
);

Create database Test;

-- ALTER DATABASE capgemu MODIFY NAME = CAPGEMINI;

CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE TABLEDEPARTMENTS (
       DepID int PRIMARY KEY,
       DepartmentName varchar(1000) NOT NULL
);

CREATE TABLE TABLEEMPLOYEES(
       EmployeeId int PRIMARY KEY NOT NULL,
       EmployeeName varchar(100) NOT NULL,
       Phone int NOT NULL,
       DepId int,
       foreign key (DepId) references TableDepartments (DepId)
       
);
Insert into Tableemployees Values ( 1, 'sas', 2837464, 1001);
Insert into Tabledepartments Values ( 1001, 'ssks');

select * from Tableemployees;
 
select * from Tabledepartments;






Desc Tableemployees;
Drop Table TableEmployees;
INSERT INTO TABLEDEPARTMENTS( DepId , DepartmentName) values ( 1 , 'cloud' );
Select * From TABLEDEPARTMENTS;
INSERT INTO TABLEDEPARTMENTS values ( 2 , 'clo' ),(3 , 'STE');

UPDATE TABLEDEPARTMENTS SET DEPARTMENTNAME = 'AGILE' WHERE DepId = 3;

USE COMPANY;
SELECT CURDATE();
SELECT CURDATE() + 1;
SELECT CURRENT_TIME();
SELECT LEFT('SKDKFF',3);
select length('dgdgjkkkllll');
select lower('ADFGHJKJK');
select replace('ABC 2020','2020', '2021');
select reverse('DCDCCDDD');
select substring('FGGFHKGLHFFHJD',2,5);

