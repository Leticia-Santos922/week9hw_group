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

create table person
(
-- column name, datatype (size), optional extra rules
person_id INT AUTO_INCREMENT PRIMARY KEY,
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
    person_id INT, FOREIGN KEY (person_id) REFERENCES person(person_id),
    hire_date DATE DEFAULT (CURDATE()),
    job_title VARCHAR(50)
);


CREATE TABLE library_member
(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT, FOREIGN KEY (person_id) REFERENCES person(person_id),
    -- sets is_active to true by default
    is_active BOOLEAN DEFAULT TRUE,
    date_joined DATE DEFAULT (CURDATE())
);

create table Category (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Type varchar(50)
);

create table Author (
    Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Firstname varchar(50),
    Surname varchar(50)
);

create table Publication (
    Publication_ID INT AUTO_INCREMENT PRIMARY KEY,
    Publisher varchar(50),
    Year_Published int
);

-- FORMAT_BOOK, AVAILABILITY AND BOOK TABLE 

-- enum ensures that only these specified datatypes (hardback, paperback etc.) are stored in the Format_name field 
create table Format_book (
Format_ID int auto_increment primary key, 
Format_name enum("Hardback", "Paperback", "E-Book", "Audiobook") NOT NULL
);

ALTER TABLE Format_book
  MODIFY COLUMN format_name ENUM('Hardback', 'Paperback', 'E-Book', 'Audiobook', 'Braille') not null;


create table Availability (
Availability_ID int auto_increment primary key,
Availability_Status enum('Available', 'Reserved', 'Out_on_loan', 'To_recycle') NOT NULL
);

create table Book(
Book_ID int auto_increment primary key, 
Title varchar(50) NOT NULL,
USBN varchar(50) NOT NULL, 
Publication_ID INT NOT NULL, 
Availability_ID int NOT NULL,
foreign key (Publication_ID) references Publication (Publication_ID),
foreign key (Availability_ID) references Availability (Availability_ID)
);

create table loan
(loan_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT, FOREIGN KEY (book_id) REFERENCES book(book_id),
checkout_date DATE DEFAULT (CURDATE()),
due_date DATE DEFAULT (CURDATE()),
return_date DATE DEFAULT (CURDATE()),
is_overdue BOOLEAN DEFAULT False,
fines_accrued_GBP DECIMAL(10,2),
member_id INT, FOREIGN KEY (member_id) REFERENCES library_member(member_id),
staff_id INT, FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

create table reservation
(reservation_id INT AUTO_INCREMENT PRIMARY KEY,
reservation_date DATE DEFAULT (CURDATE()),
is_available BOOLEAN DEFAULT True,
member_id INT, FOREIGN KEY (member_id) REFERENCES library_member(member_id),
staff_id INT, FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
book_id INT, FOREIGN KEY (book_id) REFERENCES book(book_id),
waitlist_position int
);


-- Following tables contains only foreign keys
create table Book_Format
(Format_ID INT, FOREIGN KEY (Format_ID) REFERENCES Format_book(Format_ID),
Book_ID INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

create table Book_Author
(Author_ID INT, FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
Book_ID INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

create table Book_Category
(Category_ID INT, FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
Book_ID INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);
