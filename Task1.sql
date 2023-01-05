CREATE DATABASE company;
use company;
DROP TABLE IF EXISTS person ;
CREATE TABLE person (
personId int primary key,
lastName varchar(20),
firstName varchar(20)
);

CREATE TABLE address(
addressId int primary key,
personId int,
city varchar(20),
state varchar(20)
);

INSERT INTO person
VALUES 
(1,'Wong','Alice'),
(2,'Sharma','Arnold');

INSERT INTO address
VALUES 
(1,2,'mumbai','Maharashtra'),
(2,3,'Calangute','Goa');

SELECT firstName,lastName,city,state FROM person a LEFT JOIN address b ON a.personId=b.personId;


#Question 2
DROP TABLE IF EXISTS person ;
CREATE TABLE person (
id int primary key,
email varchar(20)
);



INSERT INTO person
VALUES 
(1,'a@b.com'),
(2,'a@c.com'),
(3,'a@c.com');

SELECT email FROM person GROUP BY email HAVING count(email) > 1 ;
desc person;
CREATE TRIGGER lower_email 
BEFORE INSERT ON person 
FOR EACH ROW
SET new.email = lower(new.email) ;

INSERT INTO person
VALUES 
(4,'aAAB@b.com'),
(5,'aRAc@c.com'),
(6,'a@c.com');




#Question3
CREATE TABLE department (
id int primary key,
dept_name varchar(20)
);

CREATE TABLE employee (
id int primary key,
emp_name varchar(50),
salary int,
dept_id int,
foreign key (dept_id ) references department(id) 
);

INSERT INTO department
VALUES 
(2,'Sales'),
(1,'IT');

INSERT INTO employee
VALUES
(1  , 'Joe', 85000  , 1),
( 2  , 'Henry', 80000, 2),
(3  , 'Sam', 60000  , 2),
(4  , 'Max'   , 90000  , 1),
(5 , 'Janet', 69000, 1),
( 6  , 'Randy', 85000, 1),     
( 7  ,'Will',70000 ,1);   

SELECT 
    dept_name, emp_name, salary
FROM
    employee a
        JOIN
    department b ON a.dept_id = b.id
ORDER BY dept_name , salary DESC;



