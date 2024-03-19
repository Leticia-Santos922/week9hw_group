use library_db;

CREATE TABLE library_member
(
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, FOREIGN KEY (user_id) REFERENCES user(user_id),
    -- sets is_active to true by default
    is_active BOOLEAN DEFAULT TRUE,
    date_joined DATE DEFAULT (CURDATE())
);


INSERT INTO library_member (user_id, date_joined)
VALUES 
(1, '2024-02-27'),
(2,'2019-05-14'),
(3,'2017-02-01'),
(4, '2016-08-23'),
(5, '2024-03-01'),
(6, '2020-10-08'),
(8, '2024-02-27'),
(9, '2019-04-05'),
(11, '2019-03-08'),
(12, '2017-03-31'),
(14, '2024-01-10');

-- only included date so time will be set to 00:00:00
-- include is_active as defining as False 
INSERT INTO library_member (user_id, is_active, date_joined)
VALUES 
(7, FALSE, '2019-05-14'),
(10, FALSE, '2024-02-27'),
(13, FALSE, '2016-06-08');

SELECT * FROM library_member WHERE is_active = FALSE;
