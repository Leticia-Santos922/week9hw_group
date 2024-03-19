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
