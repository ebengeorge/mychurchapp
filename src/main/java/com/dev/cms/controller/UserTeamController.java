package com.dev.cms.controller;

import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.UserTeamService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserTeamController {

    @Autowired
    private UserTeamService userTeamService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/userTeam/json")
    public ResponseEntity<String> getUserTeamJson(HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return new ResponseEntity<>("User is not logged in", HttpStatus.UNAUTHORIZED);
        }

        try {
            List<UserTeam> userTeamList = userTeamService.findByUser(currentUser);
            String json = objectMapper.writeValueAsString(userTeamList);
            session.setAttribute("userTeamJson", json);
            return ResponseEntity.ok(json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return new ResponseEntity<>("Error processing JSON", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
