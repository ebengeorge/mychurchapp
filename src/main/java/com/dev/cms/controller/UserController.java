package com.dev.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dev.cms.model.User;
import com.dev.cms.service.UserService;

@RestController
public class UserController {
      @Autowired
    UserService userService;

    @GetMapping("/api/user")
    public List<User> index(){
        return userService.findAll();
    }
    @GetMapping("/api/user/find")
    public List<User> findById(String emailId){
        return userService.findByEmailId(emailId);
    }
    @PostMapping("/api/user")
    public User save(@RequestBody User user){
        System.out.println("Working");
        return userService.save(user);
    }
}
