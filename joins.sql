USE library_db;

SELECT 	person_id, 
		firstname, 
        surname,
        concat(firstname, " ", surname) AS "fullname",
        email,
        RIGHT(phone_number, 4) AS last_four_digits
FROM person;

SELECT 	address_ID,
		house_number,
		street,
        city
FROM address;

-- get info for table, concatentations, rename columns
-- create a third select query to join them together
-- only join related tables
-- JOIN...
SELECT 	person_ID, 
		firstname, 
        surname,
        concat(firstname, " ", surname) as "fullname",
        email,
        RIGHT(phone_number, 4) AS last_four_digits,
        -- error unless add address. first. Use address as every address is unique in this table
        address.address_ID,
        house_number as "house",
		street,
        city
        -- inner join (default), so could just use join below
FROM person INNER JOIN address
ON person.address_ID = address.address_ID;


-- create a view
-- saved select query
-- hide boring columns from people
-- hide sensitive columns eg telephone number (could show last four digits though)
-- use view to show non-sensitive columns
-- save query as view
CREATE VIEW vPeople_and_Addresses 
AS
SELECT 	person_ID, 
-- 		firstname, 
--         surname,
        concat(firstname, " ", surname) as "fullname",
        email,
        RIGHT(phone_number, 4) AS last_four_digits,
        -- error unless add address. first. Use address as every address is unique in this table
        address.address_ID,
        house_number as "house",
		street,
        city
        -- inner join (default), so could just use join below
FROM person INNER JOIN address
ON person.address_ID = address.address_ID
ORDER BY person_ID;

-- returns the name, street, city and phone_number of all users in Bognor Regis 
-- only last four digits of phone number showing for security
SELECT fullname, house, street, city, last_four_digits
FROM vPeople_and_Addresses
WHERE city LIKE "Bognor%";

-- returns the name, city and email of all users with a gmail account
SELECT fullname, city, email
FROM vPeople_and_Addresses
WHERE email LIKE "%gmail%";





