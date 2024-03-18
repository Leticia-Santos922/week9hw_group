USE Library_DB;

-- SELECT statement
-- testing multiple occupants at one address 
-- returns 2 users, Robert and Mary Smith
SELECT * FROM Person WHERE Address_ID = 1;

-- use count to return the number of users with an address_id of 3
-- returns 4
SELECT count(*) AS 'Members at Address'
FROM Person
WHERE Address_ID = 3;

-- returns 4 users, Rebecca, Katy, David and Natalia Brown
SELECT * FROM Person WHERE Address_ID = 3;

-- INSERT statement
-- adding another user to an existing address
INSERT INTO Person (Address_ID, Firstname, Surname, Email, Phone_Number)
VALUES 
(16, 'Maria', 'Black', 'maria.black@gmail.com', '07498584832');

-- returns 2 users, Angelo and Maria Black
SELECT * FROM Person WHERE Address_ID = 16;


SELECT * FROM Category WHERE Category_Type = 'Science Fiction';

SELECT * FROM Author WHERE Surname = 'Tolkien';

-- use the wildcard character (%) with LIKE for pattern matching
-- % represents zero or more characters in a string for flexible searching
SELECT * FROM Book WHERE Title LIKE '%Harry Potter%';

-- returns two results; Gone Girl and The Girl on the Train
SELECT * FROM Book WHERE Title LIKE '%Girl%';

-- returns all results where book title begins with 'The'
-- note removal of % at beginning
SELECT * FROM Book WHERE Title LIKE 'The%';

-- UPDATE statement
-- changes email from bob.smith@gmail.com to robertsmith@hotmail.com
UPDATE Person SET Email = 'robertsmith@hotmail.com' WHERE Person_ID = 1;

SELECT * FROM Person WHERE Person_ID = 1;
