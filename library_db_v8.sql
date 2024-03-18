CREATE DATABASE Library_DB;

USE Library_DB;

-- create addresses table first. users contains reference to addresses table with foreign key so has to go after
-- foreign key can only reference a table that already exists in the database
CREATE TABLE Address
(
Address_ID INT AUTO_INCREMENT PRIMARY KEY, 
House_number VARCHAR(50) NOT NULL,
Street VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
Postcode VARCHAR(50) NOT NULL,
County VARCHAR(50) NOT NULL
);

CREATE TABLE Person
(
-- column name, datatype (size), optional extra rules
Person_ID INT AUTO_INCREMENT PRIMARY KEY,
Address_ID INT, FOREIGN KEY (Address_ID) references Address(Address_ID),
Firstname VARCHAR(50) NOT NULL,
Surname VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
-- use varchar to store phone numbers, if store as INT then first 0 is removed. Can also use + for international if varchar
Phone_number VARCHAR(20) NOT NULL
);

-- do we need to use timestamp? If you specify just date then HH:MM:SS is set to 00:00:00
-- if left blank then it will fill in the date and time of insertion  
-- we are backdating and I have added random times, not sure if this is correct? 
CREATE TABLE Staff
(
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    Person_id INT, FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    Hire_date DATE DEFAULT (CURDATE()) NOT NULL,
    Job_title VARCHAR(50) NOT NULL
);


CREATE TABLE Library_Member
(
    Member_ID INT AUTO_INCREMENT PRIMARY KEY,
    Person_id INT, FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
    -- sets is_active to true by default
    Is_active BOOLEAN DEFAULT TRUE,
    Date_joined DATE DEFAULT (CURDATE()) NOT NULL
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
CREATE TABLE Format_Book (
Format_ID INT AUTO_INCREMENT PRIMARY KEY, 
Format_name ENUM("Hardback", "Paperback", "E-Book", "Audiobook") NOT NULL
);

ALTER TABLE Format_Book
  MODIFY COLUMN Format_Name ENUM('Hardback', 'Paperback', 'E-Book', 'Audiobook', 'Braille') NOT NULL;


CREATE TABLE Availability (
Availability_ID INT AUTO_INCREMENT PRIMARY KEY,
Availability_Status ENUM('Available', 'Reserved', 'Out_on_loan', 'To_recycle') NOT NULL
);

CREATE TABLE Book(
Book_ID INT AUTO_INCREMENT PRIMARY KEY, 
Title VARCHAR(50) NOT NULL,
USBN VARCHAR(50) NOT NULL, 
Publication_ID INT NOT NULL, 
Availability_ID INT NOT NULL,
FOREIGN KEY (Publication_ID) REFERENCES Publication (Publication_ID),
FOREIGN KEY (Availability_ID) REFERENCES Availability (Availability_ID)
);

CREATE TABLE Loan
(Loan_ID INT AUTO_INCREMENT PRIMARY KEY,
Book_ID INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
Checkout_date DATE DEFAULT (CURDATE()) NOT NULL,
Due_date DATE DEFAULT (CURDATE()) NOT NULL,
Return_date DATE DEFAULT (CURDATE()),
Is_overdue BOOLEAN DEFAULT False,
Fines_accrued_GBP DECIMAL(10,2),
Member_ID INT, FOREIGN KEY (Member_ID) REFERENCES Library_member(Member_ID),
Staff_ID INT, FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Reservation
(Reservation_ID INT AUTO_INCREMENT PRIMARY KEY,
Reservation_date DATE DEFAULT (CURDATE()),
Is_available BOOLEAN DEFAULT True,
Member_id INT, FOREIGN KEY (Member_ID) REFERENCES Library_member(Member_ID),
Staff_id INT, FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
Book_id INT, FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
Waitlist_position INT
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
