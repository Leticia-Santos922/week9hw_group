use library_db;

-- SELECT statement
-- testing multiple occupants at one address 
-- returns 2 users, Robert and Mary Smith
SELECT * FROM person WHERE address_id = 1;

-- use count to return the number of users with an address_id of 3
-- returns 4
SELECT count(*) AS 'Members at Address'
FROM person
WHERE address_id = 3;

-- returns 4 users, Rebecca, Katy, David and Natalia Brown
SELECT * FROM person WHERE address_id = 3;

-- INSERT statement
-- adding another user to an existing address
INSERT INTO person (address_id, firstname, surname, email, phone_number)
VALUES 
(16, 'Maria', 'Black', 'maria.black@gmail.com', '07498584832');

-- returns 2 users, Angelo and Maria Black
SELECT * FROM person WHERE address_id = 16;


SELECT * FROM category WHERE category_type = 'Science Fiction';

SELECT * FROM author WHERE surname = 'Tolkien';

-- use the wildcard character (%) with LIKE for pattern matching
-- % represents zero or more characters in a string for flexible searching
SELECT * FROM book WHERE title LIKE '%Harry Potter%';

-- returns two results; Gone Girl and The Girl on the Train
SELECT * FROM book WHERE title LIKE '%Girl%';

-- returns all results where book title begins with 'The'
-- note removal of % at beginning
SELECT * FROM book WHERE title LIKE 'The%';

-- UPDATE statement
-- changes email from bob.smith@gmail.com to robertsmith@hotmail.com
UPDATE person SET email = 'robertsmith@hotmail.com' WHERE person_ID = 1;




