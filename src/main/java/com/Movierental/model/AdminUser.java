package com.Movierental.model;

public class AdminUser extends User {
    private String department;
    private String title;

    public AdminUser(String id, String username, String password, String fullName,
                    String email, String phoneNumber, String address, String avatarUrl,
                    String department, String title) {
        super(id, username, password, fullName, email, phoneNumber, address, avatarUrl);
        this.department = department;
        this.title = title;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public boolean canManageUsers() {
        return true;
    }

    @Override
    public boolean canManageProducts() {
        return true;
    }

    @Override
    public String toString() {
        return String.format("%s,%s,%s,%s,%s,%s,%s,%s,%b,%s,%s",
            getId(), getUsername(), getPassword(), getFullName(), getEmail(),
            getPhoneNumber(), getAddress(), "ADMIN", isActive(),
            department, title);
    }
} 