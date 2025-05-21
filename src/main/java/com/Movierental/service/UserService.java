package com.movierental.service;

import com.movierental.model.User;

import javax.servlet.ServletContext;
import java.io.*;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private final String usersFilePath;
    private final Object fileLock = new Object(); // For synchronization

    public UserService(ServletContext context) {
        // First attempt to use context.getRealPath
        String realPath = context.getRealPath("/WEB-INF/data/user.txt");
        if (realPath == null) {
            // Fallback if getRealPath returns null (e.g., running from a packed .war)
            String fallbackPath = context.getRealPath("/WEB-INF/") != null
                    ? context.getRealPath("/WEB-INF/") + "data/user.txt"
                    : System.getProperty("java.io.tmpdir") + "/movie-rental-platform/data/user.txt";
            System.out.println("context.getRealPath returned null, falling back to: " + fallbackPath);
            this.usersFilePath = fallbackPath;
        } else {
            this.usersFilePath = realPath;
            System.out.println("Using user.txt path: " + usersFilePath);
        }
        initializeUserFile(context);
    }

    private void initializeUserFile(ServletContext context) {
        File file = new File(usersFilePath);
        try {
            // Create the directory if it doesn't exist
            file.getParentFile().mkdirs();
            System.out.println("Ensured directory exists: " + file.getParentFile().getAbsolutePath());

            // Check if the file already exists
            if (!file.exists()) {
                file.createNewFile();
                System.out.println("Created new user.txt at: " + file.getAbsolutePath());
                // Check for user.txt in the classpath (src/main/resources/)
                try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream("user.txt")) {
                    if (inputStream != null) {
                        // Copy the resource file to WEB-INF/data/user.txt
                        Files.copy(inputStream, file.toPath());
                        System.out.println("Initialized user.txt from resources to " + usersFilePath);
                    } else {
                        System.out.println("No user.txt found in resources; created empty file at " + usersFilePath);
                    }
                }
            } else {
                System.out.println("user.txt already exists at " + usersFilePath);
            }
        } catch (IOException e) {
            System.err.println("Error initializing user.txt: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void createUser(User user) throws IOException {
        synchronized (fileLock) {
            File file = new File(usersFilePath);
            file.getParentFile().mkdirs();
            if (!file.exists()) {
                file.createNewFile();
                System.out.println("Created user.txt for writing: " + file.getAbsolutePath());
            }
            System.out.println("Attempting to write user to " + file.getAbsolutePath() + ": " + user.toString());
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                writer.write(user.getUsername() + "," + user.getEmail() + "," + user.getGender() + "," +
                        user.getNicNumber() + "," + user.getPassword());
                writer.newLine();
                writer.flush(); // Ensure data is written to the file
                System.out.println("Successfully wrote user " + user.getUsername() + " to " + file.getAbsolutePath());
            } catch (IOException e) {
                System.err.println("Error writing user to user.txt at " + file.getAbsolutePath() + ": " + e.getMessage());
                e.printStackTrace();
                throw e; // Re-throw to ensure the caller knows about the failure
            }
        }
    }

    public List<User> getAllUsers() throws IOException {
        List<User> users = new ArrayList<>();
        synchronized (fileLock) {
            File file = new File(usersFilePath);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
                System.out.println("Created user.txt for reading: " + file.getAbsolutePath());
                return users;
            }
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.trim().isEmpty()) {
                        continue; // Skip empty lines
                    }
                    String[] data = line.split(",");
                    if (data.length == 5) {
                        users.add(new User(data[0], data[1], data[2], data[3], data[4]));
                    } else {
                        System.err.println("Skipping malformed line in user.txt: " + line);
                    }
                }
            } catch (IOException e) {
                System.err.println("Error reading user.txt at " + file.getAbsolutePath() + ": " + e.getMessage());
                throw e;
            }
        }
        return users;
    }

    public User getUserByEmail(String email) throws IOException {
        for (User user : getAllUsers()) {
            if (user.getEmail().equals(email)) {
                return user;
            }
        }
        return null;
    }

    public void updateUser(String email, User updatedUser) throws IOException {
        synchronized (fileLock) {
            List<User> users = getAllUsers();
            File file = new File(usersFilePath);
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                for (User user : users) {
                    if (user.getEmail().equals(email)) {
                        writer.write(updatedUser.getUsername() + "," + updatedUser.getEmail() + "," +
                                updatedUser.getGender() + "," + updatedUser.getNicNumber() + "," +
                                updatedUser.getPassword());
                    } else {
                        writer.write(user.getUsername() + "," + user.getEmail() + "," +
                                user.getGender() + "," + user.getNicNumber() + "," +
                                user.getPassword());
                    }
                    writer.newLine();
                }
                writer.flush();
                System.out.println("Successfully updated user with email " + email + " in " + file.getAbsolutePath());
            } catch (IOException e) {
                System.err.println("Error updating user in user.txt at " + file.getAbsolutePath() + ": " + e.getMessage());
                throw e;
            }
        }
    }

    public void deleteUser(String email) throws IOException {
        synchronized (fileLock) {
            List<User> users = getAllUsers();
            File file = new File(usersFilePath);
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                for (User user : users) {
                    if (!user.getEmail().equals(email)) {
                        writer.write(user.getUsername() + "," + user.getEmail() + "," +
                                user.getGender() + "," + user.getNicNumber() + "," +
                                user.getPassword());
                        writer.newLine();
                    }
                }
                writer.flush();
                System.out.println("Successfully deleted user with email " + email + " from " + file.getAbsolutePath());
            } catch (IOException e) {
                System.err.println("Error deleting user from user.txt at " + file.getAbsolutePath() + ": " + e.getMessage());
                throw e;
            }
        }
    }
}