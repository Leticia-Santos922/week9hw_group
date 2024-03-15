use library_db; 

create table Availability (
Availability_ID int auto_increment primary key,
Availability_Status enum('Available', 'Reserved', 'Out_on_loan', 'To_recycle') NOT NULL
);

insert into Availability(Availability_Status)
values 
('Available'), 
('Reserved'), 
('Out_on_loan'),
('To_recycle');

select * from Availability