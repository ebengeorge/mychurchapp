package com.dev.cms.controller;

import com.dev.cms.model.Team;
import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.UserTeamService;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserTeamController {
    private final UserTeamService userTeamService;

   @Autowired
    public UserTeamController( UserTeamService userTeamService) {
        this.userTeamService = userTeamService;
    }

    @DeleteMapping("/api/userTeam/{userId}/{teamId}")
     public void deleteUserTeam(@PathVariable int userId, @PathVariable int teamId) {
        List<UserTeam> ut = userTeamService.findByUserAndTeam(userId,teamId);
        if(ut != null && !ut.isEmpty()){
             userTeamService.delete(ut.getFirst());
        }
    }

    
    @PostMapping("/api/userTeam/{userId}/{teamId}")
     public boolean saveUserTeam(@PathVariable int userId, @PathVariable int teamId) {
        List<UserTeam> ut = userTeamService.findByUserAndTeam(userId,teamId);
        if(ut != null && !ut.isEmpty()){
            
        } else {
            UserTeam ut1 = new UserTeam();
            Team t = new Team();
            t.setId(teamId);
            User u = new User();
            u.setId(userId);
            ut1.setTeam(t);
            ut1.setUser(u);
            userTeamService.save(ut1);
        }
        return true;
    }
  
}
