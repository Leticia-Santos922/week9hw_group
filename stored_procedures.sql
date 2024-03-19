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


-- PROCEDURE 3 - Find all romance novels suitable for visually impaired (love_is_blind)

-- select all the rows that you want to have from each table --> syntax table.column (optional - give a new name)
-- in this case, we want a book title, category and format (so VI users can browse books by genre what are accessible)
-- now we need to join the tables together, so the database pulls the columns that match up
-- book:format = many:many - need link book to book:format link to format
-- so join book_format (link table) to book by book_id (PK and FK - it's the id that links the 2 tables)
-- it will pull all the rows where the book_id matches in the 2 tables
-- then join the link table to the format table using format_id - links books to their format when many:many
-- then join the category table to the book table - again using book_id (again the ID that links the two tables)
-- now all the tables are linked up so you can access all the rows that you have asked for above
-- 'where' is the filter, so we want all the books that have a format_id 3 or 5 (audio or braille)
-- 'and' adds another filter - where the category is romance
-- final output is the books in the romance category avaiable as either audio or braille


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