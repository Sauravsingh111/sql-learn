USE ABCorganization;
create database ABCorganization;
CREATE TABLE LOACTION(
LOCATION_ID INT PRIMARY KEY,
STREET_ADDRESS varchar(100) NOT NULL,

CITY VARCHAR(30) NOT NULL,
STATE VARCHAR(30) NOT NULL,
COUNTRY VARCHAR(30) NOT NULL
);
ALTER TABLE LOACTION DROP COLUMN POSTAL_CODE;
ALTER TABLE LOACTION ADD POSTAL_CODE  INT CHECK ( POSTAL_CODE >= 10000 AND POSTAL_CODE <= 99999);

CREATE TABLE JOBS(
JOB_ID VARCHAR(10) PRIMARY KEY,
JOB_TITLE varchar(40) NOT NULL,
MIN_SALARY decimal,
MAX_SALARY decimal
);

CREATE TABLE DEPATMENTS(
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(30) NOT NULL,
LOCATION_ID INT,
foreign key (LOCATION_ID) references LOACTION (LOCATION_ID)
);

CREATE TABLE EMPLOYEES(
EMPLOYEE_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20),
EMAIL_ID VARCHAR(50)NOT NULL,
Phone_Number char(10)NOT NULL,
HIRE_DATE DATE,
JOB_ID VARCHAR(10),
FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID),
SALARY DECIMAL,
MANAGER_ID INT,
FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
);

DESC EMPLOYEES;
DESC LOACTION;

ALTER TABLE EMPLOYEES ADD DEPARTMENT_ID INT, ADD CONSTRAINT FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPATMENTS (DEPARTMENT_ID); 

INSERT INTO LOACTION VALUES(101,'AIROLI AREA','MUMBAI','MAHARASTRA','INDIA',22839);
SELECT* FROM LOACTION;
insert into loaction values(102,'Def Area','Pune','Maharashtra','India',12334);

insert into loaction values(103,'Jkl Area','Madras','Chennai','India',12335);

insert into loaction values(104,'Mno Area','Banglore','Karnataka','India',12336);

insert into loaction values(105,'STU Area','Hyderabad','Telangana','India',12337);

insert into jobs values(1001,'Junior',10000,20000);

insert into jobs values(1002,'Senior',50000,100000);

insert into jobs values(1003,'Manager',100000,150000);

insert into jobs values(1004,'Director',150000,200000);

insert into jobs values(1005,'Vice President',200000,300000);

insert into DEPATMENTS values(10001,'sales',101);

insert into DEPATMENTS values(10002,'marketing',101);

insert into DEPATMENTS values(10003,'Testing',102);

insert into DEPATMENTS values(10004,'QA',103);

insert into DEPATMENTS values(10005,'Devlopment',104);

insert into DEPATMENTS values(10006,'Deployment',105);

insert into DEPATMENTS values(10007,'Delivery',103);

insert into employees(EMPLOYEE_ID,First_Name,Last_Name,Email_ID,Phone_Number,Hire_Date,Job_ID,Salary,Manager_ID,department_id) 
values(1,'Sagar','Rumandla','sr@mail',1234567899,'2023-01-01',1001,15000,null,10001);

insert into employees(employee_id,first_name,last_name,email_id,phone_number,hire_date,job_id,salary,manager_id,department_id) 
values(2,'Saurav','Singh','ss@mail',123321,'2020-01-01',1005,1500000,1,10002);
select* from depatments;
desc employees;
select* from employees;
insert into employees values(3,'Saumil','Shah','sas@mail',123123,'2021-01-04',1004,500000,2,10003);

insert into employees values(4,'Rajat','Singh','rs@mail',123321123,'2021-01-05',1004,400000,2,10004);

insert into employees values(5,'Onkar','Mane','om@mail',123322,'2021-01-06',1004,400000,2,10005);

insert into employees values(6,'prasanna','Ratnaparkhi','pr@mail',123789,'2021-01-08',1003,500000,3,10006);

insert into employees values(7,'Vinayak','Gawade','vg@mail',456789,'2021-02-08',1003,50000,3,10007);

insert into employees values(8,'Vijay','Yadav','vy@mail',321789,'2021-03-08',1003,40000,4,10001);

insert into employees values(9,'Ram','Biyani','rb@mail',234789,'2021-05-08',1003,30000,4,10002);

insert into employees values(10,'Kunal','singh','ks@mail',543789,'2021-11-08',1002,20000,6,10003);

insert into employees values(11,'Amit','Kumar','ak@mail',548789,'2021-12-08',1002,22000,6,10004);

insert into employees values(12,'onkar','ravrane','or@mail',543749,'2021-12-08',1002,32000,7,10007);

insert into employees values(13,'Siraj','Khan','sk@mail',593749,'2021-03-06',1002,32000,7,10005);

-- Write a SQL statement to display Employee ID, First Name, LastName, Salary of all employees.

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;

-- Write query to display all Job ID from Employees table without any repetition
SELECT * FROM EMPLOYEES;

SELECT distinct JOB_ID AS JOBS FROM EMPLOYEES;

-- Display name of all employees whose city is ‘Paris’.

SELECT e.first_Name, e.last_Name
FROM Employees e
JOIN Depatments d ON e.Department_ID = d.Department_ID
JOIN Loaction l ON d.Location_ID = l.Location_ID
WHERE l.City = 'pune';

-- Display all employee details for employees whose department id is 20 or 40 or 60.

SELECT e.first_name, e.last_name, d.department_name FROM EMPLOYEES e 
join depatments d on e.department_id = d.department_id where d.Department_name = 'marketing';

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 10001 OR DEPARTMENT_ID = 10007;

-- Write query to display the first name, last name, department number and department name for each employee.
-- employ_id,f,l,depart_id,location_id
SELECT e.first_name, e.last_name, d.department_name,d.department_id from Employees e 
join Depatments d on e.department_id = d.department_id;

SELECT e.first_name, e.last_name,e.employee_id, d.location_id,d.department_id from Employees e 
join Depatments d on e.department_id = d.department_id;

-- Write query to display first name, last name, department name, city and country for each employee whose salary is within 20000 to 80000.

Select e.first_name, e.last_name, d.department_name, l.city, l.country from Employees e join depatments d on
e.department_id = d.department_id join loaction l on d.location_id = l.location_id where e.salary between 20000 and 80000; 

-- Write SQL query to display first name of all employees whose name contains ‘ah’.

Select first_name from employees where first_name like '%sa%';

-- Write SQL query to display details of all employees who joined in the year 2005.

Select * from employees where year(hire_date) = 2021;

-- Display number of employees as per the Job ID.

SELECT JOB_ID, COUNT(JOB_ID) AS JOB FROM EMPLOYEES group by JOB_ID;

-- Display all department names, where no employees tagged.

SELECT  d.DEPARTMENT_NAME FROM depatments d LEFT JOIN employees e on d.department_id = e.department_id where e.employee_id is null; 

-- Write first name, last name and salary for those employee whose salary is greater than salary of the employee whose id is 2.

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >(SELECT SALARY FROM EMPLOYEES  WHERE EMPLOYEE_ID = 1);

-- Display first name of employees with their manager’s first name. 
USE abcorganization;
SELECT e.first_name AS EMPLOYEE_FIRST_NAME, m.first_name AS MANGER_FIRST_NAME 
FROM employees e 
left join employees m on m.employee_id = e.manager_id;
 
SELECT e.First_Name AS Employee_First_Name, m.First_Name AS Manager_First_Name
FROM Employees e
LEFT JOIN Employees m ON e.Manager_ID = m.Employee_ID;

-- Write a stored procedure to display number of employees from the provided department id.
-- Display name of all employees which are not tagged to any department.
SELECT e.First_name, e.Last_name 
From employees e
LEFT JOIN depatments d On e.department_id = d.department_id where d.department_id is null; 

SELECT e.First_Name, e.Last_Name
FROM Employees e
LEFT JOIN Departments d ON e.Department_ID = d.Department_ID
WHERE d.Department_ID IS NULL;







