-- Insert 10 Authors
INSERT INTO authors (name, email, country) VALUES ('Stephen King', 'stephen.king@library.com', 'USA');
INSERT INTO authors (name, email, country) VALUES ('J.K. Rowling', 'jk.rowling@library.com', 'United Kingdom');
INSERT INTO authors (name, email, country) VALUES ('George R.R. Martin', 'george.martin@library.com', 'USA');
INSERT INTO authors (name, email, country) VALUES ('J.R.R. Tolkien', 'jrr.tolkien@library.com', 'United Kingdom');
INSERT INTO authors (name, email, country) VALUES ('Paulo Coelho', 'paulo.coelho@library.com', 'Brazil');
INSERT INTO authors (name, email, country) VALUES ('Dan Brown', 'dan.brown@library.com', 'USA');
INSERT INTO authors (name, email, country) VALUES ('Haruki Murakami', 'haruki.murakami@library.com', 'Japan');
INSERT INTO authors (name, email, country) VALUES ('Agatha Christie', 'agatha.christie@library.com', 'United Kingdom');
INSERT INTO authors (name, email, country) VALUES ('Isaac Asimov', 'isaac.asimov@library.com', 'USA');
INSERT INTO authors (name, email, country) VALUES ('Margaret Atwood', 'margaret.atwood@library.com', 'Canada');

-- Insert 10 Books
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('The Shining', 'Horror', 15.99, '1977-01-28', 1);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('Harry Potter and the Philosophers Stone', 'Fantasy', 12.99, '1997-06-26', 2);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('A Game of Thrones', 'Fantasy', 18.99, '1996-08-06', 3);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('The Fellowship of the Ring', 'Fantasy', 14.99, '1954-07-29', 4);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('The Alchemist', 'Fiction', 10.99, '1988-04-15', 5);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('The Da Vinci Code', 'Mystery', 16.99, '2003-03-18', 6);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('Norwegian Wood', 'Romance', 13.99, '1987-09-04', 7);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('Murder on the Orient Express', 'Mystery', 11.99, '1934-01-01', 8);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('Foundation', 'Science Fiction', 14.99, '1951-06-01', 9);
INSERT INTO books (title, genre, price, published_date, author_id) VALUES ('The Handmaids Tale', 'Dystopian', 13.99, '1985-06-15', 10);
