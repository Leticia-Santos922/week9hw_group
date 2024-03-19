use library_db;

CREATE TABLE staff
(
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, FOREIGN KEY (user_id) REFERENCES user(user_id),
    hire_date DATE DEFAULT (CURDATE()),
    job_title VARCHAR(50)
);

INSERT INTO staff (user_id, hire_date, job_title)
VALUES 
(15, '2024-02-27', 'Library Manager'),
(16, '2019-05-14', 'Librarian'),
(17, '2017-02-01', 'Librarian'),
(18, '2016-08-23', 'Library Assistant'),
(19, '2024-03-01', 'Library Assistant'),
(20, '2020-12-01', 'Library Technician');

SELECT * FROM staff;