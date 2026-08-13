CREATE DATABASE Airline_Flight_Managemen_System;

USE Airline_Flight_Managemen_System;

CREATE TABLE airports
(
	airport_id INT PRIMARY KEY IDENTITY(1,1),
	airport_name VARCHAR(150) NOT NULL UNIQUE,
	airport_code CHAR(3) NOT NULL UNIQUE,
	city VARCHAR(100) NOT NULL,
	country VARCHAR(100) NOT NULL,
	timezone VARCHAR(50) NOT NULL
);
CREATE TABLE airlines
(
	airline_id INT PRIMARY KEY IDENTITY(1,1),
	airline_name VARCHAR(100) NOT NULL UNIQUE,
	iata_code CHAR(2) NOT NULL UNIQUE,
	country VARCHAR(100) NOT NULL,
	contact_email VARCHAR(100) NOT NULL,
	status VARCHAR(20) CHECK(status IN ('Active','Suspended'))
);
CREATE TABLE aircrafts
(
	aircraft_id INT PRIMARY KEY IDENTITY(1,1),
	aircraft_code VARCHAR(20) NOT NULL UNIQUE,
	model VARCHAR(100) NOT NULL,
	airline_id INT REFERENCES airlines,
	total_seats INT NOT NULL,
	manufactur_year INT NOT NULL CHECK(manufactur_year > 1950)
);
CREATE TABLE flights
(
	flight_id INT PRIMARY KEY IDENTITY(1,1),
	flight_number VARCHAR(10) NOT NULL UNIQUE,
	airline_id INT REFERENCES airlines,
	aircraft_id INT REFERENCES aircrafts,
	origin_id INT REFERENCES airports,
	destination_id INT REFERENCES airports,
	departure_time DATETIME NOT NULL,
	arrival_time DATETIME NOT NULL,
	fare DECIMAL(8,2) NOT NULL,
	status VARCHAR(20) CHECK(status IN ('Scheduled','Delayed','Cancelled','Completed'))
);



INSERT INTO airports VALUES
('Indira Gandhi International Airport',    'DEL', 'New Delhi',    'India',          'Asia/Kolkata'),
('Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'Mumbai', 'India',    'Asia/Kolkata'),
('Kempegowda International Airport',       'BLR', 'Bangalore',    'India',          'Asia/Kolkata'),
('Chennai International Airport',          'MAA', 'Chennai',      'India',          'Asia/Kolkata'),
('Netaji Subhas Chandra Bose International Airport', 'CCU', 'Kolkata', 'India',     'Asia/Kolkata'),
('Rajiv Gandhi International Airport',     'HYD', 'Hyderabad',    'India',          'Asia/Kolkata'),
('Sardar Vallabhbhai Patel International Airport', 'AMD', 'Ahmedabad', 'India',     'Asia/Kolkata'),
('Dubai International Airport',            'DXB', 'Dubai',        'UAE',            'Asia/Dubai'),
('Heathrow Airport',                       'LHR', 'London',       'United Kingdom', 'Europe/London'),
('John F. Kennedy International Airport',  'JFK', 'New York',     'USA',            'America/New_York'),
( 'Singapore Changi Airport',               'SIN', 'Singapore',    'Singapore',      'Asia/Singapore'),
('Sydney Kingsford Smith Airport',         'SYD', 'Sydney',       'Australia',      'Australia/Sydney'),
('Frankfurt Airport',                      'FRA', 'Frankfurt',    'Germany',        'Europe/Berlin'),
('Bangkok Suvarnabhumi Airport',           'BKK', 'Bangkok',      'Thailand',       'Asia/Bangkok'),
('Kuala Lumpur International Airport',     'KUL', 'Kuala Lumpur', 'Malaysia',       'Asia/Kuala_Lumpur');

INSERT INTO airlines VALUES
('Air India',           'AI', 'India',          'support@airindia.in',       'Active'),
('IndiGo',              '6E', 'India',          'care@goindigo.in',          'Active'),
('SpiceJet',            'SG', 'India',          'support@spicejet.com',      'Active'),
('Vistara',             'UK', 'India',          'customercare@airvistara.com','Active'),
('Emirates',            'EK', 'UAE',            'support@emirates.com',      'Active'),
( 'British Airways',     'BA', 'United Kingdom', 'help@britishairways.com',   'Active'),
('Singapore Airlines',  'SQ', 'Singapore',      'customercare@singaporeair.com','Active'),
('AirAsia',             'AK', 'Malaysia',       'support@airasia.com',       'Suspended');

INSERT INTO aircrafts VALUES
('VT-PPB', 'Boeing 787-8 Dreamliner',  1, 256, 2015),
('VT-IGL', 'Airbus A320neo',            2, 186, 2018),
('VT-IGM', 'Airbus A320neo',            2, 186, 2019),
('VT-SGF', 'Boeing 737-800',            3, 189, 2016),
('VT-SGG', 'Boeing 737-800',            3, 189, 2017),
('VT-TTB', 'Airbus A320',               4, 158, 2020),
('VT-TTC', 'Boeing 787-9 Dreamliner',   4, 268, 2021),
('A6-ENA', 'Boeing 777-300ER',          5, 354, 2014),
('A6-ENB', 'Airbus A380-800',           5, 489, 2013),
('G-XWBA', 'Airbus A350-1000',          6, 331, 2019),
('9V-SKA', 'Boeing 777-300ER',          7, 299, 2016),
('9M-AQA', 'Airbus A320',               8, 180, 2017);

INSERT INTO flights VALUES
( 'AI-101',  1, 1,  1,  2,  '2024-03-01 06:00:00', '2024-03-01 08:10:00',  4500.00,  'Completed'),
('AI-202',  1, 1,  2,  9,  '2024-03-02 22:00:00', '2024-03-03 04:30:00', 32000.00,  'Completed'),
('6E-301',  2, 2,  1,  3,  '2024-03-03 07:30:00', '2024-03-03 09:45:00',  3200.00,  'Completed'),
('6E-402',  2, 3,  3,  6,  '2024-03-04 11:00:00', '2024-03-04 12:30:00',  2800.00,  'Completed'),
('SG-501',  3, 4,  1,  4,  '2024-03-05 08:00:00', '2024-03-05 10:15:00',  3500.00,  'Completed'),
('SG-602',  3, 5,  4,  7,  '2024-03-06 14:00:00', '2024-03-06 15:45:00',  2600.00,  'Delayed'),
('UK-701',  4, 6,  1,  5,  '2024-03-07 09:30:00', '2024-03-07 13:00:00',  5200.00,  'Scheduled'),
('UK-802',  4, 7,  2,  8,  '2024-03-08 18:00:00', '2024-03-08 21:30:00', 18000.00,  'Scheduled'),
('EK-901',  5, 8,  8, 10,  '2024-03-09 02:00:00', '2024-03-09 14:00:00', 55000.00,  'Completed'),
('EK-1002', 5, 9,  8,  9,  '2024-03-10 08:30:00', '2024-03-10 13:00:00', 42000.00,  'Completed'),
('BA-201',  6, 10, 9,  1,  '2024-03-11 10:00:00', '2024-03-11 23:30:00', 48000.00,  'Completed'),
('BA-302',  6, 10, 9, 13,  '2024-03-12 12:00:00', '2024-03-12 14:30:00', 22000.00,  'Cancelled'),
('SQ-401',  7, 11, 11,  1, '2024-03-13 00:30:00', '2024-03-13 05:00:00', 36000.00,  'Completed'),
('SQ-502',  7, 11, 11, 12, '2024-03-14 09:00:00', '2024-03-14 18:30:00', 41000.00,  'Scheduled'),
('AI-303',  1, 1,  2,  4,  '2024-03-15 07:00:00', '2024-03-15 09:30:00',  3800.00,  'Completed'),
('6E-503',  2, 2,  1,  2,  '2024-03-16 06:30:00', '2024-03-16 08:40:00',  3100.00,  'Scheduled'),
('SG-703',  3, 4,  4,  1,  '2024-03-17 16:00:00', '2024-03-17 18:15:00',  3300.00,  'Delayed'),
('UK-903',  4, 6,  1,  3,  '2024-03-18 13:00:00', '2024-03-18 15:10:00',  4100.00,  'Scheduled'),
('EK-1103', 5, 8,  8, 14,  '2024-03-19 03:00:00', '2024-03-19 07:30:00', 28000.00,  'Completed'),
('AK-101',  8, 12, 15, 11,  '2024-03-20 10:00:00', '2024-03-20 12:00:00',  8500.00,  'Cancelled');

INSERT INTO passengers VALUES
('Aarav Sharma',      'aarav.sharma@gmail.com',      '9876543210', 'P1234567', 'Indian',      '1990-04-15'),
( 'Priya Mehta',       'priya.mehta@yahoo.com',       '9823456781', 'P2345678', 'Indian',      '1992-07-22'),
('Rahul Verma',       'rahul.verma@outlook.com',     '9712345682', 'P3456789', 'Indian',      '1988-11-05'),
('Sneha Patel',       'sneha.patel@gmail.com',       '9634567893', 'P4567890', 'Indian',      '1995-02-18'),
('Vikram Singh',      'vikram.singh@hotmail.com',    '9545678904', 'P5678901', 'Indian',      '1985-09-30'),
('Ananya Iyer',       'ananya.iyer@gmail.com',       '9456789015', 'P6789012', 'Indian',      '1998-06-12'),
('Karan Kapoor',      'karan.kapoor@gmail.com',      '9367890126', 'P7890123', 'Indian',      '1993-03-25'),
('Divya Nair',        'divya.nair@rediffmail.com',   '9278901237', 'P8901234', 'Indian',      '1991-12-08'),
('Mohammed Al Farsi', 'mohammed.alfarsi@email.ae',   '0551234568', 'UAE123456','Emirati',     '1987-08-14'),
('Sarah Johnson',     'sarah.j@gmail.com',           '07911123459','GB123456', 'British',     '1989-05-20'),
('Liu Wei',           'liu.wei@163.com',             '13812345670','CN123456', 'Chinese',     '1994-01-17'),
('Emily Watson',      'emily.watson@yahoo.com',      '21298765431','US123456', 'American',    '1996-10-03'),
('Rohan Desai',       'rohan.desai@gmail.com',       '9189012342', 'P9012345', 'Indian',      '1990-07-29'),
('Meera Krishnan',    'meera.k@gmail.com',           '9090123453', 'P0123456', 'Indian',      '1997-04-11'),
('Arjun Reddy',       'arjun.reddy@gmail.com',       '9901234564', 'P1122334', 'Indian',      '1986-02-28'),
('Fatima Sheikh',     'fatima.sheikh@email.ae',      '0559876545', 'UAE654321','Emirati',     '1993-09-19'),
('James Miller',      'james.miller@gmail.com',      '07922334456','GB654321', 'British',     '1984-12-31'),
('Nisha Agarwal',     'nisha.agarwal@gmail.com',     '9812345677', 'P2233445', 'Indian',      '1999-08-05'),
('Chen Jing',         'chen.jing@qq.com',            '13987654328','CN654321', 'Chinese',     '1991-03-16'),
('Siddharth Joshi',   'siddharth.j@gmail.com',       '9723456789', 'P3344556', 'Indian',      '1988-06-22');

INSERT INTO bookings VALUES
( 1,  1,  '2024-02-15', '12A', 'Economy',  4500.00,  'Confirmed'),
(2,  1,  '2024-02-16', '14B', 'Economy',  4500.00,  'Confirmed'),
(3,  2,  '2024-02-10', '3A',  'Business', 64000.00, 'Confirmed'),
(4,  3,  '2024-02-20', '22C', 'Economy',  3200.00,  'Confirmed'),
(5,  4,  '2024-02-22', '8D',  'Economy',  2800.00,  'Confirmed'),
(6,  5,  '2024-02-25', '18E', 'Economy',  3500.00,  'Confirmed'),
(7,  6,  '2024-02-26', '5A',  'Business', 7800.00,  'Confirmed'),
( 8,  7,  '2024-02-28', '11B', 'Economy',  5200.00,  'Pending'),
(9,  9,  '2024-02-05', '2A',  'First',    110000.00,'Confirmed'),
(10, 10, '2024-02-08', '1B',  'First',    84000.00, 'Confirmed'),
(11, 13, '2024-02-12', '20C', 'Economy',  36000.00, 'Confirmed'),
(12, 11, '2024-02-14', '4A',  'Business', 96000.00, 'Confirmed'),
(13, 15, '2024-03-01', '9C',  'Economy',  3800.00,  'Confirmed'),
(14, 3,  '2024-02-21', '25D', 'Economy',  3200.00,  'Confirmed'),
(15, 4,  '2024-02-23', '7E',  'Business', 8400.00,  'Confirmed'),
(16, 8,  '2024-02-27', '6B',  'Business', 36000.00, 'Pending'),
(17, 10, '2024-02-09', '10A', 'Economy',  42000.00, 'Confirmed'),
(18, 16, '2024-03-05', '30F', 'Economy',  3100.00,  'Confirmed'),
(19, 14, '2024-03-02', '15C', 'Economy',  41000.00, 'Pending'),
(20, 7,  '2024-02-28', '2B',  'Business', 15600.00, 'Confirmed'),
(1,  15, '2024-03-03', '19A', 'Economy',  3800.00,  'Confirmed'),
(2,  5,  '2024-02-24', '13B', 'Economy',  3500.00,  'Cancelled'),
(3,  9,  '2024-02-06', '1A',  'First',    110000.00,'Confirmed'),
(5,  11, '2024-02-13', '22D', 'Economy',  48000.00, 'Confirmed'),
(6,  19, '2024-03-08', '17E', 'Economy',  28000.00, 'Confirmed'),
(7,  13, '2024-02-11', '5C',  'Business', 72000.00, 'Confirmed'),
(8,  16, '2024-03-06', '28F', 'Economy',  3100.00,  'Cancelled'),
(10, 2,  '2024-02-11', '6A',  'Economy',  32000.00, 'Confirmed'),
(13, 17, '2024-03-10', '14D', 'Economy',  3300.00,  'Pending'),
(15, 19, '2024-03-09', '3B',  'Business', 56000.00, 'Confirmed');

--Q1. Write a CREATE TABLE statement for the passengers table with all constraints as defined in the schema.
CREATE TABLE passengers
(
	passanger_id INT PRIMARY KEY IDENTITY(1,1),
	full_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	phone VARCHAR(12) UNIQUE CHECK(phone NOT LIKE '%[^0-9]%'),
	airport_no VARCHAR(20) UNIQUE,
	nationality VARCHAR(50) NOT NULL,
	dob DATE NOT NULL
);

--Q2. Write a CREATE TABLE statement for the bookings table. Include all FOREIGN KEY references and CHECK constraints on seat_class and booking_status.
CREATE TABLE bookings
(
	booking_id INT PRIMARY KEY IDENTITY(1,1),
	passenger_id INT REFERENCES passengers,
	flight_id INT REFERENCES flights,
	booking_date DATE DEFAULT GETDATE(),
	seat_number VARCHAR(5) NOT NULL,
	seat_class VARCHAR(20) CHECK(seat_class IN ('Economy','Business','First')),
	amount_paid DECIMAL(8,2) NOT NULL,
	booking_status VARCHAR(20) CHECK(booking_status IN('Confirmed','Cancelled','Pending'))
);

--Q3. Insert 3 records into the airports table with realistic values for airport_name, airport_code, city, country, and timezone.
INSERT INTO airports VALUES
('Indira Gandhi International Airport','DEL', 'New Delhi','India','Asia/Kolkata'),
('Chhatrapati Shivaji Maharaj International Airport','BOM','Mumbai','India','Asia/Kolkata'),
('Kempegowda International Airport','BLR','Bangalore','India','Asia/Kolkata');

--Q4. Insert 2 records into the flights table. Set the status of one flight as &#39;Delayed&#39; and the other as &#39;Scheduled&#39;.
INSERT INTO flights VALUES
('SG-602',  3, 5,  4,  7,  '2024-03-06 14:00:00', '2024-03-06 15:45:00',  2600.00,  'Delayed'),
('SG-703',  3, 4,  4,  1,  '2024-03-17 16:00:00', '2024-03-17 18:15:00',  3300.00,  'Scheduled');

--Q5. Write an UPDATE query to change the status of all flights operated by airline_id = 3 from &#39;Scheduled&#39; to &#39;Cancelled&#39;.
UPDATE flights
SET status = 'Cancelled'
WHERE airline_id = 3 AND status = 'Scheduled';

--Q6. Delete all booking records where booking_status = &#39;Cancelled&#39; and booking_date is older than &#39;2023-06-01&#39;.
DELETE FROM bookings
WHERE booking_status = 'Cancelled' AND booking_date < '2023-06-01';

--Q7. Add a CHECK constraint on the fare column of the flights table to ensure fare is always greater than 0.
ALTER TABLE flights
ADD CONSTRAINT chk_fare CHECK(fare > 0);

--Q8. Add a UNIQUE constraint on the passport_no column of the passengers table using ALTER TABLE.
ALTER TABLE passengers
ADD CONSTRAINT _passport_unique UNIQUE(passport_no);

ALTER TABLE passengers
ADD passport_no VARCHAR(20)

DELETE FROM passengers 
WHERE passport_no IS NULL;

SELECT passanger_id, passport_no 
FROM passengers 
WHERE passport_no IS NULL;

--Q9. Write a query that attempts to insert a duplicate iata_code into the airlines table. Explain in a comment why it will be rejected.
INSERT INTO airlines VALUES
('Air India','AI', 'India','support@airindia.in','Active');
--because this duplicate value is violating Unique constraint 
--unique constraint do not allow duplicate value

--Q10. Add a NOT NULL constraint to the seat_number column in the bookings table using ALTER TABLE.
ALTER TABLE bookings
ALTER COLUMN seat_number VARCHAR(5) NOT NULL

--Q11. Set a DEFAULT value of &#39;Scheduled&#39; for the status column of the flights table using ALTER TABLE.
ALTER TABLE flights
ADD CONSTRAINT default_status DEFAULT 'Scheduled' FOR status

--Q12. Drop the existing CHECK constraint on booking_status and re-add it to also allow the value &#39;Waitlisted&#39;. 
ALTER TABLE bookings
DROP CONSTRAINT CK__bookings__bookin__7B5B524B

ALTER TABLE bookings 
ADD CONSTRAINT chk_booking_status CHECK (booking_status IN('Confirmed','Cancelled','Pending','Waitlisted'))

--INNER JOIN

--Q13. List all flights along with the name of the operating airline. Display flight_number, airline_name, departure_time, and status.
SELECT f.flight_number, a.airline_name, f.departure_time, f.status FROM airlines a
INNER JOIN flights f
ON a.airline_id = f.airline_id

--Q14. Display all bookings with passenger full names and their corresponding flight numbers. Show full_name, flight_number, seat_class, and amount_paid.
SELECT p.full_name, f.flight_number, b.seat_class, b.amount_paid FROM bookings b
INNER JOIN passengers p
ON b.passenger_id = p.passanger_id
INNER JOIN flights f
ON f.flight_id = b.flight_id

--Q15. Show each flight&#39;s origin and destination city names. Use INNER JOIN on airports twice (aliased separately for origin and destination). Display flight_number, origin_city, and destination_city.
SELECT a1.airport_name AS origin, a2.airport_name AS destination FROM flights f
INNER JOIN airports a1
ON f.origin_id = a1.airport_id
INNER JOIN airports a2
ON f.destination_id = a2.airport_id

--Q16. List all passengers who have made at least one booking, along with the flight they booked and the fare paid. Show full_name, flight_number, and amount_paid.
SELECT p.full_name,f.flight_number, b.amount_paid FROM passengers p
INNER JOIN bookings b
ON p.passanger_id = b.passenger_id
INNER JOIN flights f
ON f.flight_id = b.flight_id

--Q17. Display aircraft details for every scheduled flight. Show flight_number, model, total_seats, and departure_time.
SELECT f.flight_number, ac.model, ac.total_seats, f.departure_time FROM aircrafts ac
INNER JOIN flights f
ON ac.aircraft_id = f.aircraft_id

--Q18. Join airlines and aircrafts to list each aircraft along with its airline name, aircraft model, and manufacture year.
SELECT al.airline_name, ac.model, ac.manufactur_year FROM airlines al
INNER JOIN aircrafts ac
ON al.airline_id = ac.airline_id

--Q19. Find all passengers who have NOT made any booking yet. Use LEFT JOIN between passengers and bookings. Display full_name and email.
SELECT p.full_name, p.email FROM passengers p
LEFT JOIN bookings b
ON p.passanger_id = b.passenger_id
WHERE b.passenger_id IS NULL

--Q20. List all flights along with their total booking count, including flights with zero bookings. Use LEFT JOIN and GROUP BY.
SELECT f.flight_number, COUNT(b.booking_id) AS total_booking FROM flights f
LEFT JOIN bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_number

--Q21. Find all airlines that currently have NO aircrafts registered under them. Use LEFT JOIN between airlines and aircrafts.
SELECT al.airline_name, ac.model FROM airlines al
LEFT JOIN aircrafts ac
ON al.airline_id = ac.airline_id
WHERE ac.airline_id IS NULL

--Q22. Display all airports along with the number of flights departing from each airport. Include airports with no departing flights. Use LEFT JOIN.
SELECT * FROM airports a
LEFT JOIN flights f
ON a.airport_id = f.origin_id

--Q23. List all aircrafts with their assigned flights. Include aircrafts that have not been assigned to any flight yet. Use LEFT JOIN.
SELECT * FROM aircrafts a
LEFT JOIN flights f
ON a.airline_id = f.airline_id

--Q24. Using RIGHT JOIN, display all flights with their booking records, showing flights that have no bookings on the right side.
SELECT * FROM bookings b
RIGHT JOIN flights f
ON b.flight_id = f.flight_id

--Q25. Write a query joining passengers, bookings, and flights to display: full_name, flight_number, seat_class, departure_time, and booking_status.
SELECT p.full_name, b.seat_class, f.departure_time, b.booking_status FROM passengers p
INNER JOIN bookings b
ON p.passanger_id = b.passenger_id
INNER JOIN flights f
ON b.flight_id = f.flight_id

--Q26. Show complete flight route details for each booking: full_name, flight_number, origin city, destination city, and amount_paid. Join bookings, passengers, flights, and airports (twice).
SELECT p.full_name, f.flight_number, a1.airport_id AS origin, a2.airport_id AS destination, b.amount_paid FROM flights f
INNER JOIN airports ap
ON f.origin_id = ap.airport_id
INNER JOIN bookings b
ON f.flight_id = b.flight_id
INNER JOIN airports a1
ON f.origin_id = a1.airport_id
INNER JOIN airports a2
ON f.destination_id = a2.airport_id
INNER JOIN passengers p
ON p.passanger_id = b.passenger_id

--Q27. Generate a full flight manifest: passenger full_name, passport_no, flight_number, airline_name, seat_number, seat_class, and departure_time. Use all 6 tables.
SELECT p.full_name, p.passport_no, f.flight_number, al.airline_name, b.seat_number, b.seat_class, f.departure_time FROM airlines al
INNER JOIN aircrafts ac
ON al.airline_id = ac.airline_id
INNER JOIN flights f
ON f.aircraft_id = ac.aircraft_id
INNER JOIN airports ap
ON ap.airport_id = f.origin_id
INNER JOIN bookings b
ON b.flight_id = f.flight_id
INNER JOIN passengers p
ON p.passanger_id = b.passenger_id

--Q28. List all passengers who travelled in Business or First class, along with the airline name and aircraft model of their flight.
SELECT p.full_name, b.seat_class, al.airline_name, ac.model FROM airlines al
INNER JOIN aircrafts ac
ON al.airline_id = ac.airline_id
INNER JOIN flights f
ON f.aircraft_id = ac.aircraft_id
INNER JOIN bookings b
ON b.flight_id = f.flight_id
INNER JOIN passengers p
ON p.passanger_id = b.passenger_id
WHERE b.seat_class IN ('Business','First')

--Q29. Find all flights that are &#39;Delayed&#39; and display: flight_number, airline_name, aircraft model, origin city, and destination city.
SELECT f.flight_number, al.airline_name,ac.model,ap1.city AS origin_city,ap2.city AS destination_city FROM flights f
INNER JOIN airlines al 
ON f.airline_id = al.airline_id
INNER JOIN aircrafts ac 
ON f.aircraft_id = ac.aircraft_id
INNER JOIN airports ap1 
ON f.origin_id = ap1.airport_id
INNER JOIN airports ap2 
ON f.destination_id = ap2.airport_id
WHERE f.status = 'Delayed'
ORDER BY f.flight_number;

--Q30. Find the airport from which the highest number of passenger bookings have originated. Join airports, flights, and bookings. Use GROUP BY and ORDER BY.
SELECT ap.airport_id, ap.airport_name, ap.city, ap.country, COUNT(b.booking_id) AS total_bookings FROM airports ap
INNER JOIN flights f 
ON ap.airport_id = f.origin_id
INNER JOIN bookings b 
ON f.flight_id = b.flight_id
GROUP BY ap.airport_id, ap.airport_name, ap.city, ap.country
ORDER BY total_bookings DESC;

--Q31. Find pairs of passengers who share the same nationality. Use a SELF JOIN on the passengers table. Show passenger1_name, passenger2_name, and nationality.
SELECT p1.full_name AS passenger1_name, p2.full_name AS passenger2_name, p1.nationality FROM passengers p1
INNER JOIN passengers p2 
ON p1.nationality = p2.nationality AND p1.passanger_id < p2.passanger_id
ORDER BY p1.nationality, p1.full_name;

--Q32. Find pairs of flights that share the same origin airport and the same destination airport (i.e., duplicate routes). Use SELF JOIN on the flights table. Display both flight numbers and the shared route.
SELECT f1.flight_number AS flight1_number, f2.flight_number AS flight2_number, ap1.city AS origin_city, ap2.city AS destination_city, ap1.airport_code AS origin_code, ap2.airport_code AS destination_code FROM flights f1
INNER JOIN flights f2 
ON f1.origin_id = f2.origin_id AND f1.destination_id = f2.destination_id AND f1.flight_id < f2.flight_id
INNER JOIN airports ap1 
ON f1.origin_id = ap1.airport_id
INNER JOIN airports ap2 
ON f1.destination_id = ap2.airport_id
ORDER BY ap1.airport_code, ap2.airport_code;

--Q33. Write a FULL OUTER JOIN between passengers and bookings to display all passengers (with or without bookings) and all bookings (matched or unmatched).
SELECT * FROM passengers p
FULL OUTER JOIN bookings b 
ON p.passanger_id = b.passenger_id
ORDER BY p.passanger_id, b.booking_id;

--Q34. Write a CROSS JOIN between airlines and seat classes (create a small derived table with values: &#39;Economy&#39;, &#39;Business&#39;, &#39;First&#39;) to generate all possible airline-seat class combinations.
SELECT al.airline_id, al.airline_name, al.iata_code, seat_class.seat_type FROM airlines al
CROSS JOIN (VALUES ('Economy'), ('Business'), ('First')) 
AS seat_class(seat_type)
ORDER BY al.airline_name, seat_class.seat_type;

--Q35. Count the total number of flights operated by each airline. Display airline_name and total_flights. Order by total_flights descending.
SELECT al.airline_name, COUNT(f.flight_id) AS total_flights FROM airlines al
LEFT JOIN flights f 
ON al.airline_id = f.airline_id
GROUP BY al.airline_id, al.airline_name
ORDER BY total_flights DESC;

--Q36. Find the total revenue collected per flight (sum of amount_paid from bookings). Display flight_number and total_revenue. Order by total_revenue descending.
SELECT f.flight_number, SUM(b.amount_paid) AS total_revenue FROM flights f
INNER JOIN bookings b 
ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.flight_number
ORDER BY total_revenue DESC;

--Q37. Group bookings by seat_class and count how many bookings exist in each class. Display seat_class and booking_count.
SELECT b.seat_class, COUNT(b.booking_id) AS booking_count FROM bookings b
GROUP BY b.seat_class
ORDER BY booking_count DESC;

--Q38. Find all destination airports that have received more than 10 arriving flights. Use GROUP BY on destination_id and HAVING.
SELECT ap.airport_id, ap.airport_name, ap.city, ap.country, COUNT(f.flight_id) AS arriving_flights FROM airports ap
INNER JOIN flights f 
ON ap.airport_id = f.destination_id
GROUP BY ap.airport_id, ap.airport_name, ap.city, ap.country
HAVING COUNT(f.flight_id) > 10
ORDER BY arriving_flights DESC;

--Q39. List airlines that have more than 5 aircrafts registered. Display airline_name and aircraft_count. Use GROUP BY and HAVING.
SELECT al.airline_id, al.airline_name, al.iata_code, COUNT(ac.aircraft_id) AS aircraft_count FROM airlines al
INNER JOIN aircrafts ac 
ON al.airline_id = ac.airline_id
GROUP BY al.airline_id, al.airline_name, al.iata_code
HAVING COUNT(ac.aircraft_id) > 5
ORDER BY aircraft_count DESC;

--Q40. Display the number of bookings made each month (from booking_date). Group by YEAR and MONTH and order chronologically.


--Q41. Find passengers who have made more than 3 bookings. Display full_name and total_bookings, ordered by total_bookings descending.
SELECT p.passanger_id, p.full_name, COUNT(b.booking_id) AS total_bookings FROM passengers p
INNER JOIN bookings b 
ON p.passanger_id = b.passenger_id
GROUP BY p.passanger_id, p.full_name
HAVING COUNT(b.booking_id) > 3
ORDER BY total_bookings DESC;

--Q42. Group all flights by status and count how many flights exist in each status category. Display status and flight_count.
SELECT f.status, COUNT(f.flight_id) AS flight_count FROM flights f
GROUP BY f.status
ORDER BY flight_count DESC;

--Q43. Find the average amount paid per seat_class across all bookings. Display seat_class and avg_amount. Round to 2 decimal places.
SELECT b.seat_class, ROUND(AVG(b.amount_paid), 2) AS avg_amount FROM bookings b
GROUP BY b.seat_class
ORDER BY avg_amount DESC;

--Q44. List all routes (origin to destination) and how many flights operate on each route. Display origin airport code, destination airport code, and route_count. Show only routes with more than 2 flights.
SELECT ap1.airport_code AS origin_code, ap2.airport_code AS destination_code, ap1.city AS origin_city, ap2.city AS destination_city, COUNT(f.flight_id) AS route_count FROM flights f
INNER JOIN airports ap1 
ON f.origin_id = ap1.airport_id
INNER JOIN airports ap2 
ON f.destination_id = ap2.airport_id
GROUP BY f.origin_id, f.destination_id, ap1.airport_code, ap2.airport_code, ap1.city, ap2.city
HAVING COUNT(f.flight_id) > 2
ORDER BY route_count DESC;

--Q45. Find the highest, lowest, and average fare across all flights. Use MAX, MIN, and AVG in a single query. Use meaningful column aliases.
SELECT MAX(f.fare) AS highest_fare, MIN(f.fare) AS lowest_fare, AVG(f.fare) AS average_fare, COUNT(f.flight_id) AS total_flights FROM flights f;

--Q46. Calculate the total revenue generated by each airline by joining flights, bookings, and airlines. Use SUM with GROUP BY.
SELECT al.airline_id, al.airline_name, al.iata_code, COUNT(DISTINCT f.flight_id) AS total_flights, COUNT(b.booking_id) AS total_bookings, SUM(b.amount_paid) AS total_revenue FROM airlines al
INNER JOIN flights f 
ON al.airline_id = f.airline_id
INNER JOIN bookings b 
ON f.flight_id = b.flight_id
GROUP BY al.airline_id, al.airline_name, al.iata_code
ORDER BY total_revenue DESC;

--Q47. Count the total number of confirmed bookings per passenger nationality. Join passengers and bookings. Use COUNT and GROUP BY.
SELECT p.nationality, COUNT(b.booking_id) AS confirmed_bookings, COUNT(DISTINCT b.passenger_id) AS unique_passengers FROM passengers p
INNER JOIN bookings b 
ON p.passanger_id = b.passenger_id
WHERE b.booking_status = 'Confirmed'
GROUP BY p.nationality
ORDER BY confirmed_bookings DESC;

--Q48. Find the passenger who has spent the most total amount across all their bookings. Use SUM, GROUP BY, ORDER BY, and LIMIT 1.
SELECT TOP 1 p.passanger_id, p.full_name, p.email, p.nationality, COUNT(b.booking_id) AS total_bookings, SUM(b.amount_paid) AS total_spent, ROUND(AVG(b.amount_paid), 2) AS avg_ticket_price FROM passengers p
INNER JOIN bookings b 
ON p.passanger_id = b.passenger_id
GROUP BY p.passanger_id, p.full_name, p.email, p.nationality
ORDER BY total_spent DESC;

--Q49. Find the aircraft model that has been used for the most number of flights. Use COUNT with GROUP BY and ORDER BY. Join flights and aircrafts.
SELECT TOP 1 ac.aircraft_id, ac.model, ac.aircraft_code, al.airline_name, ac.total_seats, COUNT(f.flight_id) AS flight_count FROM aircrafts ac
INNER JOIN flights f 
ON ac.aircraft_id = f.aircraft_id
INNER JOIN airlines al 
ON ac.airline_id = al.airline_id
GROUP BY ac.aircraft_id, ac.model, ac.aircraft_code, al.airline_name, ac.total_seats
ORDER BY flight_count DESC;

--Q50. Write a comprehensive summary query displaying: airline_name, total_flights, total_passengers, total_revenue, avg_fare, and max_fare. Group by airline and order by total_revenue descending.
SELECT al.airline_name, COUNT(DISTINCT f.flight_id) AS total_flights, COUNT(DISTINCT b.passenger_id) AS total_passengers, SUM(b.amount_paid) AS total_revenue, AVG(f.fare) AS avg_fare, MAX(f.fare) AS max_fare FROM airlines al
LEFT JOIN flights f 
ON al.airline_id = f.airline_id
LEFT JOIN bookings b 
ON f.flight_id = b.flight_id
GROUP BY al.airline_id, al.airline_name
ORDER BY total_revenue DESC;