package com.university.library.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "books")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    private Long bookId;

    @Column(name = "title", nullable = false)
    @NotBlank(message = "Book title is required")
    private String title;

    @Column(name = "genre")
    private String genre;

    @Column(name = "price")
    @Min(value = 0, message = "Price must be greater than or equal to 0")
    private Double price;

    @Column(name = "published_date", nullable = false)
    @NotNull(message = "Published date is required")
    private LocalDate publishedDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "author_id", nullable = false)
    @NotNull(message = "Author is required")
    private Author author;

}
