use library_db;

create table Author (
    Author_ID VARCHAR(2) PRIMARY KEY,
    Firstname VARCHAR(50),
    Surname VARCHAR(50)
);

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
