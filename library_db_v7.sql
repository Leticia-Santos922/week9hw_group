CREATE DATABASE library_db;

USE library_db;

-- create addresses table first. users contains reference to addresses table with foreign key so has to go after
-- foreign key can only reference a table that already exists in the database
CREATE TABLE address
(
address_id INT AUTO_INCREMENT PRIMARY KEY, 
house_number VARCHAR(50) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
postcode VARCHAR(50) NOT NULL,
county VARCHAR(50) NOT NULL
);

CREATE TABLE person
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
    hire_date DATE DEFAULT (CURDATE()) NOT NULL,
    job_title VARCHAR(50) NOT NULL
);


CREATE TABLE library_member
(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT, FOREIGN KEY (person_id) REFERENCES person(person_id),
    -- sets is_active to true by default
    is_active BOOLEAN DEFAULT TRUE,
    date_joined DATE DEFAULT (CURDATE()) NOT NULL
);

CREATE TABLE Category (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Type VARCHAR(50) NOT NULL
);

CREATE TABLE Author (
    Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Firstname VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL
);

CREATE TABLE Publication (
    Publication_ID INT AUTO_INCREMENT PRIMARY KEY,
    Publisher VARCHAR(50) NOT NULL,
    Year_Published INT NOT NULL
);

-- FORMAT_BOOK, AVAILABILITY AND BOOK TABLE 

-- enum ensures that only these specified datatypes (hardback, paperback etc.) are stored in the Format_name field 
CREATE TABLE Format_book (
Format_ID INT AUTO_INCREMENT PRIMARY KEY, 
Format_name ENUM("Hardback", "Paperback", "E-Book", "Audiobook") NOT NULL
);

ALTER TABLE Format_book
  MODIFY COLUMN format_name ENUM('Hardback', 'Paperback', 'E-Book', 'Audiobook', 'Braille') NOT NULL;


CREATE TABLE Availability (
Availability_ID INT AUTO_INCREMENT PRIMARY KEY,
Availability_Status ENUM('Available', 'Reserved', 'Out_on_loan', 'To_recycle') NOT NULL
);

CREATE TABLE Book(
Book_ID int auto_increment primary key, 
Title varchar(50) NOT NULL,
USBN varchar(50) NOT NULL, 
Publication_ID INT NOT NULL, 
Availability_ID INT NOT NULL,
foreign key (Publication_ID) references Publication (Publication_ID),
foreign key (Availability_ID) references Availability (Availability_ID)
);

CREATE TABLE loan
(loan_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT, FOREIGN KEY (book_id) REFERENCES book(book_id),
checkout_date DATE DEFAULT (CURDATE()) NOT NULL,
due_date DATE DEFAULT (CURDATE()) NOT NULL,
return_date DATE DEFAULT (CURDATE()),
is_overdue BOOLEAN DEFAULT False,
fines_accrued_GBP DECIMAL(10,2),
member_id INT, FOREIGN KEY (member_id) REFERENCES library_member(member_id),
staff_id INT, FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE reservation
(reservation_id INT AUTO_INCREMENT PRIMARY KEY,
reservation_date DATE DEFAULT (CURDATE()),
is_available BOOLEAN DEFAULT True,
member_id INT, FOREIGN KEY (member_id) REFERENCES library_member(member_id),
staff_id INT, FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
book_id INT, FOREIGN KEY (book_id) REFERENCES book(book_id),
waitlist_position int
);


-- Following tables contains only foreign keys
CREATE TABLE Book_Format
(Format_ID INT, FOREIGN KEY (Format_ID) REFERENCES Format_book(Format_ID),
Book_ID INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE Book_Author
(Author_ID INT, FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
Book_ID INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE Book_Category
(Category_ID INT, FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
Book_ID INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);
