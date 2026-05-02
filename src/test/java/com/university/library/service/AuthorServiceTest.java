package com.university.library.service;

import com.university.library.exception.DuplicateEmailException;
import com.university.library.exception.EntityNotFoundException;
import com.university.library.model.Author;
import com.university.library.repository.AuthorRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@DisplayName("AuthorService Tests")
class AuthorServiceTest {

    @Mock
    private AuthorRepository authorRepository;

    @InjectMocks
    private AuthorService authorService;

    private Author testAuthor;

    @BeforeEach
    void setUp() {
        testAuthor = new Author();
        testAuthor.setAuthorId(1L);
        testAuthor.setName("Test Author");
        testAuthor.setEmail("test.author@library.com");
        testAuthor.setCountry("USA");
    }

    @Test
    @DisplayName("Should save a new author successfully")
    void testSaveAuthorSuccess() {
        // Given
        Author newAuthor = new Author();
        newAuthor.setName("New Author");
        newAuthor.setEmail("new.author@library.com");
        newAuthor.setCountry("Canada");

        when(authorRepository.findByEmail(newAuthor.getEmail())).thenReturn(Optional.empty());
        when(authorRepository.save(any(Author.class))).thenReturn(newAuthor);

        // When
        Author savedAuthor = authorService.save(newAuthor);

        // Then
        assertNotNull(savedAuthor);
        assertEquals("New Author", savedAuthor.getName());
        assertEquals("new.author@library.com", savedAuthor.getEmail());
        verify(authorRepository, times(1)).save(any(Author.class));
    }

    @Test
    @DisplayName("Should throw DuplicateEmailException when saving author with existing email")
    void testSaveAuthorWithDuplicateEmail() {
        // Given
        Author newAuthor = new Author();
        newAuthor.setName("Another Author");
        newAuthor.setEmail("test.author@library.com");
        newAuthor.setCountry("USA");

        when(authorRepository.findByEmail(newAuthor.getEmail())).thenReturn(Optional.of(testAuthor));

        // When & Then
        assertThrows(DuplicateEmailException.class, () -> authorService.save(newAuthor));
        verify(authorRepository, never()).save(any(Author.class));
    }

    @Test
    @DisplayName("Should retrieve author by ID successfully")
    void testGetAuthorByIdSuccess() {
        // Given
        when(authorRepository.findById(1L)).thenReturn(Optional.of(testAuthor));

        // When
        Author foundAuthor = authorService.getById(1L);

        // Then
        assertNotNull(foundAuthor);
        assertEquals(1L, foundAuthor.getAuthorId());
        assertEquals("Test Author", foundAuthor.getName());
        verify(authorRepository, times(1)).findById(1L);
    }

    @Test
    @DisplayName("Should throw EntityNotFoundException when author ID is not found")
    void testGetAuthorByIdNotFound() {
        // Given
        when(authorRepository.findById(999L)).thenReturn(Optional.empty());

        // When & Then
        assertThrows(EntityNotFoundException.class, () -> authorService.getById(999L));
        verify(authorRepository, times(1)).findById(999L);
    }

    @Test
    @DisplayName("Should update author email successfully")
    void testUpdateAuthorEmail() {
        // Given
        Author updatedAuthor = new Author();
        updatedAuthor.setAuthorId(1L);
        updatedAuthor.setName("Test Author");
        updatedAuthor.setEmail("newemail@library.com");
        updatedAuthor.setCountry("USA");

        when(authorRepository.findById(1L)).thenReturn(Optional.of(testAuthor));
        when(authorRepository.findByEmail("newemail@library.com")).thenReturn(Optional.empty());
        when(authorRepository.save(any(Author.class))).thenReturn(updatedAuthor);

        // When
        Author result = authorService.save(updatedAuthor);

        // Then
        assertNotNull(result);
        assertEquals("newemail@library.com", result.getEmail());
        verify(authorRepository, times(1)).save(any(Author.class));
    }

    @Test
    @DisplayName("Should delete author by ID successfully")
    void testDeleteAuthorSuccess() {
        // Given
        when(authorRepository.existsById(1L)).thenReturn(true);

        // When
        authorService.deleteById(1L);

        // Then
        verify(authorRepository, times(1)).deleteById(1L);
    }

    @Test
    @DisplayName("Should throw EntityNotFoundException when deleting non-existent author")
    void testDeleteAuthorNotFound() {
        // Given
        when(authorRepository.existsById(999L)).thenReturn(false);

        // When & Then
        assertThrows(EntityNotFoundException.class, () -> authorService.deleteById(999L));
        verify(authorRepository, never()).deleteById(999L);
    }

}
