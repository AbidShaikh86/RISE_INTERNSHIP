CREATE TABLE Trains 
(
train_id INT NOT NULL,
train_name VARCHAR(50) NOT NULL,
source VARCHAR(30),
destination VARCHAR(30) NOT NULL,
departure_time TIME NOT NULL,
arrival_time TIME NOT NULL,
distance_km INT NOT NULL
CONSTRAINT chk_distance CHECK(distance_km > 0)
)

CREATE TABLE Passengers 
(
passenger_id INT,
name VARCHAR(40) NOT NULL,
age INT,
gender CHAR,
city VARCHAR(30),
CONSTRAINT chk_age CHECK (age > 0),
CONSTRAINT chk_gender CHECK(gender IN ('M','F'))
)

CREATE TABLE Reservations (
res_id INT,
passenger_ID INT,
train_id INT,
travel_date DATE NOT NULL,
class VARCHAR(10), 
fare INT ,
status VARCHAR(25),
CONSTRAINT chk_class CHECK(class IN ('Sleeper', 'AC1', 'AC2', 'AC3')),
CONSTRAINT chk_status CHECK(status IN ('Confirmed', 'Waiting', 'Cancelled')),
CONSTRAINT chk_fare CHECK(fare >= 0)
)
INSERT INTO Trains VALUES
(101, 'Shatabdi Exp', 'Delhi', 'Bhopal', '06:00', '14:00', 700),
(102, 'Rajdhani Exp', 'Delhi', 'Mumbai', '16:00', '08:00', 1400),
(103, 'Duronto Exp', 'Mumbai', 'Chennai', '20:00', '10:00', 1300),
(104, 'Garib Rath', 'Kolkata', 'Delhi', '12:00', '06:00', 1500),
(105, 'Chennai Exp', 'Chennai', 'Delhi', '08:00', '22:00', 2200),
(106, 'Howrah Exp', 'Howrah', 'Mumbai', '10:00', '20:00', 1960),
(107, 'Nizamuddin Exp', 'Delhi', 'Hyderabad', '15:00', '05:00', 1675),
(108, 'Goa Exp', 'Mumbai', 'Goa', '07:00', '15:00', 589),
(109, 'Kashi Exp', 'Varanasi', 'Delhi', '05:30', '13:30', 820),
(110, 'Jammu Tawi Exp', 'Delhi', 'Jammu', '18:00', '07:00', 670),
(111, 'Karnataka Exp', 'Bangalore', 'Delhi', '21:00', '14:00', 2360),
(112, 'Kerala Exp', 'Trivandrum', 'Delhi', '11:00', '22:00', 3045),
(113, 'Punjab Mail', 'Mumbai', 'Firozpur', '19:00', '09:00', 1925),
(114, 'Tamil Nadu Exp', 'Chennai', 'Delhi', '06:30', '20:30', 2180),
(115, 'Andhra Exp', 'Hyderabad', 'Delhi', '06:00', '19:00', 1700),
(116, 'Odisha Sampark', 'Bhubaneswar', 'Delhi', '14:00', '08:00', 1725),
(117, 'Maharashtra Exp', 'Mumbai', 'Nagpur', '09:00', '18:00', 840),
(118, 'Saurashtra Exp', 'Rajkot', 'Mumbai', '06:00', '14:00', 730),
(119, 'Utkal Exp', 'Puri', 'Delhi', '20:00', '12:00', 1850),
(120, 'Konark Exp', 'Mumbai', 'Bhubaneswar', '22:00', '14:00', 1950),
(121, 'Kaveri Exp', 'Mysore', 'Chennai', '23:00', '07:00', 500),
(122, 'Malwa Exp', 'Indore', 'Delhi', '21:00', '08:00', 850),
(123, 'Netravati Exp', 'Mumbai', 'Mangalore', '11:00', '20:00', 720),
(124, 'Ganga Kaveri Exp', 'Chennai', 'Patna', '16:00', '08:00', 2000),
(125, 'Deccan Exp', 'Pune', 'Mumbai', '07:00', '12:00', 192),
(126, 'Shatabdi Kolkata', 'Kolkata', 'Patna', '05:00', '11:00', 535),
(127, 'Sealdah Exp', 'Sealdah', 'Delhi', '15:00', '09:00', 1460),
(128, 'Sundar Exp', 'Bangalore', 'Hyderabad', '18:00', '06:00', 650),
(129, 'Ajmer Exp', 'Ajmer', 'Delhi', '12:00', '21:00', 500);



INSERT INTO Passengers VALUES
(1, 'Ramesh', 45, 'M', 'Delhi'),
(2, 'Sita', 32, 'F', 'Mumbai'),
(3, 'Arjun', 28, 'M', 'Bhopal'),
(4, 'Priya', 19, 'F', 'Chennai'),
(5, 'Anil', 52, 'M', 'Kolkata'),
(6, 'Neha', 27, 'F', 'Delhi'),
(7, 'Vikram', 34, 'M', 'Mumbai'),
(8, 'Sunita', 40, 'F', 'Kolkata'),
(9, 'Rajesh', 50, 'M', 'Chennai'),
(10, 'Meena', 22, 'F', 'Bangalore'),
(11, 'Arvind', 29, 'M', 'Hyderabad'),
(12, 'Kiran', 31, 'M', 'Pune'),
(13, 'Lakshmi', 36, 'F', 'Delhi'),
(14, 'Deepak', 48, 'M', 'Patna'),
(15, 'Swati', 25, 'F', 'Jaipur'),
(16, 'Harish', 55, 'M', 'Varanasi'),
(17, 'Rohit', 19, 'M', 'Lucknow'),
(18, 'Sneha', 23, 'F', 'Ahmedabad'),
(19, 'Manoj', 60, 'M', 'Nagpur'),
(20, 'Kavita', 33, 'F', 'Bhopal'),
(21, 'Ajay', 42, 'M', 'Indore'),
(22, 'Ritu', 28, 'F', 'Mysore'),
(23, 'Pankaj', 37, 'M', 'Goa'),
(24, 'Divya', 30, 'F', 'Surat'),
(25, 'Suresh', 44, 'M', 'Ranchi'),
(26, 'Pooja', 26, 'F', 'Bhubaneswar'),
(27, 'Nitin', 32, 'M', 'Kanpur'),
(28, 'Shalini', 39, 'F', 'Chandigarh'),
(29, 'Gaurav', 21, 'M', 'Shimla'),
(30, 'Anita', 47, 'F', 'Trivandrum')

INSERT INTO Reservations VALUES
(201, 1, 101, '2025-09-01', 'Sleeper', 500, 'Confirmed'),
(202, 2, 102, '2025-09-05', 'AC2', 1800, 'Confirmed'),
(203, 3, 101, '2025-09-01', 'Sleeper', 500, 'Waiting'),
(204, 4, 103, '2025-09-07', 'AC3', 1200, 'Confirmed'),
(205, 5, 104, '2025-09-10', 'Sleeper', 600, 'Cancelled'),
(206, 6, 105, '2025-09-12', 'AC1', 3500, 'Confirmed'),
(207, 7, 106, '2025-09-13', 'AC2', 2200, 'Waiting'),
(208, 8, 107, '2025-09-14', 'Sleeper', 950, 'Confirmed'),
(209, 9, 108, '2025-09-15', 'AC3', 1200, 'Cancelled'),
(210, 10, 109, '2025-09-16', 'AC2', 1400, 'Confirmed'),
(211, 11, 110, '2025-09-17', 'Sleeper', 600, 'Confirmed'),
(212, 12, 111, '2025-09-18', 'AC1', 3800, 'Confirmed'),
(213, 13, 112, '2025-09-19', 'AC3', 2800, 'Waiting'),
(214, 14, 113, '2025-09-20', 'AC2', 2100, 'Confirmed'),
(215, 15, 114, '2025-09-21', 'Sleeper', 950, 'Confirmed'),
(216, 16, 115, '2025-09-22', 'AC2', 1650, 'Cancelled'),
(217, 17, 116, '2025-09-23', 'Sleeper', 800, 'Confirmed'),
(218, 18, 117, '2025-09-24', 'AC3', 1200, 'Confirmed'),
(219, 19, 118, '2025-09-25', 'AC1', 2500, 'Confirmed'),
(220, 20, 119, '2025-09-26', 'Sleeper', 1100, 'Waiting'),
(221, 21, 120, '2025-09-27', 'AC2', 1900, 'Confirmed'),
(222, 22, 121, '2025-09-28', 'AC3', 750, 'Confirmed'),
(223, 23, 122, '2025-09-29', 'Sleeper', 670, 'Cancelled'),
(224, 24, 123, '2025-09-30', 'AC2', 1100, 'Confirmed'),
(225, 25, 124, '2025-10-01', 'AC1', 3100, 'Confirmed'),
(226, 26, 125, '2025-10-02', 'Sleeper', 250, 'Waiting'),
(227, 27, 126, '2025-10-03', 'AC3', 900, 'Confirmed'),
(228, 28, 127, '2025-10-04', 'AC2', 1750, 'Confirmed'),
(229, 29, 128, '2025-10-05', 'Sleeper', 500, 'Confirmed'),
(230, 30, 129, '2025-10-06', 'AC2', 800, 'Cancelled');

--List all trains running from Delhi as source station.
SELECT * FROM Trains
WHERE source = 'Delhi'

--Find all passengers who are above 40 years of age.
SELECT * FROM Passengers
WHERE age > 40

--Get the total number of reservations made.
SELECT COUNT(res_id) as total_reservation FROM Reservations

--Count how many reservations are in 'Confirmed' status.
SELECT * FROM Reservations
WHERE status = 'Confirmed'

--Show the average fare paid for each train.
SELECT T.train_name, AVG(R.fare) AS average_fare FROM Reservations R
INNER JOIN Trains T
ON R.train_id = T.train_id
GROUP BY T.train_name

--List reservations ordered by fare in descending order.
SELECT * FROM Reservations
ORDER BY fare DESC

--Find passengers who booked AC classes (AC2, AC3).
SELECT * FROM Reservations R
INNER JOIN Passengers P
ON R.passenger_ID = P.passenger_id
WHERE R.class IN ('AC2', 'AC3')

--Get total revenue collected per train (only Confirmed reservations).
SELECT T.train_name, SUM(R.fare) as total_revenue FROM Reservations R
INNER JOIN Trains T
ON R.train_id = T.train_id
GROUP BY T.train_name

--Find the train with the maximum distance_km.
SELECT MAX(distance_km) AS maximum_distance_km FROM Trains

SELECT * FROM Trains
WHERE distance_km =
(SELECT MAX(distance_km) FROM Trains)

--Show number of male and female passengers.
SELECT gender, COUNT(passenger_id) AS gender_count FROM Passengers
GROUP BY gender

--Get the passenger names who have booked tickets in Sleeper class.
SELECT P.name, R.class FROM Reservations R
INNER JOIN Passengers p
ON R.passenger_ID = P.passenger_id
WHERE R.class = 'Sleeper'

--Find total number of reservations made from each city (JOIN with Passengers).
SELECT P.city ,COUNT(R.res_id) AS total_reservation FROM Passengers P
INNER JOIN Reservations R
ON P.passenger_id = R.passenger_ID
GROUP BY P.city

--Show train name and total passengers booked for it, ordered by passenger count descending.
SELECT T.train_name ,COUNT(P.passenger_id) AS total_booked FROM Passengers P
INNER JOIN Reservations R
ON P.passenger_id = R.passenger_ID
INNER JOIN Trains T
ON R.train_id = T.train_id
GROUP BY T.train_name
ORDER BY T.train_name DESC

--Find the average age of passengers who booked 'Confirmed' tickets.
SELECT AVG(P.age) AS average_age FROM Passengers P
INNER JOIN Reservations R
ON P.passenger_id = R.passenger_ID
WHERE R.status = 'Confirmed'

--Display travel_date and number of reservations made on that date.
SELECT travel_date, COUNT(*) FROM Reservations
GROUP BY travel_date

--Show all reservations where fare is greater than 1000.
SELECT * FROM Reservations
WHERE fare > 1000

--List all passengers who live in Delhi or Mumbai.
SELECT * FROM Passengers
WHERE city IN ('Delhi','Mumbai')

--Show all trains whose distance is more than 1200 km.
SELECT * FROM Trains
WHERE distance_km > 1200

--Find reservations which are not "Cancelled".
SELECT * FROM Reservations
WHERE status NOT LIKE 'Cancelled'

--Show the details of trains that have "Exp" in their name.
SELECT * FROM Trains
WHERE train_name LIKE '%Exp%'

--List all passengers ordered by their age in descending order.
SELECT * FROM Passengers 
ORDER BY age DESC

--Display reservations sorted by travel_date (earliest first).
SELECT * FROM Reservations
ORDER BY travel_date

--Find all trains ordered by distance (longest route first).
SELECT * FROM Trains
ORDER BY distance_km DESC

--Show passengers ordered by name alphabetically.
SELECT * FROM Passengers
ORDER BY name

--List reservations ordered by class and then by fare.
SELECT * FROM Reservations
ORDER BY class, fare

--Count how many passengers are from each city.
SELECT city, COUNT(passenger_id) AS total_passengers FROM Passengers
GROUP BY city


--Find the total fare collected from all Confirmed reservations.
SELECT SUM(fare) AS confirmed_reserver FROM Reservations
WHERE status = 'Confirmed'


--Show the minimum, maximum, and average age of passengers.
SELECT MAX(age) AS maximum_age, MIN(age) AS minimum_age, AVG(age) AS average_age FROM Passengers

--Find the highest fare paid in Sleeper class.
SELECT class, MAX(fare) AS highest_fare FROM Reservations
GROUP BY class
HAVING class = 'Sleeper'


--Get the average fare per travel_date.
SELECT travel_date, AVG(fare) AS average_fare FROM Reservations
GROUP BY travel_date

--Show each class and the total number of reservations in it.
SELECT class, COUNT(res_id) AS total_reserver FROM Reservations
GROUP BY class

--Find trains that have more than 1 reservation.
SELECT T.train_name, COUNT(R.res_id) AS total_reserver FROM Trains T
INNER JOIN Reservations R
ON T.train_id = R.train_id
GROUP BY T.train_name
HAVING COUNT(R.res_id) > 1

--List cities where more than 1 passenger lives.
SELECT city, COUNT(passenger_id) AS total_passenger FROM Passengers
GROUP BY city
HAVING COUNT(passenger_id) > 1

--Show gender-wise average age of passengers.
SELECT gender, AVG(age) AS average_age   FROM Passengers
GROUP BY gender

--Find passengers who booked more than 1 ticket.
SELECT P.passenger_id, P.name, COUNT(R.res_id) AS total_tickets FROM Passengers P
JOIN Reservations R 
ON P.passenger_id = R.passenger_id
GROUP BY P.passenger_id, P.name
HAVING COUNT(R.res_id) > 1

--Show passenger name, train name, and fare for each reservation.
SELECT P.name, T.train_name, R.fare FROM Reservations R
JOIN Passengers P 
ON R.passenger_id = P.passenger_id
JOIN Trains T 
ON R.train_id = T.train_id

--List all passengers and the train name they booked (if any).
SELECT P.name, T.train_name FROM Passengers P
LEFT JOIN Reservations R 
ON P.passenger_id = R.passenger_id
LEFT JOIN Trains T 
ON R.train_id = T.train_id

--Show all trains and the number of passengers booked in each.
SELECT T.train_id, T.train_name, COUNT(R.passenger_id) AS total_passengers FROM Trains T
LEFT JOIN Reservations R 
ON T.train_id = R.train_id
GROUP BY T.train_id, T.train_name

--Find all passengers who booked Rajdhani Exp.
SELECT DISTINCT P.passenger_id, P.name FROM Passengers P
INNER JOIN Reservations R 
ON P.passenger_id = R.passenger_id
INNER JOIN Trains T 
ON R.train_id = T.train_id
WHERE T.train_name = 'Rajdhani Exp'

--List passenger names with their travel_date and status.
SELECT P.name, R.travel_date, R.status FROM Passengers P
INNER JOIN Reservations R 
ON P.passenger_id = R.passenger_id;

--Find the top 2 highest fare reservations.
SELECT TOP 2 * FROM Reservations 
ORDER BY fare DESC 

--Find the train with the lowest average fare.
SELECT T.train_name, MIN(fare) AS lowest_fare FROM Trains T
INNER JOIN Reservations R
ON T.train_id = R.train_id
GROUP BY T.train_name

--Show the train(s) where total distance travelled by all passengers > 1000 km.
SELECT T.train_id, T.train_name, SUM(T.distance_km) AS total_distance_travelled FROM Trains T
INNER JOIN Reservations R 
ON T.train_id = R.train_id
GROUP BY T.train_id, T.train_name
HAVING SUM(T.distance_km) > 1000

--Find passengers whose reservation status is "Waiting".
SELECT P.passenger_id, P.name, R.res_id, R.status FROM Passengers P
INNER JOIN Reservations R 
ON P.passenger_id = R.passenger_id
WHERE R.status = 'Waiting'

--Show the passenger(s) who paid the maximum fare overall.
SELECT P.name, MAX(R.fare) AS Maximum_fare FROM Passengers P
INNER JOIN Reservations R
ON P.passenger_id = R.passenger_ID
GROUP BY P.name

--Show all passengers whose age is between 20 and 40.
SELECT * FROM Passengers
WHERE age BETWEEN 20 AND 40

--Find trains that start from Kolkata or Chennai.
SELECT T.train_name, P.city FROM Trains T
INNER JOIN Reservations R
ON T.train_id = R.train_id
INNER JOIN Passengers P
ON R.passenger_ID = P.passenger_id
WHERE P.city IN ('Kolkata','Chennai')

--Show all reservations made after 2025-09-05.
SELECT * FROM Reservations
WHERE travel_date > '2025-09-05'

--Display passengers whose name starts with 'A'.
SELECT * FROM Passengers
WHERE name LIKE 'A%'

--List passengers whose city is NOT Delhi.
SELECT * FROM Passengers
WHERE city <> 'Delhi'

--Show the 3 youngest passengers.
SELECT TOP 3 * FROM Passengers
ORDER BY age

--show the 2 longest-distance trains.
SELECT TOP 2 * FROM Trains 
ORDER BY distance_km DESC

--Display the 5 most expensive reservations (highest fare).
SELECT TOP 5 * FROM Reservations 
ORDER BY fare DESC

--List trains in alphabetical order of train_name.
SELECT * FROM Trains 
ORDER BY train_name ASC

--Show passengers sorted by age (youngest first).
SELECT * FROM Passengers 
ORDER BY age ASC

--Find the average fare of all reservations.
SELECT AVG(fare) AS avg_fare FROM Reservations

--Count the total number of male passengers.
SELECT COUNT(*) AS total_male FROM Passengers 
WHERE gender = 'M'

--Show the maximum distance among all trains.
SELECT MAX(distance_km) AS max_distance FROM Trains

-- Find the total number of Sleeper class reservations.
SELECT COUNT(*) AS sleeper_count FROM Reservations 
WHERE class = 'Sleeper'

-- Find the total fare paid by passengers from Mumbai.
SELECT SUM(r.fare) AS total_fare_mumbai
FROM Reservations r
JOIN Passengers p ON r.passenger_id = p.passenger_id
WHERE p.city = 'Mumbai'

-- Count the number of reservations per status (Confirmed/Waiting/Cancelled).
SELECT status, COUNT(*) AS total_reservations FROM Reservations
GROUP BY status

-- Find the total number of passengers per gender.
SELECT gender, COUNT(*) AS total_passengers FROM Passengers
GROUP BY gender

-- Show the average fare for each class.
SELECT class, AVG(fare) AS avg_fare FROM Reservations
GROUP BY class

-- Display the number of trains starting from each source city.
SELECT source, COUNT(*) AS total_trains FROM Trains
GROUP BY source

-- Show total reservations grouped by travel_date.
SELECT travel_date, COUNT(*) AS total_reservations FROM Reservations
GROUP BY travel_date

-- Show passenger name, city, and train_name they booked.
SELECT P.name, P.city, T.train_name FROM Passengers P
JOIN Reservations R 
ON p.passenger_id = R.passenger_id
JOIN Trains T
ON R.train_id = T.train_id

-- List all reservations with passenger name and status.
SELECT R.res_id, P.name, R.status FROM Reservations R
JOIN Passengers P 
ON R.passenger_id = P.passenger_id

-- Show train_name and number of confirmed passengers on it.
SELECT T.train_name, COUNT(R.res_id) AS confirmed_passengers FROM Trains T
JOIN Reservations R ON T.train_id = R.train_id
WHERE R.status = 'Confirmed'
GROUP BY T.train_name

-- Display all passengers with train_name (if booked, else show NULL).
SELECT P.name, T.train_name FROM Passengers P
LEFT JOIN Reservations R 
ON P.passenger_id = R.passenger_id
LEFT JOIN Trains T
ON R.train_id = T.train_id

-- Find which passengers booked Garib Rath train.
SELECT DISTINCT P.* FROM Passengers P
JOIN Reservations R 
ON P.passenger_id = R.passenger_id
JOIN Trains T ON R.train_id = T.train_id
WHERE T.train_name = 'Garib Rath'

-- Show train_id and total fare collected, but only where fare > 1000.
SELECT train_id, SUM(fare) AS total_fare FROM Reservations
GROUP BY train_id
HAVING SUM(fare) > 1000

-- List source cities that have more than 1 train.
SELECT source, COUNT(*) AS total_trains FROM Trains
GROUP BY source
HAVING COUNT(*) > 1

-- Find passengers grouped by city where count > 1.
SELECT city, COUNT(*) AS total_passengers FROM Passengers
GROUP BY city
HAVING COUNT(*) > 1

-- Show classes that earned more than 2000 fare in total.
SELECT class, SUM(fare) AS total_fare FROM Reservations
GROUP BY class
HAVING SUM(fare) > 2000

-- List trains that have at least 2 passengers booked.
SELECT train_id, COUNT(*) AS total_passengers FROM Reservations
GROUP BY train_id
HAVING COUNT(*) >= 2

-- Find the passenger(s) with the highest age.
SELECT * FROM Passengers
WHERE age = (SELECT MAX(age) FROM Passengers)

-- Show the train(s) with the shortest distance.
SELECT * FROM Trains
WHERE distance_km = (SELECT MIN(distance_km) FROM Trains)

-- Find the reservation(s) with the lowest fare.
SELECT * FROM Reservations
WHERE fare = (SELECT MIN(fare) FROM Reservations)

-- List passengers who paid above the average fare.
SELECT P.name, AVG(R.fare) FROM Reservations R
INNER JOIN Passengers P
ON R.passenger_ID = P.passenger_id
GROUP BY P.name
HAVING AVG(R.fare) > R.fare

-- Find trains whose distance is above the average train distance.
SELECT * FROM Trains
WHERE distance_km > (SELECT AVG(distance_km) FROM Trains)

-- Show all reservations in September 2025.
SELECT * FROM Reservations
WHERE travel_date >= '2025-09-01' AND travel_date <= '2025-09-30'

-- Find the earliest travel_date booked.
SELECT MIN(travel_date) AS earliest_travel_date FROM Reservations

-- Find the latest travel_date booked.
SELECT MAX(travel_date) AS latest_travel_date FROM Reservations

-- Count how many reservations are made per day.
SELECT travel_date, COUNT(*) AS total_reservations FROM Reservations
GROUP BY travel_date
ORDER BY travel_date

-- List passengers who booked tickets on the same date.
SELECT r.travel_date, p.name FROM Reservations r
JOIN Passengers p ON r.passenger_id = p.passenger_id
WHERE r.travel_date IN (
    SELECT travel_date FROM Reservations GROUP BY travel_date HAVING COUNT(*) > 1
)
ORDER BY r.travel_date

-- Show passenger name, train_name, and distance travelled.
SELECT p.name, t.train_name, t.distance_km AS distance_travelled FROM Passengers p
JOIN Reservations r 
ON p.passenger_id = r.passenger_id
JOIN Trains t 
ON r.train_id = t.train_id

-- Find the city that contributed the highest number of passengers.
SELECT TOP 1 city, COUNT(*) AS total_passengers FROM Passengers
GROUP BY city
ORDER BY total_passengers DESC

-- Display each train and its average fare (confirmed only).
SELECT train_id, AVG(fare) AS avg_fare_confirmed FROM Reservations
WHERE status = 'Confirmed'
GROUP BY train_id

-- Show passengers who booked tickets in more than one class.
SELECT passenger_id, COUNT(DISTINCT class) AS distinct_classes FROM Reservations
GROUP BY passenger_id
HAVING COUNT(DISTINCT class) > 1

-- Find train_name with maximum number of reservations.
SELECT TOP 1 t.train_name, COUNT(r.res_id) AS total_reservations FROM Trains t
JOIN Reservations r 
ON t.train_id = r.train_id
GROUP BY t.train_name
ORDER BY total_reservations DESC