CREATE DATABASE startup;
USE startup;
-- Create Designation Table

CREATE TABLE desg (
    desg_id INT PRIMARY KEY,
    designation VARCHAR(50)
);

-- Add records in desg Table

INSERT INTO desg
VALUES
    (1, 'CEO'),
    (2, 'Service Line Lead'),
    (3, 'Executive Director'),
    (4, 'Associate Director'),
    (5, 'Senior Manager'),
    (6, 'Manager'),
    (7, 'Assistant Manager'),
    (8, 'Senior Executive'),
    (9, 'Executive'),
    (10, 'Trainee');

-- Create Employee Table

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    desg_id INT,

    FOREIGN KEY (desg_id) REFERENCES desg(desg_id)
);

-- Add records in Employee Table

INSERT INTO emp
VALUES
    (1, 'Sebastian', 'Vance',1),
    (2, 'Clara', 'Montgomery',2),
    (3, 'Julian', 'Thorne',2),
    (4, 'Isolde', 'Beaumont',2),
    (5, 'Arthur', 'Sterling',3),
    (6, 'Elena', 'Rossi',3),
    (7, 'Oliver', 'Whittaker',3),
    (8, 'Genevieve', 'Dubois',4),
    (9, 'Dominic', 'Sauvage',4),
    (10, 'Matilda', 'Schmidt',4),
    (11, 'Alaric', 'Fletcher',5),
    (12, 'Beatrix', 'Finch',5),
    (13, 'Hugo', 'Sokolov',5),
    (14, 'Chloe', 'Nguyen',6),
    (15, 'Jasper', 'Kim',6),
    (16, 'Maya', 'Tanaka',6),
    (17, 'Xavier', 'Brooks',7),
    (18, 'Sienna', 'Walsh',7),
    (19, 'Leona', 'Knight',7),
    (20, 'Roman', 'Blackwood',7),
    (21, 'Atticus', 'Kennedi',8),
    (22, 'Penelope', 'Finch',8),
    (23, 'Jasper', 'Moon',8),
    (24, 'Dev', 'Patel',9),
    (25, 'Shahbaz', 'Ahmed',10);
    
-- Create Reoprting Manager Table

CREATE TABLE reporting (
    id INT PRIMARY KEY,
    emp_id INT,
    reports_to INT,

    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (reports_to) REFERENCES emp(emp_id)
);

-- Add records in Reporting Manager Table

INSERT INTO reporting
VALUES
    (1, 1, NULL),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 2),
    (6, 6, 3),
    (7, 7, 4),
    (8, 8, 5),
    (9, 9, 6),
    (10, 10, 7),
    (11, 11, 8),
    (12, 12, 9),
    (13, 13, 10),
    (14, 14, 11),
    (15, 15, 12),
    (16, 16, 13),
    (17, 17, 14),
    (18, 18, 15),
    (19, 19, 16),
    (20, 20, 15),
    (21, 21, 20),
    (22, 22, 20),
    (23, 23, 20),
    (24, 24, 22),
    (25, 25, 24);

-- Create Departments Table--
 
CREATE TABLE departments (
    dep_id INT PRIMARY KEY,
    department VARCHAR(50)
);

-- Insert records into departments table -- 

INSERT INTO departments
VALUES
	(1, 'Executive'),
    (2, 'Tech'),
    (3, 'Project Management'),
    (4, 'Marketing');

-- Create Salary Table

CREATE TABLE salary (
id INT PRIMARY KEY,
emp_id INT,
saLary INT,

FOREIGN KEY (emp_id) REFERENCES emp(emp_id)
);

-- Add records in Salary Table

INSERT INTO salary
VALUES
    (1,1,1000000),
    (2,2,500000),
    (3,3,500000),
    (4,4,500000),
    (5,5,400000),
    (6,6,400000),
    (7,7,400000),
    (8,8,300000),
    (9,9,300000),
    (10,10,300000),
    (11,11,200000),
    (12,12,200000),
    (13,13,200000),
    (14,14,100000),
    (15,15,100000),
    (16,16,100000),
    (17,17,90000),
    (18,18,80000),
    (19,19,85000),
    (20,20,750000),
    (21,21,60000),
    (22,22,59000),
    (23,23,57000),
    (24,24,51000),
    (25,25,42000);


-- Create Employee Department Table--

CREATE TABLE emp_department (
    id INT PRIMARY KEY,
    emp_id INT,
    dep_id INT,
    
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (dep_id) REFERENCES departments(dep_id)
);

-- Insert records into Employee Department table -- 

INSERT INTO emp_department
VALUES
    (1,1,1),
    (2,2,1),
    (3,3,1),
    (4,4,1),
    (5,5,1),
    (6,6,1),
    (7,7,1),
    (8,8,1),
    (9,9,1),
    (10,10,1),
    (11,11,2),
    (12,12,3),
    (13,13,4),
    (14,14,2),
    (15,15,3),
    (16,16,4),
    (17,17,2),
    (18,18,3),
    (19,19,4),
    (20,20,2),
    (21,21,2),
    (22,22,2),
    (23,23,2),
    (24,24,2),
    (25,25,2);