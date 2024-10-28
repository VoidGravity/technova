# TechNova User Management System

## Project Overview
TechNova is a Spring MVC-based web application for managing user records. The system allows for storing and managing user information including identification details, nationality, registration dates, and expiration dates.

## Features
- User Management CRUD Operations
    - Create new user records
    - Retrieve user information by ID or identification number
    - Update existing user records
    - Delete user records
- View all users in a tabular format
- Track registration and expiration dates
- Monitor user status (active/inactive)

## Technical Stack
- **Framework**: Spring MVC 6.x
- **ORM**: Spring Data JPA/Hibernate
- **Database**: PostgreSQL
- **View Technology**: JSP (JavaServer Pages)
- **Build Tool**: Maven
- **Server**: Apache Tomcat 10.x
- **Java Version**: 17 or higher

## Project Structure
```
TechNova/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/demo/technova/
│   │   │       ├── controller/
│   │   │       │   └── UserController.java
│   │   │       ├── model/
│   │   │       │   └── User.java
│   │   │       ├── repository/
│   │   │       │   └── UserRepository.java
│   │   │       └── service/
│   │   │           ├── Implementations/
│   │   │           │   └── UserServiceImpl.java
│   │   │           └── Interfaces/
│   │   │               └── UserService.java
│   │   ├── resources/
│   │   │   └── database.properties
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           ├── views/
│   │           │   └── list.jsp
│   │           ├── applicationContext.xml
│   │           ├── dispatcher.xml
│   │           └── web.xml
│   └── test/
└── pom.xml
```

## Prerequisites
1. JDK 17 or higher
2. Maven 3.6.x or higher
3. PostgreSQL 12 or higher
4. Apache Tomcat 10.x

## Database Configuration
1. Create a PostgreSQL database named `technova`
2. Default database configuration (can be modified in `database.properties`):
   ```properties
   jdbc.url=jdbc:postgresql://localhost:2004/technova
   jdbc.username=postgres
   jdbc.password=2004
   ```

## Installation & Setup
1. Clone the repository:
   ```bash
   git clone [repository-url]
   ```

2. Navigate to project directory:
   ```bash
   cd TechNova
   ```

3. Build the project:
   ```bash
   mvn clean install
   ```

4. Deploy the WAR file to Tomcat:
    - Copy `target/TechNova-1.0-SNAPSHOT.war` to Tomcat's `webapps` directory
    - Or deploy through Tomcat Manager UI

## User Entity Structure
```java
- id (Long): Primary key
- firstName (String): User's first name
- lastName (String): User's last name
- identificationNumber (String): Unique identifier
- nationality (String): User's nationality
- registrationDate (LocalDate): Date of registration
- expirationDate (LocalDate): Document expiration date
- active (boolean): User's active status
```

## API Endpoints
- `GET /`: Display list of all users
- Additional endpoints to be implemented:
    - `POST /users`: Create new user
    - `GET /users/{id}`: Get user by ID
    - `PUT /users/{id}`: Update user
    - `DELETE /users/{id}`: Delete user

## Best Practices Implemented
1. **Layered Architecture**
    - Controller layer for handling HTTP requests
    - Service layer for business logic
    - Repository layer for data access
    - Clear separation of concerns

2. **Dependency Injection**
    - Constructor-based injection for required dependencies
    - Use of interfaces for loose coupling

3. **Data Validation**
    - Entity-level validation using JPA annotations
    - Service-level validation for business rules

4. **Transaction Management**
    - Declarative transaction management using `@Transactional`

