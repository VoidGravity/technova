# TechNova User Management System

Hey! 👋 This is my user management system built using Spring MVC. It's pretty basic but gets the job done - basically lets you add/edit/delete users and keep track of their info.

## Quick Spring Concepts Explanation

Before diving in, here are some key Spring concepts you should know:

### Spring MVC - Web Request Handling
It's a pattern that splits the web app into 3 parts:
- Model: just the data/objects (like User class in my case)
- View: what users see (my JSP pages)
- Controller: handles requests & decides what to do with them

The flow goes like this:
1. user hits a URL
2. controller gets the request
3. controller uses services to do stuff
4. controller picks a view to show
5. view shows the result

### IOC (Inversion of Control) - Spring's Container
Normally you'd create objects yourself right? Like `new UserService()` etc. 
With IOC you let Spring handle that:
- Spring creates all the objects (called beans)
- Spring manages their lifecycle
- You just say what you need and Spring gives it to you

It's like having a smart container that knows what components you need 🔧

### DI (Dependency Injection) - Component Wiring
This is how Spring gives you the objects you need. Instead of:
```java
// old way, messy
UserService service = new UserServiceImpl();
UserRepository repo = new UserRepositoryImpl();
service.setRepository(repo);
```

You just write:
```java
// spring way, clean
@Autowired
private UserService userService;
```
Spring handles all the setup! 

### Beans - Spring's Managed Objects
Beans are just objects that Spring manages. You can create them in 2 ways:
1. Using annotations (what I mostly use):
```java
@Service
public class UserServiceImpl implements UserService {
    // Spring will make this a bean automatically
}
```

2. XML config (old school but sometimes useful):
```xml
<bean id="userService" class="com.demo.technova.service.UserServiceImpl">
    <!-- Spring will create this bean when needed -->
</bean>
```

## What it does
- lets you do all the basic user stuff (add new ones, look up existing users, change their info, delete em if needed)
- shows everyone in a nice table view
- keeps track of when people register and when their stuff expires
- shows if users are active or not

## Tech I used
- Spring MVC 6.x because it's solid and I know it well
- JPA/Hibernate for database stuff
- PostgreSQL for the database
- JSP for the frontend (yeah I know it's old school but it works lol)
- Maven for building
- Tomcat 10.x to run it
- Java 17+ (make sure you have this or it won't work)

## How it's organized
```
it's pretty standard Spring structure:
TechNova/
├── src/
│   ├── main/
│   │   ├── java/           -> all the java code
│   │   ├── resources/      -> config stuff
│   │   └── webapp/         -> web files
│   └── test/               -> tests (todo: add more lol)
└── pom.xml
```

## Before you start
grab these:
1. JDK 17 or newer
2. Maven 3.6.x+
3. PostgreSQL 12+
4. Tomcat 10.x

## Database setup
1. make a postgres database called `technova`
2. database config is in `database.properties`:
   ```properties
   jdbc.url=jdbc:postgresql://localhost:5444/technova
   jdbc.username=myuser
   jdbc.password=AZERAZER1234
   ```
   change these if you need to

## Getting it running
1. clone it:
   ```bash
   git clone [repository-url]
   ```
2. go to the folder:
   ```bash
   cd TechNova
   ```
3. build it:
   ```bash
   mvn clean install
   ```
4. stick it in tomcat:
   - dump `target/TechNova-1.0-SNAPSHOT.war` in tomcat's `webapps` folder
   - or use tomcat manager if you're fancy

## User stuff it stores
basically each user has:
- id (just a number)
- first name
- last name
- some ID number (like passport or whatever)
- where they're from
- when they signed up
- when their docs expire
- if they're still active

## API endpoints
right now it just has:
- `GET /`: shows all users

## How I built it
tried to keep it clean:
1. split everything into layers (controllers, services, repos)
2. used dependency injection because it's cleaner
3. added some validation so people can't put in garbage data
4. proper transaction stuff so the database doesn't get messed up

Let me know if you find any bugs! 🐛
