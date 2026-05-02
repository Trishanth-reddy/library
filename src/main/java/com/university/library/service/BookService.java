package com.university.library.service;

import com.university.library.exception.EntityNotFoundException;
import com.university.library.model.Book;
import com.university.library.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class BookService {

    private final BookRepository bookRepository;

    public List<Book> getAll() {
        return bookRepository.findAllBooksWithAuthor();
    }

    public Book save(Book book) {
        if (book.getAuthor() == null || book.getAuthor().getAuthorId() == null) {
            throw new EntityNotFoundException("Author is required for the book");
        }
        return bookRepository.save(book);
    }

    public Book getById(Long id) {
        return bookRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Book not found with ID: " + id));
    }

    public void deleteById(Long id) {
        if (!bookRepository.existsById(id)) {
            throw new EntityNotFoundException("Book not found with ID: " + id);
        }
        bookRepository.deleteById(id);
    }

}
