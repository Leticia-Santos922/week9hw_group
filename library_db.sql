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
    hire_date DATE DEFAULT (CURDATE()),
    job_title VARCHAR(50)
);


CREATE TABLE library_member
(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, FOREIGN KEY (user_id) REFERENCES user(user_id),
    -- sets is_active to true by default
    is_active BOOLEAN DEFAULT TRUE,
    date_joined DATE DEFAULT (CURDATE())
);

SELECT * 
FROM address;

SELECT * 
FROM user;

SELECT * 
FROM staff;

SELECT * 
FROM library_member