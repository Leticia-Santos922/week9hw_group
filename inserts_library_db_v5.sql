use library_db;

-- ADDRESS table
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


-- USER table
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


-- STAFF table
-- manually added the time as backdated
-- not including hire_date and not inputting date/time information should automatically add the date/time information as of record insertion
INSERT INTO staff (user_id, hire_date, job_title)
VALUES 
(15, '2024-02-27', 'Chief Librarian'),
(16, '2019-05-14', 'Librarian'),
(17, '2017-02-01', 'Librarian'),
(18, '2016-08-23', 'Library Assistant'),
(19, '2024-03-01', 'Library Assistant'),
(20, '2020-12-01', 'Library Technician');

SELECT * FROM staff;

-- LIBRARY_MEMBER table
-- only included date so time will be set to 00:00:00
-- no need to specify is_active as the boolean value is true for the following users 
INSERT INTO library_member (user_id, date_joined)
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
INSERT INTO library_member (user_id, is_active, date_joined)
VALUES 
(7, FALSE, '2019-05-14'),
(10, FALSE, '2024-02-27'),
(13, FALSE, '2016-06-08');

SELECT * FROM library_member WHERE is_active = FALSE;



-- PUBLICATION table
insert into  Publication (Publication_ID, Publisher, Year_Published)
values
('01', 'Scribner', 1925),
('02', 'J. B. Lippincott & Co.', 1960),
('03', 'Crown Publishing Group', 2012),
('04', 'Doubleday', 2003),
('05', 'T. Egerton, Whitehall', 1813),
('06', 'Delacorte Press', 1991),
('07', 'Chilton Books', 1965),
('08', 'Secker & Warburg', 1949),
('09', 'Bloomsbury Publishing', 1997),
('10', 'Allen & Unwin', 1937),
('11', 'Riverhead Books', 2015),
('12', 'Celadon Books', 2019),
('13', 'Simon & Schuster', 2011),
('14', 'Crown Publishing', 2018),
('15', 'Harper', 2011),
('16', 'Harper', 1980),
('17', 'HarperOne', 2016),
('18', 'Running Press', 2013),
('19', 'Viking', 2006),
('20', 'Knopf', 2012);

select * from publication;


-- AUTHOR table
insert into Author (Author_ID, Firstname, Surname)
values 
('01', 'F. Scott', 'Fitzgerald'),
('02', 'Harper', 'Lee'),
('03', 'Gillian', 'Flynn'),
('04', 'Dan', 'Brown'),
('05', 'Jane', 'Austen'),
('06', 'Diana', 'Gabaldon'),
('07', 'Frank', 'Herbert'),
('08', 'George', 'Orwell'),
('09', 'J.K.', 'Rowling'),
('10', 'J.R.R.', 'Tolkien'),
('11', 'Paula', 'Hawkins'),
('12', 'Alex', 'Michaelides'),
('13', 'Walter', 'Isaacson'),
('14', 'Michelle', 'Obama'),
('15', 'Yuval Noah', 'Harari'),
('16', 'Howard', 'Zinn'),
('17', 'Mark', 'Manson'),
('18', 'Jen', 'Sincero'),
('19', 'Elizabeth', 'Gilbert'),
('20', 'Cheryl', 'Strayed');

select * from Author;



-- Category table
insert into Category (Category_ID, Category_Type)
values
('01', 'Fiction'),
('02', 'Mystery'),
('03', 'Romance'),
('04', 'Science Fiction'),
('05', 'Fantasy'),
('06', 'Thriller'),
('07', 'Biography'),
('08', 'History'),
('09', 'Self-Help'),
('10', 'Travel');

select * from Category;

-- FORMAT_BOOK Table 

insert into Format_book(Format_name)
values 
('Paperback'), 
('E-Book'), 
('Audiobook'),
('Hardback'),
('Braille');

insert into Format_book(Format_name)
value
('Braille');

delete from Format_book
where Format_ID in (2,3);

select * from Format_book;


-- AVAILABILITY TABLE 

insert into Availability(Availability_Status)
values 
('Available'), 
('Reserved'), 
('Out_on_loan'),
('To_recycle');

select * from Availability;

-- BOOK TABLE WITH FOREIGN KEYS 
-- does not need ID as it is automatically incremented 
-- some with double quotes as they have a single quote in the name  
insert Book(Title, USBN, Publication_ID, Availability_ID) 
values 
('The Great Gatsby', '456', '01', 1),
('To Kill a Mockingbird', '789', '02', 1),
('Gone Girl', '234', '03', 2),
('The Da Vinci Code', '567', '04', 2),
('Pride and Prejudice',	'890', '05', 1), 
('Outlander', '345', '06', 1),
('Dune', '678', '07', 1),
('1984', '901', '08', 2),
("Harry Potter and the Sorcerer's Stone", '234', '09', 1), 
('The Hobbit', '567', '10', 3),
('The Girl on the Train', '890', '11', 1),
('The Silent Patient', '345', '12', 3),
('Steve Jobs', '678', '13', 2),
('Becoming', '901', '14', 1),
('Sapiens: A Brief History of Humankind', '123', '15', 1),
("A People's History of the United States",	'456', '16', 1),
('The Subtle Art of Not Giving a F*ck', '789', '17', 4),
('You Are a Badass', '234', '18', 1),
('Eat, Pray, Love',	'567', '19', 1),
('Wild', '143', '20', 1);

select * from Book;

insert into loan (book_id, checkout_date, due_date, return_date, is_overdue, fines_accrued_GBP, member_id, staff_id)
values
(01, '2024-03-08', '2024-03-15', '2024-03-15', FALSE, NULL, 01, 01),
(02, '2023-10-18', '2023-11-08', '2023-10-26', FALSE,	NULL, 02, 02),
(03, '2023-11-10', '2023-12-01', '2023-11-27', FALSE, NULL, 03, 03),
(04, '2023-12-01', '2023-12-22', '2023-12-15', FALSE, NULL, 04, 04),
(05, '2023-10-27', '2023-11-17', '2023-11-06', FALSE, NULL, 05, 05),
(06, '2023-11-06', '2023-11-27', '2023-11-27', FALSE, NULL, 06, 01),
(07, '2023-12-27', '2024-01-17', '2024-01-05', TRUE, 15.00, 07, 02),
(08, '2024-01-15', '2024-02-05', '2024-02-05', FALSE, NULL, 08, 03),
(09, '2024-01-15', '2024-02-05', '2024-01-30', FALSE, NULL, 09, 04),
(10, '2024-12-06', '2024-01-02', '2024-03-02', FALSE, 5.00, 10, 05),
(11, '2024-02-18', '2024-03-10', '2024-03-01', FALSE, NULL, 11, 01),
(12, '2024-03-05', '2024-03-26', '2024-03-18', FALSE, NULL, 12, 02),
(13, '2024-03-13', '2024-04-03', NULL, TRUE, 80.00, 13, 03),
(14, '2024-03-13', '2024-04-04', NULL, FALSE, NULL, 14, 04);

SELECT * FROM loan;

insert into reservation (reservation_date, is_available, member_id, staff_id, book_id, waitlist_position)
values
('2024-10-24', FALSE, 01, 01, 07, 01),
('2023-11-09', TRUE, 01, 02, 03, 01),
('2023-12-29', FALSE, 03, 05, 07, 03),
('2024-01-10', FALSE, 05, 03, 07, 02),
('2024-02-13', FALSE, 03, 03, 13, 01),
('2024-02-13', TRUE, 06, 03, 07, 01),
('2024-01-17', TRUE, 07, 06, 08, 01);

SELECT * 
FROM reservation;


-- foreign keys table

insert into Book_Format (Book_ID, Format_ID)
values
(01, 10), 
(02, 10), 
(03, 10), 
(04, 10), 
(05, 10), 
(06, 10), 
(07, 10), 
(08, 10), 
(09, 10), 
(10, 10), 
(11, 10), 
(12, 10), 
(13, 10), 
(14, 10), 
(15, 10), 
(16, 10), 
(17, 10), 
(18, 10), 
(19, 10), 
(20, 10),
(01, 11), 
(02, 11), 
(03, 11), 
(04, 11), 
(05, 11), 
(06, 11), 
(07, 11), 
(08, 11), 
(09, 11), 
(10, 11), 
(11, 11), 
(12, 11), 
(13, 11), 
(14, 11), 
(15, 11), 
(16, 11), 
(17, 11), 
(18, 11), 
(19, 11), 
(20, 11),
(01, 12), 
(02, 12), 
(03, 12), 
(04, 12), 
(05, 12), 
(06, 12), 
(07, 12), 
(08, 12), 
(09, 12), 
(10, 12), 
(11, 12), 
(12, 12), 
(13, 12), 
(14, 12), 
(15, 12), 
(16, 12), 
(17, 12), 
(18, 12), 
(19, 12), 
(20, 12),
(01, 13), 
(02, 13), 
(03, 13), 
(04, 13), 
(05, 13), 
(06, 13), 
(07, 13), 
(08, 13), 
(09, 13), 
(10, 13), 
(11, 13), 
(12, 13), 
(13, 14), 
(14, 14), 
(15, 14), 
(16, 14), 
(17, 14), 
(18, 14), 
(19, 14), 
(20, 14);

SELECT * 
FROM Book_Format;

insert into Book_Author (Author_ID, Book_ID)
values
(01, 01), 
(02, 02), 
(03, 03), 
(04, 04), 
(05, 05), 
(06, 06), 
(07, 07), 
(08, 08), 
(09, 09), 
(10, 10), 
(11, 11), 
(12, 12), 
(13, 13), 
(14, 14), 
(15, 15), 
(16, 16), 
(17, 17), 
(18, 18), 
(19, 19), 
(20, 20),
(02, 01), 
(03, 02), 
(04, 03), 
(05, 04), 
(06, 05), 
(07, 06), 
(08, 07), 
(09, 08), 
(10, 09), 
(11, 10), 
(12, 11), 
(13, 12), 
(12, 13), 
(11, 14), 
(109, 15), 
(08, 16), 
(07, 17), 
(06, 18), 
(05, 19), 
(04, 20);

SELECT * 
FROM Book_Author;

insert into Book_Category (Category_ID_ID, Book_ID)
values
(2, 01), 
(1, 02), 
(2, 03), 
(2, 04), 
(3, 05), 
(5, 06), 
(5, 07), 
(6, 08), 
(5, 09), 
(5, 10), 
(2, 11), 
(4, 12), 
(9, 13), 
(9, 14), 
(8, 15), 
(8, 16), 
(9, 17), 
(9, 18), 
(1, 19), 
(1, 20),
(3, 01), 
(2, 02), 
(5, 03), 
(5, 04), 
(7, 05), 
(8, 06), 
(1, 07), 
(5, 08), 
(6, 09), 
(9, 10), 
(10, 11), 
(10, 12), 
(4, 13), 
(6, 14), 
(3, 15), 
(2, 16), 
(8, 17), 
(8, 18), 
(10, 19), 
(4, 20);

SELECT * 
FROM Book_Category;
