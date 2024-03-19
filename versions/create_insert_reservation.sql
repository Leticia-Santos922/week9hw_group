use library_db;

create table reservation
(reservation_id INT AUTO_INCREMENT PRIMARY KEY,
reservation_date DATE DEFAULT (CURDATE()),
is_available BOOLEAN DEFAULT True,
member_id INT, FOREIGN KEY (member_id) REFERENCES library_member(member_id),
staff_id INT, FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
book_id INT, FOREIGN KEY (book_id) REFERENCES book(book_id),
waitlist_position int
);

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
FROM reservation

