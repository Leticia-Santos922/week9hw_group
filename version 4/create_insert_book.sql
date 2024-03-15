use library_db; 

create table Book(
Book_ID int auto_increment primary key, 
Title varchar(50) NOT NULL,
USBN varchar(50) NOT NULL, 
Publication_ID varchar(12) NOT NULL, 
Availability_ID int NOT NULL,
foreign key (Publication_ID) references Publication (Publication_ID),
foreign key (Availability_ID) references Availability (Availability_ID)
);

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