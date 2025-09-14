/*
SELECT A.book_id, B.title, B.author, B.genre, B.publication_year, MAX(B.total_copies) - COUNT(A.book_id)
FROM borrowing_records A
JOIN library_books     B ON B.book_id = A.book_id
WHERE A.return_date IS NULL
GROUP BY A.book_id, B.title, B.author, B.genre, B.publication_year
HAVING MAX(B.total_copies) - COUNT(A.book_id) <> MAX(B.total_copies)
*/

WITH cte_not_returned_books AS
(
SELECT A.book_id
     , COUNT(A.book_id) AS qtty_borrowed
  FROM borrowing_records A
 WHERE A.return_date IS NULL
 GROUP BY A.book_id
)

SELECT A.book_id
     , B.title
     , B.author
     , B.genre
     , B.publication_year
     , A.qtty_borrowed AS current_borrowers
  FROM cte_not_returned_books A
  JOIN library_books          B ON B.book_id      = A.book_id
                               AND B.total_copies = A.qtty_borrowed
 ORDER BY A.qtty_borrowed DESC
        , B.title ASC