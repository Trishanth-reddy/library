package com.university.library.repository;

import com.university.library.model.Author;
import com.university.library.model.Book;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@DisplayName("BookRepository Tests")
class BookRepositoryTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private AuthorRepository authorRepository;

    private Author testAuthor;
    private Book testBook;

    @BeforeEach
    void setUp() {
        // Create and persist a test author
        testAuthor = new Author();
        testAuthor.setName("Test Author");
        testAuthor.setEmail("test.author@library.com");
        testAuthor.setCountry("USA");
        testAuthor = authorRepository.save(testAuthor);

        // Create and persist a test book
        testBook = new Book();
        testBook.setTitle("Test Book");
        testBook.setGenre("Fiction");
        testBook.setPrice(19.99);
        testBook.setPublishedDate(LocalDate.of(2023, 1, 15));
        testBook.setAuthor(testAuthor);
        testBook = bookRepository.save(testBook);

        entityManager.flush();
        entityManager.clear();
    }

    @Test
    @DisplayName("Should find all books with authors using JOIN FETCH")
    void testFindAllBooksWithAuthor() {
        // When
        List<Book> books = bookRepository.findAllBooksWithAuthor();

        // Then
        assertNotNull(books);
        assertFalse(books.isEmpty());
        assertTrue(books.size() >= 1);

        // Verify that the book has the author loaded
        Book retrievedBook = books.stream()
                .filter(b -> b.getBookId().equals(testBook.getBookId()))
                .findFirst()
                .orElse(null);

        assertNotNull(retrievedBook);
        assertNotNull(retrievedBook.getAuthor());
        assertEquals(testAuthor.getAuthorId(), retrievedBook.getAuthor().getAuthorId());
        assertEquals(testAuthor.getName(), retrievedBook.getAuthor().getName());
    }

    @Test
    @DisplayName("Should retrieve book by ID")
    void testFindByIdRetrievesBook() {
        // When
        var foundBook = bookRepository.findById(testBook.getBookId());

        // Then
        assertTrue(foundBook.isPresent());
        assertEquals(testBook.getBookId(), foundBook.get().getBookId());
        assertEquals(testBook.getTitle(), foundBook.get().getTitle());
    }

    @Test
    @DisplayName("Should save book with author association")
    void testSaveBookWithAuthor() {
        // Given
        Book newBook = new Book();
        newBook.setTitle("New Book");
        newBook.setGenre("Mystery");
        newBook.setPrice(14.99);
        newBook.setPublishedDate(LocalDate.of(2024, 3, 10));
        newBook.setAuthor(testAuthor);

        // When
        Book savedBook = bookRepository.save(newBook);

        // Then
        assertNotNull(savedBook.getBookId());
        assertEquals("New Book", savedBook.getTitle());
        assertNotNull(savedBook.getAuthor());
        assertEquals(testAuthor.getAuthorId(), savedBook.getAuthor().getAuthorId());
    }

    @Test
    @DisplayName("Should delete book by ID")
    void testDeleteBook() {
        // Given
        Long bookId = testBook.getBookId();
        assertTrue(bookRepository.existsById(bookId));

        // When
        bookRepository.deleteById(bookId);
        entityManager.flush();

        // Then
        assertFalse(bookRepository.existsById(bookId));
    }

}
