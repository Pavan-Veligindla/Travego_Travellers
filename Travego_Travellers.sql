CREATE DATABASE travel;
USE travel;

CREATE TABLE passenger (
	Passenger_id INT,
    Passenger_name VARCHAR(20),
    Category VARCHAR(20),
    Gender VARCHAR(20),
    Boarding_city VARCHAR(20),
    Destination_city VARCHAR(20),
    Distance INT(20),
    Bus_Type VARCHAR(20)
    );
    SHOW TABLES;
    
 INSERT INTO Passenger VALUES
	(1,"Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper"),
    (2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
    (3,"Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper"),
    (4,'Khusboo','AC','F','Chennai','Munbai',1500,'Sleeper'),
    (5,"Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper"),
    (6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
    (7,"Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper"),
    (8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
     (9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting')
    ;
    select * from passenger;
    
    
CREATE TABLE price (
	id INT,
    Bus_Type VARCHAR(20),
    Distance INT,
    Price int
    );
    SHOW TABLES;
    describe price;
    
INSERT INTO Price VALUES
	(1,"Sleeper",350,770),
    (2,"Sleeper",500,1100),
    (3,"Sleeper",600,1320),
    (4,"Sleeper",700,1540),
    (5,"Sleeper",1000,2200),
    (6,"Sleeper",1200,2640),
    (7,"Sleeper",1500,2700),
    (8,"Sitting",500,620),
	(9,"Sitting",600,744),
	(10,"Sitting",700,868),
	(11,"Sitting",1000,1240),
	(12,"Sitting",1200,1488),
	(13,"Sitting",1500,1860)
    ;
select * from price;


-- TASK-2

-- 1) 
-- a)
	SHOW TABLES;
    DESCRIBE passenger;
    DESCRIBE price;
    
-- b) 
	select *  from passenger,price;
    select * from price;
    
    
-- 2) 
	-- a) How many female passengers traveled a minimum distance of 600 KMs?
   select count(Gender) as Female_passengers_count from passenger WHERE Gender = "F" AND distance  >= 600 GROUP BY Gender ;
   
	-- b)Write a query to display the passenger details whose travel distance is greaterthan 500 and who are traveling in a sleeperbus.
    select * from passenger WHERE distance  > 500 AND Bus_Type = "Sleeper";
    
    -- c)Select passenger names whose names start with the character 'S'
    select passenger_name from passenger WHERE passenger_name LIKE 'S%';
    
    -- d) Calculate the price charged for each passenger,displaying the Passengername, BoardingCity, DestinationCity, Bustype, and Price in the output.
    select p.Passenger_name, p.Boarding_city, p.Destination_city, p.Bus_type, pr.Price from passenger as p, price as pr WHERE p.distance = pr.distance AND p.Bus_Type = pr.Bus_Type;
    
    -- e) What are the passenger name(s) and the ticket price for those who traveled 1000KMs Sitting in a bus?
    select * from passenger,price;
    select p.Passenger_name, pr.price from passenger as p, Price as pr WHERE p.Distance = 1000 AND p.Bus_Type = 'Sitting' AND pr.Distance = 1000 AND pr.Bus_Type = 'Sitting';
    
    -- f) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
    SELECT DISTINCT p.Passenger_name, p.Boarding_city as Destination_city, p.Destination_city as Boardng_city, p.Bus_type, pr.Price FROM passenger p, price pr WHERE Passenger_name = 'Pallavi' AND p.Distance = pr.Distance;
    
    -- g) Alter the column category with the value "Non-AC" where the Bus_Type is sleeper?
    UPDATE passenger
    SET category = 'Non-AC'
    WHERE Bus_type = 'sleeper';
    select * from passenger;
    
    -- h) Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
    DELETE FROM passenger
    WHERE Passenger_name = 'Piyush';
    
    -- i) Truncate the table passenger and comment on the number of rows in the table (explainifrequired).
    TRUNCATE TABLE passenger;
    -- No more rows in the table passenger because truncate delete's all the data in the table but table and it's structure will remain.
    
    -- j) Delete the table passenger from the database.
    DROP TABLE passenger;
    
    
    
    
    