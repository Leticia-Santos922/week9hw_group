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
    JOIN format_book ON book_format.Format_ID = format_book.Format_ID
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


-- PROCEDURE 3 - Find all romance novels suitable for visually impaired

DELIMITER //

CREATE PROCEDURE love_is_blind()
BEGIN
    SELECT 
		Book.Title AS BookTitle,
		Category.Category_Type AS CategoryType,
        Format_Book.Format_name AS BookFormat
    FROM Book 
    JOIN Book_Format ON Book.Book_ID = Book_Format.Book_ID
    JOIN Format_Book ON Book_Format.Format_ID = Format_Book.Format_ID
    JOIN Book_Category ON Book.Book_ID = Book_Category.Book_ID
	JOIN Category ON Book_Category.Category_ID = Category.Category_ID
    WHERE Book_Format.Format_ID in (3, 5)
    AND Category.Category_Type = "Romance";
END;
//

DELIMITER ;


CALL love_is_blind()