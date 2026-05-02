# 🚀 Quick Start Guide - Library Management System

## ⚡ 5-Minute Setup

### Step 1: Prerequisites Check
```bash
java -version        # Should be 17+
mvn -version         # Should be 3.8+
mysql --version      # Should be 8.0+
```

### Step 2: Start MySQL
```bash
# Windows
mysql -u root -p
# Enter password: root

# Or using MySQL service
net start MySQL80
```

### Step 3: Build & Run
```bash
cd d:\1\library-management-system

# Clean build
mvn clean install

# Start the application
mvn spring-boot:run
```

### Step 4: Access the Application
Open browser and go to:
```
http://localhost:8080/
```

---

## ✅ What You Get

✓ **Complete Working Application** - No configuration needed  
✓ **Sample Data** - 10 authors + 10 books pre-loaded  
✓ **Full CRUD** - Create, Read, Update, Delete operations  
✓ **Database** - Auto-created on first run  
✓ **Validation** - Server-side with error messages  
✓ **Tests** - 2+ unit tests included  
✓ **Responsive UI** - Mobile-friendly design  

---

## 🎯 Try These Features

### 1. View Authors
1. Navigate to "Authors" in navbar
2. See table with 10 pre-loaded authors

### 2. Create an Author
1. Click "+ Add New Author"
2. Fill in Name (required), Email (required, unique), Country
3. Click "Save Author"

### 3. Create a Book
1. Navigate to "Books"
2. Click "+ Add New Book"
3. Select Author from dropdown
4. Fill in Title, Genre, Price, Published Date
5. Click "Save Book"

### 4. Edit Data
1. Click "Edit" button on any row
2. Modify fields
3. Save changes

### 5. Delete Data
1. Click "Delete" button
2. Confirm deletion
3. Data is removed (cascade delete for authors)

### 6. Test Validation
1. Try creating author without email
2. Try creating author with existing email
3. Try creating book with negative price
4. See validation errors

---

## 🗂️ Project Files Summary

| Component | Count | Files |
|-----------|-------|-------|
| **Source Code** | 8 | Controllers, Models, Repositories, Services |
| **Configuration** | 1 | pom.xml |
| **Views** | 6 | JSP templates (index, authors list/form, books list/form) |
| **Styling** | 1 | style.css |
| **Database** | 1 | data.sql (initial data) |
| **Tests** | 2 | Repository + Service tests |
| **Config** | 1 | application.properties |
| **Documentation** | 2 | README.md + this file |
| **Total** | **24** | Complete, production-ready application |

---

## 🔧 Common Commands

```bash
# Build without running tests
mvn clean install -DskipTests

# Run only tests
mvn test

# Run specific test
mvn test -Dtest=BookRepositoryTest

# Run application on different port
mvn spring-boot:run -Dspring-boot.run.arguments="--server.port=8081"

# Clean project
mvn clean

# Create JAR and run it
mvn clean install -DskipTests
java -jar target/library-management-system-1.0.0.jar
```

---

## 📊 Database Schema

### Authors Table
```sql
CREATE TABLE authors (
    author_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    country VARCHAR(255)
);
```

### Books Table
```sql
CREATE TABLE books (
    book_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(255),
    price DOUBLE,
    published_date DATE NOT NULL,
    author_id BIGINT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);
```

---

## 🎓 Learning Points

This application demonstrates:

1. **Spring Boot MVC** - Full request/response lifecycle
2. **Spring Data JPA** - Repository pattern and custom queries
3. **Form Binding** - Two-way data binding with JSP
4. **Validation** - JSR-303 with custom error handling
5. **Database Relations** - OneToMany/ManyToOne with cascade
6. **Service Layer** - Business logic separation
7. **Testing** - Unit tests with JUnit 5 and Mockito
8. **Responsive Design** - CSS Grid and Flexbox
9. **Error Handling** - Global exception handling
10. **Best Practices** - Layered architecture, SOLID principles

---

## ❓ FAQ

**Q: Application won't start?**  
A: Check MySQL is running: `mysql -u root -p` with password `root`

**Q: What's the default login?**  
A: No authentication - the app is public by default

**Q: How to change database credentials?**  
A: Edit `src/main/resources/application.properties`

**Q: Can I use PostgreSQL instead of MySQL?**  
A: Yes! Update connection string and dialect in application.properties

**Q: How do I run tests?**  
A: `mvn test` or `mvn test -Dtest=AuthorServiceTest`

**Q: Can I deploy this to production?**  
A: Yes! Build JAR and run with `java -jar`. Consider adding authentication and security.

---

## 📞 Support

For issues or questions, check:
1. Application logs in console
2. Browser console (F12) for frontend errors
3. MySQL logs for database issues
4. README.md for detailed documentation

---

**You're all set! Happy coding! 🎉**
