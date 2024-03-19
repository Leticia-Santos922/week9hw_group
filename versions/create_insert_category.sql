use library_db;

create table Category (
    Category_ID varchar(12) primary key,
    Category_Type varchar(50)
);

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