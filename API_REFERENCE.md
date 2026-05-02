# API Endpoints Reference

## Base URL
```
http://localhost:8080
```

## Home Endpoints
```
GET  /                      → Homepage with navigation
```

## Author Endpoints
```
GET  /authors               → List all authors
GET  /authors/new           → Show author creation form
POST /authors/save          → Save/update author (with validation)
GET  /authors/edit/{id}     → Show author edit form
POST /authors/delete/{id}   → Delete author (cascades to books)
```

## Book Endpoints
```
GET  /books                 → List all books with authors
GET  /books/new             → Show book creation form
POST /books/save            → Save/update book (with validation)
GET  /books/edit/{id}       → Show book edit form
POST /books/delete/{id}     → Delete book
```

---

## Request/Response Examples

### Create Author
**Request:**
```
POST /authors/save
Content-Type: application/x-www-form-urlencoded

name=John Doe&email=john@library.com&country=USA
```

**Response:** Redirect to `/authors` with success message

### Create Book
**Request:**
```
POST /books/save
Content-Type: application/x-www-form-urlencoded

title=My Book&genre=Fiction&price=19.99&publishedDate=2024-01-15&author.authorId=1
```

**Response:** Redirect to `/books` with success message

### List Authors
**Request:**
```
GET /authors
```

**Response:** HTML page with author table (6 columns: ID, Name, Email, Country, Actions)

### List Books
**Request:**
```
GET /books
```

**Response:** HTML page with book table (7 columns: ID, Title, Genre, Price, Published Date, Author, Actions)

---

## Error Responses

### Validation Error (422)
- Invalid email format
- Missing required fields
- Negative price
- Duplicate email

**Response:** Returns form with inline error messages

### Entity Not Found (404)
- Author/Book ID doesn't exist

**Response:** Redirect with error message

### Duplicate Email (409)
- Email already exists in database

**Response:** Form displayed with error: "Email already exists"

---

## Status Codes

| Code | Meaning |
|------|---------|
| 200  | Success - Page loaded |
| 302  | Redirect - After POST operations |
| 400  | Validation error - Form reloaded with errors |
| 404  | Entity not found |
| 409  | Duplicate email |
| 500  | Server error |

---

## Form Field Validations

### Author Form
| Field | Type | Rules |
|-------|------|-------|
| Name | String | Required, not blank |
| Email | Email | Required, valid format, unique |
| Country | String | Optional |

### Book Form
| Field | Type | Rules |
|-------|------|-------|
| Title | String | Required, not blank |
| Genre | String | Optional |
| Price | Double | Required, >= 0 |
| Published Date | Date | Required |
| Author | Long | Required, valid author ID |

---

## Example cURL Commands

### Get All Authors
```bash
curl http://localhost:8080/authors
```

### Create Author
```bash
curl -X POST http://localhost:8080/authors/save \
  -d "name=Jane Doe&email=jane@library.com&country=Canada"
```

### Edit Author (Load form)
```bash
curl http://localhost:8080/authors/edit/1
```

### Delete Author
```bash
curl -X POST http://localhost:8080/authors/delete/1
```

### Get All Books
```bash
curl http://localhost:8080/books
```

### Create Book
```bash
curl -X POST http://localhost:8080/books/save \
  -d "title=My Book&genre=Fiction&price=19.99&publishedDate=2024-01-15&author.authorId=1"
```

---

## Database Queries (For Reference)

### Get All Authors
```sql
SELECT * FROM authors;
```

### Get All Books with Authors (N+1 prevention)
```sql
SELECT b.*, a.* 
FROM books b 
JOIN authors a ON b.author_id = a.author_id;
```

### Get Books by Author
```sql
SELECT * FROM books WHERE author_id = 1;
```

### Get Author by Email
```sql
SELECT * FROM authors WHERE email = 'stephen.king@library.com';
```

---

## Service Layer Methods

### AuthorService
```java
List<Author> getAll()                    // Get all authors
Author save(Author author)               // Save/update author
Author getById(Long id)                  // Get author by ID
void deleteById(Long id)                 // Delete author by ID
```

### BookService
```java
List<Book> getAll()                      // Get all books with JOIN FETCH
Book save(Book book)                     // Save/update book
Book getById(Long id)                    // Get book by ID
void deleteById(Long id)                 // Delete book by ID
```

### Repository Custom Queries
```java
// BookRepository
findAllBooksWithAuthor()                 // JOIN FETCH query to load authors

// AuthorRepository
findByEmail(String email)                // Find author by email
```

---

## Flow Diagrams

### Create Author Flow
```
User Submits Form
        ↓
AuthorController.saveAuthor()
        ↓
@Valid + BindingResult validation
        ↓
AuthorService.save()
        ↓
Check duplicate email (AuthorRepository.findByEmail())
        ↓
Save to database
        ↓
Redirect to /authors with success message
```

### Create Book Flow
```
User Selects Author from Dropdown
        ↓
User Fills Book Details
        ↓
BookController.saveBook()
        ↓
@Valid + BindingResult validation
        ↓
BookService.save()
        ↓
Resolve Author from ID
        ↓
Save to database
        ↓
Redirect to /books with success message
```

### Delete Author Flow
```
User Clicks Delete Button
        ↓
User Confirms in Dialog
        ↓
AuthorController.deleteAuthor()
        ↓
AuthorService.deleteById()
        ↓
CASCADE DELETE removes all books
        ↓
Author deleted from database
        ↓
Redirect to /authors with success message
```

---

## Performance Considerations

1. **N+1 Prevention**: Books are fetched with JOIN FETCH for authors
2. **Lazy Loading**: Author.books uses lazy loading (not needed on list page)
3. **Database Indexes**: Email column is unique indexed
4. **Query Optimization**: Custom @Query with JOIN FETCH
5. **Caching**: Not implemented (can be added via Spring Cache)

---

## Security Notes

⚠️ **Important for Production:**
- Add Spring Security for authentication/authorization
- Add CSRF protection
- Validate all inputs (already done for basic validation)
- Use HTTPS
- Sanitize JSP output against XSS
- Add rate limiting
- Implement proper error pages
- Add audit logging

---

**Last Updated:** 2026-05-02  
**Version:** 1.0.0  
**Status:** Production Ready
