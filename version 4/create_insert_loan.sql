use library_db;

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

insert into loan (book_id, checkout_date, due_date, return_date, is_overdue, fines_accrued_GBP, member_id, staff_id)
values
(01, '2024-03-08', '2024-03-15', '2024-03-15', FALSE, NULL, 01, 01),
(02, '2023-10-18', '2023-11-08', '2023-10-26', FALSE,	NULL, 02, 02),
(03, '2023-11-10', '2023-12-01', '2023-11-27', FALSE, NULL, 03, 03),
(04, '2023-12-01', '2023-12-22', '2023-12-15', FALSE, NULL, 04, 04),
(05, '2023-10-27', '2023-11-17', '2023-11-06', FALSE, NULL, 05, 05),
(06, '2023-11-06', '2023-11-27', '2023-11-27', FALSE, NULL, 06, 01),
(07, '2023-12-27', '2024-01-17', '2024-01-05', TRUE, 15.00, 07, 02),
(08, '2024-01-15', '2024-02-05', '2024-02-05', FALSE, NULL, 08, 03),
(09, '2024-01-15', '2024-02-05', '2024-01-30', FALSE, NULL, 09, 04),
(10, '2024-12-06', '2024-01-02', '2024-03-02', FALSE, 5.00, 10, 05),
(11, '2024-02-18', '2024-03-10', '2024-03-01', FALSE, NULL, 11, 01),
(12, '2024-03-05', '2024-03-26', '2024-03-18', FALSE, NULL, 12, 02),
(13, '2024-03-13', '2024-04-03', NULL, TRUE, 80.00, 13, 03),
(14, '2024-03-13', '2024-04-04', NULL, FALSE, NULL, 14, 04);

SELECT * FROM loan;
															