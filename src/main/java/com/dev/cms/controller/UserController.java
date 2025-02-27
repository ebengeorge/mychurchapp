package com.dev.cms.controller;

import java.util.List;


import com.dev.cms.model.Team;
import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.TeamService;
import com.dev.cms.service.UserTeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dev.cms.service.UserService;


   
    


@RestController
public class UserController {

    private final UserService userService;
    private final TeamService teamService;
    private final UserTeamService userTeamService;


    @Autowired
    public UserController(UserService userService, TeamService teamService, UserTeamService userTeamService) {
        this.userService = userService;
        this.teamService = teamService;
        this.userTeamService = userTeamService;
    }

    @GetMapping("/api/user")
    public List<User> index(){
        return userService.findAll();
    }

    @GetMapping("/api/user/find")
    public List<User> findById(String emailId){
        return userService.findByEmailId(emailId);
    }

    @PostMapping("/api/user/save")
    public User save(@RequestBody User user){
        try
        {
            userService.save(user);

          List<Team> teams= teamService.findByOrg_Id(user.getOrg().getId());
         Team  defaultTeam = null;
          for(Team team:teams){
              if (team.getIsDefault().intValue()==1) {
                  defaultTeam = team;
                break  ;
              }
          }
            UserTeam userTeam = new UserTeam();
            userTeam.setTeam(defaultTeam);
            userTeam.setUser(user);
            userTeamService.save(userTeam);
            return user;
        } catch (Exception e) {
            throw e;
        }
    }
}
