package com.demo.technova;

import com.demo.technova.model.User;
import com.demo.technova.service.Interfaces.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.time.LocalDate;

public class Main {
    private static final Logger logger = LoggerFactory.getLogger(Main.class);

    public static void main(String[] args) {
        try {
            ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
            UserService userService = context.getBean("userService", UserService.class);

            // Create a new user
            User newUser = new User(
                    "John",
                    "Doe",
                    "ID200003",
                    "USA",
                    LocalDate.now(),
                    LocalDate.now().plusYears(1)
            );

            // Test CRUD operations
            try {
                // Create
                User createdUser = userService.createUser(newUser);
                logger.info("Created user: {}", createdUser);
                System.out.println("Created user: " + createdUser);

//                // Read
//                userService.getUserById(createdUser.getId())
//                        .ifPresent(user -> logger.info("Found user by ID: {}", user));
//
//                // Update
//                createdUser.setFirstName("Jane");
//                User updatedUser = userService.updateUser(createdUser);
//                logger.info("Updated user: {}", updatedUser);
//
//                // Delete
//                userService.deleteUser(createdUser.getId());
//                logger.info("Deleted user with ID: {}", createdUser.getId());

            } catch (Exception e) {
                logger.error("Error during CRUD operations: ", e);
            }

        } catch (Exception e) {
            logger.error("Error initializing application context: ", e);
        }
    }
}