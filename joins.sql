USE library_db;

SELECT 	Person_ID, 
		Firstname, 
        Surname,
        concat(Firstname, " ", Surname) AS "Fullname",
        Email,
        RIGHT(phone_number, 4) AS last_four_digits
FROM Person;

SELECT 	Address_ID,
		House_number,
		Street,
        City
FROM Address;

-- get info for table, concatentations, rename columns
-- create a third select query to join them together
-- only join related tables
-- JOIN...
SELECT 	Person_ID, 
		Firstname, 
        Surname,
        concat(Firstname, " ", Surname) as "Fullname",
        Email,
        RIGHT(Phone_number, 4) AS Last_four_digits,
        -- error unless add address. first. Use address as every address is unique in this table
        Address.Address_ID,
        House_number as "House",
		Street,
        City
        -- inner join (default), so could just use join below
FROM Person INNER JOIN Address
ON Person.Address_ID = Address.Address_ID;


-- create a view
-- saved select query
-- hide boring columns from people
-- hide sensitive columns eg telephone number (could show last four digits though)
-- use view to show non-sensitive columns
-- save query as view
CREATE VIEW vPeople_and_Addresses 
AS
SELECT 	Person_ID, 
-- 		   firstname, 
--         surname,
        concat(Firstname, " ", Surname) as "Fullname",
        Email,
        RIGHT(Phone_number, 4) AS Last_four_digits,
        -- error unless add address. first. Use address as every address is unique in this table
        Address.Address_ID,
        House_number as "House",
		Street,
        City
        -- inner join (default), so could just use join below
FROM Person INNER JOIN Address
ON Person.address_ID = Address.Address_ID
ORDER BY Person_ID;

-- returns the name, street, city and phone_number of all users in Bognor Regis 
-- only last four digits of phone number showing for security
SELECT Fullname, House, Street, City, Last_four_digits
FROM vPeople_and_Addresses
WHERE City LIKE "Bognor%";

-- returns the name, city and email of all users with a gmail account
SELECT Fullname, City, Email
FROM vPeople_and_Addresses
WHERE Email LIKE "%gmail%";





