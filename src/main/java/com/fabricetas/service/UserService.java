package com.fabricetas.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.fabricetas.model.User;

public interface UserService {

    ResponseEntity<List<User>> listAllUsers();
     
    ResponseEntity<User> getUser(Integer id);

    ResponseEntity<Void> createUser(User user);
    
    ResponseEntity<User> updateUser(User user);
     
    ResponseEntity<User> deleteUser(Integer id);

}
