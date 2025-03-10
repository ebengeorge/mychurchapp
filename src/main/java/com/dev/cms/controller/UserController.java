package com.dev.cms.controller;

import java.util.List;
import java.util.stream.Collectors;

import com.dev.cms.model.Team;
import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.TeamService;
import com.dev.cms.service.UserTeamService;
import com.dev.cms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
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

    @GetMapping
    public List<User> index() {
        return userService.findAll();
    }

    @GetMapping("/find")
    public List<User> findById(@RequestParam String emailId) {
        return userService.findByEmailId(emailId);
    }

    /**
     * Save a user and assign them to a team.
     * If a teamId is provided, assign the user to that team.
     * Otherwise, find the default team in the user's organization.
     */
    @PostMapping("/save")
    public User save(@RequestBody User user, @RequestParam(required = false) Integer teamId) {
        try {
            userService.save(user);
            Team team;
            if (teamId != null) {
                team = teamService.findById(teamId)
                        .orElseThrow(() -> new RuntimeException("Team not found"));
            } else {
                // Use the updated method name: findByOrgId
                List<Team> teams = teamService.findByOrgId(user.getOrg().getId());
                team = teams.stream()
                        .filter(t -> t.getIsDefault() != null && t.getIsDefault().intValue() == 1)
                        .findFirst()
                        .orElseThrow(() -> new RuntimeException("Default team not found"));
            }
            UserTeam userTeam = new UserTeam();
            userTeam.setTeam(team);
            userTeam.setUser(user);
            userTeamService.save(userTeam);
            return user;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * Get all users that are assigned to a given team.
     */
    @GetMapping("/team/{teamId}")
    public List<User> getUsersByTeam(@PathVariable Integer teamId) {
        // Assuming userTeamService has a method findByTeamId; if not, implement it accordingly.
        List<UserTeam> userTeams = userTeamService.findByTeamId(teamId);
        return userTeams.stream()
                .map(UserTeam::getUser)
                .collect(Collectors.toList());
    }
}
