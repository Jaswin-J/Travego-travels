-- Travego Travellers

-- 1. (Easy) 

-- Creating the schema and required tables using MySQL workbench
-- a. Create a schema named Travego and create the tables mentioned above with the mentioned
-- column names. Also, declare the relevant datatypes for each feature/column in the dataset. (5
-- marks)

create database Travego;
use Travego;

CREATE TABLE passenger (
    Passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(20),
    category VARCHAR(20),
    gender VARCHAR(20),
    boarding_city VARCHAR(20),
    destination_city VARCHAR(20),
    distance INT,
    bus_type VARCHAR(20)
);

CREATE TABLE price (
    id INT PRIMARY KEY,
    bus_type VARCHAR(20),
    distance INT,
    price INT
);

-- b. Insert the data in the newly created tables. (3 marks)
-- Insert data in these tables

insert into  passenger values 
	(1, "Sejal", "AC", "F" ,"Bengaluru" ,"Chennai" ,350 ,"Sleeper"),
	(2, "Anmol", "Non-AC", "M" ,"Mumbai", "Hyderabad" ,700 ,"Sitting"),
	(3, "Pallavi", "AC" ,"F" ,"Panaji", "Bengaluru" ,600, "Sleeper"),
	(4 ,"Khusboo", "AC", "F" ,"Chennai", "Mumbai", 1500, "Sleeper"),
	(5 ,"Udit", "Non-AC" ,"M" ,"Trivandrum" ,"Panaji" ,1000 ,"Sleeper"),
	(6 ,"Ankur", "AC", "M", "Nagpur", "Hyderabad" ,500, "Sitting" ),
	(7 ,"Hemant", "Non-AC", "M" ,"Panaji", "Mumbai" ,700 ,"Sleeper"),
	(8 ,"Manish" ,"Non-AC", "M" ,"Hyderabad", "Bengaluru", 500, "Sitting"),
	(9 ,"Piyush" ,"AC" ,"M", "Pune", "Nagpur" ,700 ,"Sitting") ;

insert into price values 
(1, "Sleeper", 350, 770),
(2, "Sleeper", 500, 1100),
(3, "Sleeper", 600, 1320),
(4, "Sleeper", 700, 1540),
(5, "Sleeper", 1000, 2200),
(6, "Sleeper", 1200, 2640),
(7, "Sleeper", 1500, 2700),
(8, "Sitting", 500, 620),
(9, "Sitting", 600, 744),
(10,"Sitting", 700, 868),
(11, "Sitting", 1000, 1240),
(12, "Sitting", 1200, 1488),
(13, "Sitting", 1500, 1860);

