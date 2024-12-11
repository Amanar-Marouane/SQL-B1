DROP DATABASE if EXISTS fitnessmanagement;

CREATE DATABASE fitnessmanagement;
USE fitnessmanagement;

CREATE TABLE members(
member_id INT(11) AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('Male', 'Female', 'Other'),
date_of_birth DATE NOT NULL,
phone_number VARCHAR(15) NOT NULL,
email VARCHAR(100)
);

CREATE TABLE rooms(
room_id INT(11) PRIMARY KEY AUTO_INCREMENT,
room_number VARCHAR(10),
room_type ENUM('Cardio', 'Weights', 'Studio'),
capacity INT(11)
);

CREATE TABLE departments(
department_id INT(11) PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(50),
location VARCHAR(100)
);

CREATE TABLE trainers(
trainer_id INT(11) PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
specialization VARCHAR(50),
department_id INT(11),
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE memberships(
membership_id INT(11) AUTO_INCREMENT PRIMARY KEY,
member_id INT(11),
FOREIGN KEY (member_id) REFERENCES members(member_id),
room_id INT(11),
FOREIGN KEY (room_id) REFERENCES rooms(room_id),
start_date DATE
);

CREATE TABLE appointments(
appointment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
appointment_date DATE,
appointment_time TIME,
trainer_id INT(11),
FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
member_id INT(11),
FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE workout_plans(
plan_id INT(11) PRIMARY KEY AUTO_INCREMENT ,
member_id INT(11),
FOREIGN KEY (member_id) REFERENCES members(member_id),
trainer_id INT(11),
FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
instructions VARCHAR(255)
);


-- Insert data into members
INSERT INTO members (first_name, last_name, gender, date_of_birth, phone_number, email) VALUES
('Alex', 'Johnson', 'Male', '1990-07-15', '1234567890', 'alexjohnson@gmail.com'),
('Emily', 'Smith', 'Female', '2002-03-12', '1234509876', 'emilysmith@gmail.com'),
('John', 'Doe', 'Male', '1995-05-01', '1243567890', NULL),
('Anna', 'Taylor', 'Female', '1985-11-24', '1223467890', 'annataylor@gmail.com'),
('Chris', 'Brown', 'Male', '2005-08-18', '1342567890', 'chrisbrown@gmail.com'),
('Sarah', 'Connor', 'Female', '1997-06-09', '1244567890', 'sarahconnor@gmail.com'),
('Mike', 'Tyson', 'Male', '1982-03-30', '1238767890', 'miketyson@gmail.com'),
('Sophia', 'Lee', 'Female', '2010-04-12', '1290567890', NULL),
('Adam', 'Wilson', 'Male', '1993-09-13', '1222567890', 'adamwilson@gmail.com'),
('Mia', 'Davis', 'Female', '2000-10-27', '1211567890', 'miadavis@gmail.com');

-- Insert data into rooms
INSERT INTO rooms (room_number, room_type, capacity) VALUES
('101', 'Cardio', 20),
('102', 'Weights', 15),
('103', 'Studio', 30),
('104', 'Weights', 25),
('105', 'Cardio', 18),
('106', 'Studio', 22),
('107', 'Weights', 20),
('108', 'Cardio', 19),
('109', 'Studio', 25),
('110', 'Weights', 24);

-- Insert data into departments
INSERT INTO departments (department_name, location) VALUES
('Musculation', 'Building A'),
('Cardio', 'Building B'),
('Yoga', 'Building C'),
('Zumba', 'Building D'),
('Aerobics', 'Building E'),
('Swimming', 'Building F'),
('Martial Arts', 'Building G'),
('Cycling', 'Building H'),
('Dancing', 'Building I'),
('Pilates', 'Building J');

-- Insert data into trainers
INSERT INTO trainers (first_name, last_name, specialization) VALUES
('Laura', 'Miller', 'Cardio'),
('Tom', 'Johnson', 'Musculation'),
('John', 'Doe', 'Dancing'),
('Jake', 'Smith', 'Yoga'),
('Chris', 'Davis', 'Aerobics'),
('Sophia', 'Williams', 'Swimming'),
('Nina', 'Brown', 'Zumba'),
('Mike', 'Johnson', 'Martial Arts'),
('Anna', 'Taylor', 'Cycling'),
('Emily', 'Watson', 'Pilates');

UPDATE trainers
SET department_id = (
    SELECT department_id
    FROM departments
    WHERE departments.department_name = trainers.specialization
);

-- Insert data into memberships
INSERT INTO memberships (member_id, room_id, start_date) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-02-01'),
(3, 3, '2024-03-10'),
(4, 4, '2024-04-18'),
(5, 5, '2024-05-23'),
(6, 6, '2024-06-30'),
(7, 7, '2024-07-11'),
(8, 8, '2024-08-15'),
(9, 9, '2024-09-20'),
(10, 10, '2024-10-05');

-- Insert data into appointments
INSERT INTO appointments (appointment_date, appointment_time, trainer_id, member_id) VALUES
('2024-01-15', '10:00:00', 1, 1),
('2024-02-10', '11:00:00', 2, 2),
('2024-03-20', '09:30:00', 3, 3),
('2024-04-25', '14:00:00', 4, 4),
('2024-05-05', '16:00:00', 5, 5),
('2024-06-15', '08:00:00', 6, 6),
('2024-07-22', '13:00:00', 7, 7),
('2024-08-18', '17:30:00', 8, 8),
('2024-09-12', '15:45:00', 9, 9),
('2024-10-10', '12:15:00', 10, 10);

-- Insert data into workout_plans
INSERT INTO workout_plans (member_id, trainer_id, instructions) VALUES
(1, 1, 'Focus on strength training, 3 sets of 10 reps.'),
(2, 2, 'High-intensity cardio for 30 minutes.'),
(3, 3, 'Daily yoga stretches for flexibility.'),
(4, 4, 'Zumba dance workouts for 45 minutes.'),
(5, 5, 'Core strengthening exercises.'),
(6, 6, 'Swimming drills, 20 laps.'),
(7, 7, 'Martial arts sparring sessions.'),
(8, 8, 'Cycling intervals for endurance.'),
(9, 9, 'Dance choreography routines.'),
(10, 10, 'Pilates stretches for posture improvement.');


-- question01
INSERT INTO members (first_name, last_name, gender, date_of_birth, phone_number)
VALUES ("Alex", "Jonhson", 1, "1990-07-15", "0123456789");


-- question02
SELECT department_name, location FROM departments;


-- question03
SELECT * FROM members ORDER BY date_of_birth;


-- question04
SELECT DISTINCT gender FROM members;


-- question05
SELECT * FROM trainers
LIMIT 3;


-- question06
SELECT * FROM members
WHERE date_of_birth < 20000000;


-- question07
SELECT trainers.first_name, trainers.last_name, departments.department_name
FROM trainers 
JOIN departments
ON trainers.department_id = departments.department_id 
WHERE department_name IN ("Musculation","Cardio");


-- question08
SELECT * FROM memberships
WHERE start_date BETWEEN 20241201 AND 20241207;


-- question09
ALTER TABLE members
ADD age_category ENUM("Junior", "Adulte", "Senior");
UPDATE members
SET age_category =
CASE
	WHEN TIMESTAMPDIFF(YEAR, members.date_of_birth, CURDATE()) < 18 THEN 1
	WHEN TIMESTAMPDIFF(YEAR, members.date_of_birth, CURDATE()) between 18 AND 30 THEN 2
	ELSE 3
END;


-- question10
select COUNT(*) FROM appointments;


-- question11
SELECT COUNT(trainers.department_id),departments.department_name
FROM trainers
JOIN departments
WHERE trainers.department_id = departments.department_id
GROUP BY departments.department_name;


-- question12
SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS 'avg_age' FROM members;


-- question13
SELECT MAX(CONCAT(appointment_date,' ', appointment_time)) AS 'last_appointment' FROM appointments LIMIT 1;

-- question14 !!!!!
SELECT rooms.room_type, SUM(rooms.room_id) AS total_sub
FROM rooms
JOIN memberships ON memberships.room_id = rooms.room_id
GROUP BY room_type;

-- question15
SELECT * FROM members
where email is NULL;

-- question16
select CONCAT(appointment_date, ' ', appointment_time),
CONCAT(members.first_name, ' ', members.last_name) as 'member_full_name',
CONCAT(trainers.first_name, ' ', trainers.last_name) as 'trainer_full_name'
from appointments
join trainers on trainers.trainer_id = appointments.trainer_id
join members on members.member_id = appointments.member_id;

-- question17
DELETE FROM appointments
where appointment_date < 20240000;

-- question18
UPDATE departments
set department_name = "Force et Conditionnement" where departments.department_name = "Musculation";

-- question19
select gender
from members
GROUP BY gender
HAVING COUNT(gender) >= 2;

-- question20
CREATE VIEW actif_sub AS
SELECT *
from memberships
where TIMESTAMPDIFF(MONTH, start_date, CURDATE()) < 1;
SELECT *
FROM actif_sub;
------------------------------------------
-- Bonus01
SELECT CONCAT(members.first_name, ' ', members.last_name) as member_full_name,
CONCAT(trainers.first_name, ' ', trainers.last_name) as trainer_full_name
from workout_plans
JOIN trainers
on trainers.trainer_id = workout_plans.trainer_id
join members
on members.member_id = workout_plans.member_id;

-- Bonus02
select CONCAT(appointments.appointment_date, ' ', appointments.appointment_time),
departments.department_name
from trainers
join appointments
on appointments.trainer_id = trainers.trainer_id
JOIN departments
on departments.department_id = trainers.department_id;

-- Bonus03
CREATE TABLE supp (
    trainer_id int,
    Foreign Key (trainer_id) REFERENCES trainers(trainer_id),
    supp_roc VARCHAR(100)
);
INSERT INTO supp (trainer_id, supp_roc) VALUES
(1, 'Protein Powder'),
(2, 'Multivitamins'),
(3, 'BCAA (Branched-Chain Amino Acids)'),
(4, 'Pre-Workout Supplement'),
(5, 'Fish Oil Capsules'),
(6, 'Vitamin D3'),
(7, 'Creatine Monohydrate'),
(8, 'Electrolyte Drink'),
(9, 'Collagen Peptides'),
(10, 'Glucosamine & Chondroitin');
select * from supp;

-- Bonus4
SELECT memberships.membership_id,
memberships.member_id,
memberships.room_id,
rooms.room_type
from memberships
JOIN rooms
ON rooms.room_id = memberships.room_id;
------------------------------------------
SELECT * FROM members;
SELECT * FROM rooms;
SELECT * FROM memberships;
SELECT * FROM departments;
SELECT * FROM trainers;
SELECT * FROM appointments;
SELECT * FROM workout_plans;