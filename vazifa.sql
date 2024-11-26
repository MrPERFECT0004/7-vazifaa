CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    birth_date DATE,
    country VARCHAR(100)
);


CREATE TABLE publishers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    founded_year INT
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    publisher_id INT,
    genre VARCHAR(100),
    publication_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);


CREATE TABLE book_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    review_text TEXT,
    rating INT,
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id)
);


INSERT INTO authors (name, birth_date, country) VALUES
('J.K. Rowling', '1965-07-31', 'Buyuk Britaniya'),
('Jorj Orwell', '1903-06-25', 'Buyuk Britaniya');


INSERT INTO publishers (name, city, founded_year) VALUES
('Penguin Random House', 'Nyu-York', 1927),
('HarperCollins', 'Nyu-York', 1989);


INSERT INTO books (title, author_id, publisher_id, genre, publication_date, price) VALUES
('Garri Potter va Sehrgarning Tosh', 1, 1, 'Fantastika', '1997-06-26', 19.99),
('1984', 2, 2, 'Distopiya', '1949-06-08', 14.99);


INSERT INTO book_reviews (book_id, review_text, rating, review_date) VALUES
(1, 'Sehrli va sehrgarli hikoya, juda tasirli.', 5, '2024-11-01'),
(2, 'Qorongu va oylantiruvchi roman.', 4, '2024-11-03');





SELECT * FROM books;
SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM book_reviews;

SELECT title AS "Kitob nomi", price AS "Narx" FROM books;
SELECT name AS "Muallif ismi", birth_date AS "Tug'ilgan sana" FROM authors;

SELECT * FROM books ORDER BY price DESC; 
SELECT * FROM authors ORDER BY name ASC; 

SELECT * FROM books WHERE genre = 'Fantastika'; 
SELECT * FROM authors WHERE country = 'Yaponiya'; 

SELECT * FROM books ORDER BY price DESC LIMIT 3; 
SELECT * FROM authors LIMIT 2; 

SELECT * FROM books WHERE price IN (12.99, 19.99); 

SELECT * FROM books WHERE price BETWEEN 10 AND 20; 

SELECT * FROM books WHERE title LIKE '%Garri Potter%'; 

SELECT * FROM book_reviews WHERE review_text IS NULL;

SELECT genre, COUNT(*) AS "Kitoblar soni" FROM books GROUP BY genre;






SELECT b.title AS "Kitob nomi", a.name AS "Muallif ismi", p.name AS "Nashriyot", b.price AS "Narx"
FROM books b
JOIN authors a ON b.author_id = a.id
JOIN publishers p ON b.publisher_id = p.id;

SELECT COUNT(*) AS "barcha kitoblar" FROM books; 
SELECT AVG(price) AS "o'rtacha narx" FROM books;
SELECT SUM(price) AS "umumy narx" FROM books;
