# Library Management System

A complete, production-ready Spring Boot MVC application with JSP views for managing a library's authors and books.

## 🏗️ Project Structure

```
library-management-system/
├── pom.xml                                          # Maven configuration with all dependencies
├── src/
│   ├── main/
│   │   ├── java/com/university/library/
│   │   │   ├── LibraryApplication.java             # Spring Boot entry point
│   │   │   ├── controller/
│   │   │   │   ├── HomeController.java             # Home page controller
│   │   │   │   ├── AuthorController.java           # Author CRUD operations
│   │   │   │   └── BookController.java             # Book CRUD operations
│   │   │   ├── model/
│   │   │   │   ├── Author.java                     # Author entity with validations
│   │   │   │   └── Book.java                       # Book entity with validations
│   │   │   ├── repository/
│   │   │   │   ├── AuthorRepository.java           # Author data access layer
│   │   │   │   └── BookRepository.java             # Book data access layer with custom JOIN query
│   │   │   ├── service/
│   │   │   │   ├── AuthorService.java              # Author business logic
│   │   │   │   └── BookService.java                # Book business logic
│   │   │   └── exception/
│   │   │       ├── EntityNotFoundException.java    # Custom exception for missing entities
│   │   │       └── DuplicateEmailException.java    # Custom exception for duplicate emails
│   │   ├── resources/
│   │   │   ├── application.properties              # Spring Boot configuration
│   │   │   ├── data.sql                            # Initial data: 10 authors + 10 books
│   │   │   └── static/css/
│   │   │       └── style.css                       # Complete responsive CSS styling
│   │   └── webapp/WEB-INF/jsp/
│   │       ├── index.jsp                           # Home page with navigation
│   │       ├── authors/
│   │       │   ├── list.jsp                        # List all authors
│   │       │   └── form.jsp                        # Create/edit author form
│   │       └── books/
│   │           ├── list.jsp                        # List all books with authors
│   │           └── form.jsp                        # Create/edit book form
│   └── test/java/com/university/library/
│       ├── repository/
│       │   └── BookRepositoryTest.java             # Repository tests with @DataJpaTest
│       └── service/
│           └── AuthorServiceTest.java              # Service tests with Mockito
```

## 🛠️ Technology Stack

- **Java**: 17+
- **Spring Boot**: 3.2.0
- **Spring MVC**: Web framework
- **Spring Data JPA**: ORM with Hibernate
- **JSP + JSTL**: View layer
- **MySQL**: Database (8.0+)
- **Maven**: Build tool
- **JUnit 5**: Testing framework
- **Mockito**: Mocking library
- **Lombok**: Boilerplate reduction

## 📋 Prerequisites

Before running the application, ensure you have:

1. **Java 17 or higher** installed
   ```bash
   java -version
   ```

2. **Maven 3.8.x or higher** installed
   ```bash
   mvn -version
   ```

3. **MySQL 8.0 or higher** installed and running
   ```bash
   mysql --version
   ```

4. **MySQL Database Setup**:
   - Start MySQL service
   - Ensure it's running on `localhost:3306`
   - Default credentials: `username: root`, `password: root`

## 🚀 Getting Started

### 1. Build the Project

```bash
cd library-management-system
mvn clean install
```

This command will:
- Download all dependencies
- Compile the source code
- Run all tests (if configured)
- Package the application

### 2. Run the Application

```bash
mvn spring-boot:run
```

Or if you prefer running the generated JAR:

```bash
java -jar target/library-management-system-1.0.0.jar
```

### 3. Access the Application

Open your browser and navigate to:
```
http://localhost:8080/
```

## 📱 Application Features

### Home Page
- Welcome message
- Quick navigation to Authors and Books sections
- Feature highlights

### Author Management
- **List Authors**: View all authors in a table with ID, Name, Email, and Country
- **Create Author**: Add new authors with validation
  - Name: Required
  - Email: Required, unique, valid email format
  - Country: Optional
- **Edit Author**: Update author information
- **Delete Author**: Remove authors (cascades to delete associated books)

### Book Management
- **List Books**: View all books with author associations in a table
- **Create Book**: Add new books with validations
  - Title: Required
  - Genre: Optional
  - Price: Required, must be >= 0
  - Published Date: Required
  - Author: Required (dropdown selection)
- **Edit Book**: Update book information
- **Delete Book**: Remove books from catalog

## 🔄 API Endpoints

### Home
- `GET /` → Homepage

### Authors
- `GET /authors` → List all authors
- `GET /authors/new` → Show author creation form
- `POST /authors/save` → Save/update author
- `GET /authors/edit/{id}` → Show edit form for author
- `POST /authors/delete/{id}` → Delete author

### Books
- `GET /books` → List all books with authors
- `GET /books/new` → Show book creation form
- `POST /books/save` → Save/update book
- `GET /books/edit/{id}` → Show edit form for book
- `POST /books/delete/{id}` → Delete book

## 🗄️ Database Configuration

The application uses MySQL with automatic database creation. Configuration in `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/library_db?createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update
```

**Database will be created automatically** on first run with:
- 2 tables: `authors` and `books`
- 10 sample authors
- 10 sample books linked to authors

## ✅ Testing

### Run All Tests

```bash
mvn test
```

### Test Coverage

1. **BookRepositoryTest** (@DataJpaTest)
   - Tests custom JOIN FETCH query
   - Verifies author eager loading
   - Tests CRUD operations

2. **AuthorServiceTest** (@ExtendWith(MockitoExtension.class))
   - Tests save with validation
   - Tests duplicate email detection
   - Tests getById with exception handling
   - Tests delete operations
   - Mocks AuthorRepository

## 🎨 UI Features

- **Responsive Design**: Works on desktop, tablet, and mobile
- **Modern Styling**: Purple gradient navbar, clean tables, styled forms
- **Form Validation**: Client-side display of server-side validation errors
- **User Feedback**: Success and error messages with alerts
- **Navigation**: Easy navigation between authors and books
- **Confirmation Dialogs**: Delete operations require confirmation

## 📝 Data Initialization

The `data.sql` file automatically inserts on application startup:

### 10 Sample Authors
1. Stephen King (USA)
2. J.K. Rowling (United Kingdom)
3. George R.R. Martin (USA)
4. J.R.R. Tolkien (United Kingdom)
5. Paulo Coelho (Brazil)
6. Dan Brown (USA)
7. Haruki Murakami (Japan)
8. Agatha Christie (United Kingdom)
9. Isaac Asimov (USA)
10. Margaret Atwood (Canada)

### 10 Sample Books
Each book is linked to an author with varied genres and prices.

## 🔍 Key Implementation Details

### Entity Relationships
- **Author** (1) ← → (many) **Book**
- Cascade delete: Deleting an author removes all associated books
- Book.author is eagerly loaded to avoid N+1 queries

### N+1 Query Prevention
```java
@Query("SELECT b FROM Book b JOIN FETCH b.author")
List<Book> findAllBooksWithAuthor();
```

### Form Binding
- Uses Spring Form tags: `<form:form>`, `<form:input>`, `<form:select>`
- Two-way binding between JSP and controller model
- Automatic error display with `<form:errors>`

### Exception Handling
- `EntityNotFoundException`: For invalid IDs
- `DuplicateEmailException`: For duplicate email addresses
- Global error handling with redirect attributes

### Validation
- JSR-303 annotations: `@NotBlank`, `@Email`, `@Min`, `@NotNull`
- `@Valid` and `BindingResult` in controllers
- Unique constraint on email column

## 🛠️ Troubleshooting

### Issue: MySQL Connection Error
**Solution**: Ensure MySQL is running and accessible at `localhost:3306` with credentials `root:root`

### Issue: Port 8080 Already in Use
**Solution**: Change port in `application.properties`:
```properties
server.port=8081
```

### Issue: "database not found"
**Solution**: The database will be created automatically. If not, ensure MySQL user `root` has CREATE database permissions.

### Issue: JSP Pages Not Found
**Solution**: Ensure all JSP files are in `src/main/webapp/WEB-INF/jsp/` directory

## 📚 Additional Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Spring Data JPA Reference](https://spring.io/projects/spring-data-jpa)
- [JSP/JSTL Reference](https://jakarta.ee/specifications/tags/2.1/)
- [Hibernate Documentation](https://hibernate.org/orm/)

## 📄 License

This project is open-source and available for educational purposes.

## 👨‍💻 Development Notes

- All code follows Java conventions and best practices
- Service layer handles all business logic
- Controllers handle request/response and validation
- Repositories provide data access abstraction
- Entities have proper JPA mappings and validations
- Views use JSTL and Spring Form tags for flexibility
- CSS is self-contained and responsive
- Tests use JUnit 5 and Mockito for proper isolation

---

**Happy Coding! 📚✨**
#   l i b r a r y  
 