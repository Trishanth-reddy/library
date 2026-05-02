package com.university.library.service;

import com.university.library.exception.DuplicateEmailException;
import com.university.library.exception.EntityNotFoundException;
import com.university.library.model.Author;
import com.university.library.repository.AuthorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AuthorService {

    private final AuthorRepository authorRepository;

    public List<Author> getAll() {
        return authorRepository.findAll();
    }

    public Author save(Author author) {
        // Check for duplicate email if it's a new author or email has changed
        if (author.getAuthorId() == null || hasEmailChanged(author)) {
            if (authorRepository.findByEmail(author.getEmail()).isPresent()) {
                throw new DuplicateEmailException("Email already exists: " + author.getEmail());
            }
        }
        return authorRepository.save(author);
    }

    public Author getById(Long id) {
        return authorRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Author not found with ID: " + id));
    }

    public void deleteById(Long id) {
        if (!authorRepository.existsById(id)) {
            throw new EntityNotFoundException("Author not found with ID: " + id);
        }
        authorRepository.deleteById(id);
    }

    private boolean hasEmailChanged(Author author) {
        Author existing = authorRepository.findById(author.getAuthorId()).orElse(null);
        if (existing == null) {
            return true;
        }
        return !existing.getEmail().equals(author.getEmail());
    }

}
