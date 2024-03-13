-- 2. (Medium) 

-- Perform read operation on the designed table created in the above task.
-- a. How many female passengers traveled a minimum distance of 600 KMs? (1 mark)

SELECT 
    COUNT(*) AS Female_passengers
FROM
    passenger
WHERE
    gender = 'f' AND distance >= 600;
    
-- ANSWER : THERE ARE 2 FEMALE PASSENGERS WHO TRAVELLED A MINIMUM DISTANCE OF 600 KMs.

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and
-- who are traveling in a sleeper bus. (2 marks)

SELECT 
    *
FROM
    passenger
WHERE
    distance > 500 AND bus_type = 'sleeper';


-- c. Select passenger names whose names start with the character 'S'.(2 marks)

select passenger_name from passenger where passenger_name like "s%";

-- ANSWER: THERE IS ONLY ONE PASSENGER NAMED "SEJAL" WHOSE NAME STARTS WITH "S".

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
-- Destination City, Bus type, and Price in the output. (3 marks)

SELECT 
    pa.passenger_name,
    pa.boarding_city,
    pa.destination_city,
    pa.bus_type,
    p.price
FROM
    passenger pa
        INNER JOIN
    price p ON pa.bus_type = p.bus_type
        AND pa.distance = p.distance; 
        
-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in
-- a bus? (4 marks)

SELECT 
    p.passenger_name, pr.price
FROM
    passenger p
        JOIN
    price pr ON p.bus_type = pr.bus_type
        AND p.distance = pr.distance
WHERE
    pr.distance = 1000
        AND p.bus_type = 'sitting';
        
-- ANSWER : THERE IS NO PASSENGER WHO TRAVELLED 1000 KMs SITTING IN A BUS.
	
-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? (5
-- marks)

SELECT 
    pr.bus_type, pr.price
FROM
    price pr
WHERE
    pr.distance = (SELECT 
            distance
        FROM
            passenger
        WHERE
            passenger_name = 'pallavi'
                AND ((boarding_city = 'panaji'
                AND destination_city = 'bengaluru')
                OR (boarding_city = 'Bengaluru'
                AND destination_city = 'panaji')));
                
-- EXPLANATION : WHEN THE BOARDING CITY IS PANAJI AND THE DESTINATION CITY IS BENGALURU ;OR THE BOARDING CITY IS BENGALURU AND THE DESTINATION CITY IS PANAJI,
-- 			     THE DISTANCE WOULD BE THE SAME , SO THOSE CONDITIONS ARE ADDED FOR FILTERING. HYPOTHETICALLY WHEN THERE IS ANOTHER RECORD OF THE PASSENGER_NAME
--               "PALLAVI" IN WHICH BOARDING CITY OR THE DESTINATION CITY IS DIFFERENT , THE DISTANCE WOULD ALSO BE DIFFERENT. IN THAT CASE IF WE USE ONLY THE 
--               PASSENGER_NAME FOR FILTERING , IT WOULD RESULT IN CONFLICT.

-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper (2 marks)

UPDATE passenger 
SET 
    category = 'Non-AC'
WHERE
    Bus_type = 'sleeper';

SELECT * FROM PASSENGER;
-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in
-- the database. (1 mark)

DELETE FROM passenger 
WHERE
    passenger_name = 'piyush'; 

commit;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if
-- required). (1 mark)

truncate passenger;
SELECT * FROM PASSENGER; -- TO SHOW THE TABLE PASSENGER.

-- COMMENT : THERE WOULD BE NO RECORDS IN THE TABLE "PASSENGER" AS THE TRUNCATE COMMAND DELETES ALL THE RECORDS IN THE TABLE "PASSENGER",RETAINING ONLY ITS STRUCTURE.

-- j. Delete the table passenger from the database. (1 mark)

drop table passenger;

-- COMMENT : THERE WOULD BE "PRICE" TABLE ONLY IN TRAVEGO DATABASE AFTER DROPPING THE "PASSENGER" TABLE. THIS CAN BE VERIFIED BY THE QUERY "SHOW TABLES;" AS FOLLOWS.

SHOW TABLES;