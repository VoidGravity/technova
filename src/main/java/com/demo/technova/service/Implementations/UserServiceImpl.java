package com.demo.technova.service.Implementations;

import com.demo.technova.model.User;
import com.demo.technova.repository.UserRepository;
import com.demo.technova.service.Interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User createUser(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (existsByIdentificationNumber(user.getIdentificationNumber())) {
            throw new IllegalStateException("User with this identification number already exists");
        }
        return userRepository.save(user);
    }

    @Override
    public Optional<User> getUserById(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("ID cannot be null");
        }
        return userRepository.findById(id);
    }

    @Override
    public User getUserByIdentificationNumber(String identificationNumber) {
        if (identificationNumber == null || identificationNumber.trim().isEmpty()) {
            throw new IllegalArgumentException("Identification number cannot be null or empty");
        }
        return userRepository.findByIdentificationNumber(identificationNumber);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User updateUser(User user) {
        if (user == null || user.getId() == null) {
            throw new IllegalArgumentException("User and user ID cannot be null");
        }
        if (!userRepository.existsById(user.getId())) {
            throw new IllegalStateException("User not found with id: " + user.getId());
        }
        return userRepository.save(user);
    }

    @Override
    public void deleteUser(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("ID cannot be null");
        }
        if (!userRepository.existsById(id)) {
            throw new IllegalStateException("User not found with id: " + id);
        }
        userRepository.deleteById(id);
    }

    @Override
    public boolean existsByIdentificationNumber(String identificationNumber) {
        if (identificationNumber == null || identificationNumber.trim().isEmpty()) {
            throw new IllegalArgumentException("Identification number cannot be null or empty");
        }
        return userRepository.findByIdentificationNumber(identificationNumber) != null;
    }

}