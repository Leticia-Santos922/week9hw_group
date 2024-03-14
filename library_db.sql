create database library_db;

use library_db;

-- create addresses table first. users contains reference to addresses table with foreign key so has to go after
-- foreign key can only reference a table that already exists in the database
create table addresses
(
address_id int PRIMARY KEY, 
house_number VARCHAR(50) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
postcode VARCHAR(50) NOT NULL,
county VARCHAR(50) NOT NULL
);

create table users
(
-- column name, datatype (size), optional extra rules
user_id INT AUTO_INCREMENT PRIMARY KEY,
address_id INT, FOREIGN KEY (address_id) references addresses(address_id),
firstname VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
-- use varchar to store phone numbers, if store as INT then first 0 is removed. Can also use + for international if varchar
phone_number VARCHAR(20) NOT NULL
);

-- need to insert addresses first due to foreign key constraint! 
-- FK in users table requires address id to already exist in addres 
INSERT INTO addresses (address_id, house_number, street, city, postcode, county)
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

SELECT * FROM addresses;

INSERT INTO users (address_id, firstname, surname, email, phone_number)
VALUES 
(1, 'Robert', 'Smith', 'bob.smith@gmail.com', '07498671752'),
(2, 'Simon', 'Gallup', 'simon.gallup@hotmail.com', '07373321759'),
(1, 'Mary', 'Smith', 'mary.smith@gmail.com', '07498671752'),
(3, 'Claudia', 'Garcia', 'clayagari@outlook.com', '07429490283'),
(4, 'Sara', 'Stewart', 'sarastew01@yahoo.co.uk', '07327477920'),
(5, 'Tiffany', 'Johnson', 'tiffanyjohns88@gmail.com', '07492446222'),
(6, 'Angela', 'Edwards', 'angedwards_1@outlook.com', '07498671752'),
(7, 'Freddie', 'Dulaney', 'fred_dd01@gmail.com', '07373382259'),
(8, 'Paul', 'Metcaff', 'paul02metcaff@hotmail.com', '07498232736'),
(9, 'Pablo', 'Rodriguez', 'pabrodlo.34@gmail.com', '07493739302'),
(10, 'Nancy', 'Lyons', 'nancy.lyons@outlook.com', '07372382181'),
(11, 'Francisco', 'Alessio', 'fransico_alesso03@yahoo.co.uk', '07492157392'),
(12, 'Raphael', 'de los Reyes', 'fransico_alesso03@yahoo.co.uk', '07492157392'),
(13, 'Anthony', 'Granedo', 'antgren_26@gmail.com', '07373334222'),
(14, 'Veronica', 'Gil', 'verogil_1@hotmail.com', '07437134252'),
(15, 'Angelo', 'Black', 'angelo.black@gmail.com', '07498246399'),
(16, 'Rebecca', 'Brown', 'rebeccabrown_201@outlook.com', '07263881751'),
(16, 'Katy', 'Brown', 'katyb@outlook.com', '07367358926'),
(16, 'David', 'Brown', 'david.brown@yahoo.co.uk', '07456378752'),
(16, 'Natalia', 'Brown', 'natbrown1@yahoo.co.uk', '07463673812');

SELECT * FROM users;

SELECT * FROM users WHERE address_id = 16;

