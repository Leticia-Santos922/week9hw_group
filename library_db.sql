create database library_db;

use library_db;

-- create addresses table first. users contains reference to addresses table with foreign key so has to go after
-- foreign key can only reference a table that already exists in the database
create table address
(
address_id INT AUTO_INCREMENT PRIMARY KEY, 
house_number VARCHAR(50) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
postcode VARCHAR(50) NOT NULL,
county VARCHAR(50) NOT NULL
);

create table user
(
-- column name, datatype (size), optional extra rules
user_id INT AUTO_INCREMENT PRIMARY KEY,
address_id INT, FOREIGN KEY (address_id) references address(address_id),
firstname VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
-- use varchar to store phone numbers, if store as INT then first 0 is removed. Can also use + for international if varchar
phone_number VARCHAR(20) NOT NULL
);

-- do we need to use timestamp? If you specify just date then HH:MM:SS is set to 00:00:00
-- if left blank then it will fill in the date and time of insertion  
-- we are backdating and I have added random times, not sure if this is correct? 
CREATE TABLE staff
(
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, FOREIGN KEY (user_id) REFERENCES user(user_id),
    -- data type is timestamp,  
    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- role is a reserved word so have to enclose in backticks or rename in order to use safely 
    `role` VARCHAR(50)
);

CREATE TABLE `member`
(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, FOREIGN KEY (user_id) REFERENCES user(user_id),
    -- sets is_active to true by default
    is_active BOOLEAN DEFAULT TRUE,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- need to insert addresses first due to foreign key constraint! 
-- FK in users table requires address id to already exist in address
INSERT INTO address (address_id, house_number, street, city, postcode, county)
VALUES 
(1, '20', 'Aldwick Bay Estate', 'Bognor Regis', 'P021 4ES', 'West Sussex'),
(2, '18', 'Woodland Vale Road', 'Horsham', 'RH13 6LU', 'West Sussex'),
(3, '90', 'Abbey Road', 'Bognor Regis', 'PO21 1AA', 'West Sussex'),
(4, '33', 'Gresham Road', 'Littlehampton', 'RH13 2BB', 'West Sussex'),
(5, '78', 'Conrad Road', 'Shoreham-by-Sea', 'BN11 3CC', 'West Sussex'),
(6, '42', 'Celia Street', 'Horsham', 'GU14 4DD', 'West Sussex'),
(7, '68', 'German Street', 'Haywards Heath', 'KT17 5EE', 'West Sussex'),
(8, '638', 'Vernard Road', 'Burgess Hill', 'TN22 6FF', 'West Sussex'),
(9, '910', 'Cesar Street', 'Chichester', 'WA14 7GG', 'West Sussex'),
(10, '46', 'French Court', 'Hurstpierpoint', 'IP23 8HH', 'West Sussex'),
(11, '31', 'Abbey Estate', 'Southwick', 'WR15 9II', 'West Sussex'),
(12, '17', 'Ebby Street', 'Selsey', 'E11 1JJ', 'West Sussex'),
(13, '56', 'Harrington Street', 'Westergate', 'HU12 2KK', 'West Sussex'),
(14, '756', 'Belgrave Court', 'Chichester', 'LS13 3LL', 'West Sussex'),
(15, '67', 'Ransod Street', 'Hurstpierpoint', 'DE14 4MM', 'West Sussex'),
(16, '12', 'Camilla Road', 'Southwick', 'FY15 5NN', 'West Sussex');

SELECT * FROM address;

INSERT INTO user (address_id, firstname, surname, email, phone_number)
VALUES 
(1, 'Robert', 'Smith', 'bob.smith@gmail.com', '07498671752'),
(2, 'Simon', 'Gallup', 'simon.gallup@hotmail.com', '07373321759'),
(1, 'Mary', 'Smith', 'mary.smith@gmail.com', '07498671752'),
(3, 'Rebecca', 'Brown', 'rebeccabrown_201@outlook.com', '07263881751'),
(3, 'Katy', 'Brown', 'katyb@outlook.com', '07367358926'),
(3, 'David', 'Brown', 'david.brown@yahoo.co.uk', '07456378752'),
(3, 'Natalia', 'Brown', 'natbrown1@yahoo.co.uk', '07463673812'),
(4, 'Claudia', 'Garcia', 'clayagari@outlook.com', '07429490283'),
(5, 'Sara', 'Stewart', 'sarastew01@yahoo.co.uk', '07327477920'),
(6, 'Tiffany', 'Johnson', 'tiffanyjohns88@gmail.com', '07492446222'),
(7, 'Angela', 'Edwards', 'angedwards_1@outlook.com', '07498671752'),
(8, 'Freddie', 'Dulaney', 'fred_dd01@gmail.com', '07373382259'),
(9, 'Paul', 'Metcaff', 'paul02metcaff@hotmail.com', '07498232736'),
(10, 'Pablo', 'Rodriguez', 'pabrodlo.34@gmail.com', '07493739302'),
(11, 'Nancy', 'Lyons', 'nancy.lyons@outlook.com', '07372382181'),
(12, 'Francisco', 'Alessio', 'fransico_alesso03@yahoo.co.uk', '07492157392'),
(13, 'Raphael', 'de los Reyes', 'fransico_alesso03@yahoo.co.uk', '07492157392'),
(14, 'Anthony', 'Granedo', 'antgren_26@gmail.com', '07373334222'),
(15, 'Veronica', 'Gil', 'verogil_1@hotmail.com', '07437134252'),
(16, 'Angelo', 'Black', 'angelo.black@gmail.com', '07498246399');

SELECT * FROM user;

-- testing multiple occupants at one address 
SELECT * FROM user WHERE address_id = 1;

SELECT * FROM user WHERE address_id = 3;

-- manually added the time as backdated
-- not including hire_date and not inputting date/time information should automatically add the date/time information as of record insertion
INSERT INTO staff (user_id, hire_date, `role`)
VALUES 
(15, '2024-02-27 08:00:09', 'Chief Librarian'),
(16, '2019-05-14 09:35:43', 'Librarian'),
(17, '2017-02-01 08:39:13', 'Librarian'),
(18, '2016-08-23 09:35:43', 'Library Assistant'),
(19, '2024-03-01 10:13:16', 'Library Assistant'),
(20, '2020-12-01 08:35:27', 'Library Technician');

SELECT * FROM staff;

-- only included date so time will be set to 00:00:00
-- no need to specify is_active as the boolean value is true for the following users 
INSERT INTO `member` (user_id, date_joined)
VALUES 
(1, '2024-02-27'),
(2,'2019-05-14'),
(3,'2017-02-01'),
(4, '2016-08-23'),
(5, '2024-03-01'),
(6, '2020-10-08'),
(8, '2024-02-27'),
(9, '2019-04-05'),
(11, '2019-03-08'),
(12, '2017-03-31'),
(14, '2024-01-10');

-- only included date so time will be set to 00:00:00
-- include is_active as defining as False 
INSERT INTO `member` (user_id, is_active, date_joined)
VALUES 
(7, FALSE, '2019-05-14'),
(10, FALSE, '2024-02-27'),
(13, FALSE, '2016-06-08');

SELECT * FROM `member` WHERE is_active = FALSE;


