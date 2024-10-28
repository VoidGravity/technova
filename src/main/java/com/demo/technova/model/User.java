package com.demo.technova.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;

    @Column(name = "identification_number", nullable = false, unique = true, length = 20)
    private String identificationNumber;

    @Column(name = "nationality", nullable = false, length = 50)
    private String nationality;

    @Column(name = "registration_date", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate registrationDate;

    @Column(name = "expiration_date", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate expirationDate;

    @Column(name = "active", nullable = false)
    private boolean active = true;

    // Constructors
    public User() {
    }

    public User(String firstName, String lastName, String identificationNumber,
                String nationality, LocalDate registrationDate, LocalDate expirationDate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.identificationNumber = identificationNumber;
        this.nationality = nationality;
        this.registrationDate = registrationDate;
        this.expirationDate = expirationDate;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
    }

    public LocalDate getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDate expirationDate) {
        this.expirationDate = expirationDate;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", identificationNumber='" + identificationNumber + '\'' +
                ", nationality='" + nationality + '\'' +
                ", registrationDate=" + registrationDate +
                ", expirationDate=" + expirationDate +
                ", active=" + active +
                '}';
    }
}