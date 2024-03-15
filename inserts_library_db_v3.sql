use library_db;

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
INSERT INTO staff (user_id, hire_date, job_title)
VALUES 
(15, '2024-02-27', 'Chief Librarian'),
(16, '2019-05-14', 'Librarian'),
(17, '2017-02-01', 'Librarian'),
(18, '2016-08-23', 'Library Assistant'),
(19, '2024-03-01', 'Library Assistant'),
(20, '2020-12-01', 'Library Technician');

SELECT * FROM staff;

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
('Hardback');


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