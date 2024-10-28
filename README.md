# TechNova User Management System

hey! 👋 this is my user management system i built using Spring MVC. its pretty basic but gets the job done - basically lets you add/edit/delete users and keep track of their info.

## what it does

- lets you do all the basic user stuff (add new ones, look up existing users, change their info, delete em if needed)
- shows everyone in a nice table view
- keeps track of when people register and when their stuff expires
- shows if users are active or not

## tech i used

- Spring MVC 6.x cuz its solid and i know it well
- JPA/Hibernate for database stuff
- PostgreSQL for the database
- JSP for the frontend (yeah i know its old school but it works lol)
- Maven for building
- Tomcat 10.x to run it
- Java 17+ (make sure u have this or it wont work)

## how its organized

```
its pretty standard Spring structure:
TechNova/
├── src/
│   ├── main/
│   │   ├── java/           -> all the java code
│   │   ├── resources/      -> config stuff
│   │   └── webapp/         -> web files
│   └── test/               -> tests (todo: add more lol)
└── pom.xml
```

## before u start

grab these:
1. JDK 17 or newer
2. Maven 3.6.x+
3. PostgreSQL 12+
4. Tomcat 10.x

## database setup

1. make a postgres database called `technova`
2. database config is in `database.properties`:
   ```properties
   jdbc.url=jdbc:postgresql://localhost:5444/technova
   jdbc.username=myuser
   jdbc.password=AZERAZER1234
   ```
   change these if u need to

## getting it running

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
   - or use tomcat manager if ur fancy

## user stuff it stores

basically each user has:
- id (just a number)
- first name
- last name
- some ID number (like passport or whatever)
- where theyre from
- when they signed up
- when their docs expire
- if theyre still active

## api endpoints

rn it just has:
- `GET /`: shows all users



## how i built it

tried to keep it clean:
1. split everything into layers (controllers, services, repos)
2. used dependency injection cuz its cleaner
3. added some validation so people cant put in garbage data
4. proper transaction stuff so the database doesnt get messed up

lmk if u have questions or find any bugs! 🐛
