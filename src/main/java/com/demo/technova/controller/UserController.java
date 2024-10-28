package com.demo.technova.controller;

import com.demo.technova.model.User;
import com.demo.technova.service.Interfaces.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.Optional;

@Controller
@RequestMapping("/users")
@Slf4j
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String listUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "users/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        return "users/add";
    }

    @PostMapping
    public String createUser(@ModelAttribute("user") User user,
                             Model model,
                             RedirectAttributes redirectAttributes) {
        // Add debug logging
        log.info("Received user data: {}", user);
        log.info("Registration date: {}", user.getRegistrationDate());
        log.info("Expiration date: {}", user.getExpirationDate());

        try {
            if (user.getRegistrationDate() == null) {
                user.setRegistrationDate(LocalDate.now());
            }

            User savedUser = userService.createUser(user);
            log.info("Successfully created user: {}", savedUser);
            redirectAttributes.addFlashAttribute("message", "User created successfully!");
            return "redirect:/users";
        } catch (Exception e) {
            log.error("Error creating user: ", e);
            model.addAttribute("error", e.getMessage());
            return "users/add";
        }
    }

    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model) {
        Optional<User> user = userService.getUserById(id);
        if (user.isPresent()) {
            model.addAttribute("user", user.get());
            return "users/form";
        }
        return "redirect:/users";
    }

    @PostMapping("/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute User user, RedirectAttributes redirectAttributes) {
        try {
            user.setId(id);
            userService.updateUser(user);
            redirectAttributes.addFlashAttribute("message", "User updated successfully!");
        } catch (IllegalStateException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/users";
    }

    @PostMapping("/{id}/delete")
    public String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            userService.deleteUser(id);
            redirectAttributes.addFlashAttribute("message", "User deleted successfully!");
        } catch (IllegalStateException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/users";
    }
}