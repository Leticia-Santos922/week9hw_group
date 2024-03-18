USE Library_DB;

-- PROCEDURE 1:
-- ignore ; and replace with //
DELIMITER //

CREATE PROCEDURE Select_all_braille_books()
BEGIN
	-- from book table select book_id and title
    SELECT Book.Book_ID, Book.Title
    FROM Book 
    JOIN Book_Format ON Book.Book_ID = Book_Format.Book_ID
    -- JOIN format_book.Format_ID ON book_format.Format_ID = format_book.Format_ID
    WHERE Book_Format.Format_ID = 5;
END;
//

DELIMITER ;


CALL Select_all_braille_books()



-- PROCEDURE 2:
DELIMITER //

CREATE PROCEDURE check_overdue_books()
BEGIN
    SELECT Book.Title
    FROM Book
    JOIN Loan ON Loan.Book_ID = Book.Book_ID
    WHERE Loan.is_overdue = True;
END;
//

DELIMITER ;

CALL Check_overdue_books()