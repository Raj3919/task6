task 6

SELECT
    m.name AS member_name,
    (SELECT SUM(r.fine)
     FROM Returns r
     JOIN Borrow b ON r.borrow_id = b.borrow_id
     WHERE b.member_id = m.member_id) AS total_fine_paid
FROM Members m;

SELECT title
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Borrow
);

SELECT name
FROM Members m
WHERE EXISTS (
    SELECT 1
    FROM Borrow b
    JOIN Returns r ON b.borrow_id = r.borrow_id
    WHERE b.member_id = m.member_id AND r.fine > 5
);

SELECT member_name, AVG(fine) AS avg_fine
FROM (
    SELECT m.name AS member_name, r.fine
    FROM Returns r
    JOIN Borrow b ON r.borrow_id = b.borrow_id
    JOIN Members m ON b.member_id = m.member_id
) AS fines_by_member
GROUP BY member_name;


SELECT m.name, r.fine
FROM Returns r
JOIN Borrow b ON r.borrow_id = b.borrow_id
JOIN Members m ON b.member_id = m.member_id
WHERE r.fine = (
    SELECT MAX(fine)
    FROM Returns
);
