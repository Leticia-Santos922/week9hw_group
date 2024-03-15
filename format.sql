use library_db;

-- enum ensures that only these specified datatypes (hardback, paperback etc.) are stored in the Format_name field 
create table Format_book (
Format_ID int auto_increment primary key, 
Format_name enum("Hardback", "Paperback", "E-Book", "Audiobook") NOT NULL
);

insert into Format_book(Format_name)
values 
('Paperback'), 
('E-Book'), 
('Audiobook'),
('Hardback');


select * 
from Format_book;