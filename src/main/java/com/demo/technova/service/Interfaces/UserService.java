package com.demo.technova.service.Interfaces;

import com.demo.technova.model.User;
import java.util.List;
import java.util.Optional;

public interface UserService {
    User createUser(User user);
    Optional<User> getUserById(Long id);
    User getUserByIdentificationNumber(String identificationNumber);
    List<User> getAllUsers();
    User updateUser(User user);
    void deleteUser(Long id);
    boolean existsByIdentificationNumber(String identificationNumber);
}