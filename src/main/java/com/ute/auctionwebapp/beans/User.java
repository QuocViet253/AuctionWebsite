package com.ute.auctionwebapp.beans;

import java.time.LocalDateTime;

public class User {
    private String name, email, password,address;
    LocalDateTime dob;
    private int role, reQuest, id;

    public User() {
    }

    public User(String name, String email, String address, String password, LocalDateTime dob, int role, int reQuest) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.role = role;
        this.reQuest = reQuest;
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public LocalDateTime getDob() {
        return dob;
    }

    public int getRole() {
        return role;
    }

    public int getReQuest() {
        return reQuest;
    }
}
