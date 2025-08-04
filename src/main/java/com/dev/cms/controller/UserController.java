package com.dev.cms.controller;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.dev.cms.model.Organization;
import com.dev.cms.model.Team;
import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.OrgService;
import com.dev.cms.service.TeamService;
import com.dev.cms.service.UserService;
import com.dev.cms.service.UserTeamService;
import com.dev.cms.utils.EncryptionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserService userService;
    private final TeamService teamService;
    private final UserTeamService userTeamService;
    private final OrgService orgService; // Added OrgService for organization handling

    @Autowired
    public UserController(UserService userService, TeamService teamService, UserTeamService userTeamService, OrgService orgService) {
        this.userService = userService;
        this.teamService = teamService;
        this.userTeamService = userTeamService;
        this.orgService = orgService;
    }

    @GetMapping
    public List<User> index(@RequestParam(required = false) Integer orgId) {
        if (orgId != null) {
            return userService.findByOrgAndisActive(orgId, Byte.valueOf("1") ) ;
        }
        return null;
    }

    @GetMapping("/find")
    public List<User> findById(@RequestParam String emailId) {
        return userService.findByEmailId(emailId);
    }

    /**
     * Save or update a User and assign them to a team.
     * If a teamId is provided, assign the user to that team.
     * Otherwise, find the default team in the user's organization.
     */
    @PostMapping("/save")
    public User save(@RequestBody User user) {
        try {
            user.setPassword(EncryptionUtil.hashPassword(user.getEmail()));
            user.setIsActive(Byte.valueOf("1"));
            user.setCreatedOn(Instant.now());
            userService.save(user);
            List<Team> teams = teamService.findTeamsByOrgIdAndIsActiveAndIsDefault(user.getOrg().getId(), Boolean.TRUE, Byte.valueOf("1"));
            UserTeam userTeam = new UserTeam();
            userTeam.setUser(user);
            userTeam.setTeam(teams.get(0));
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
        List<UserTeam> userTeams = userTeamService.findByTeamId(teamId);
        return userTeams.stream()
                .map(UserTeam::getUser)
                .collect(Collectors.toList());
    }

    @DeleteMapping("/{id}")
    public boolean deleteUser(@PathVariable int id) {

            userService.findById(id).ifPresent(user -> {
            user.setIsActive(Byte.valueOf("0"));
            userService.save(user);
        });
        return true;
    }

    @GetMapping("/{id}")
    public Optional<User> getUserById(@PathVariable("id") Integer id) {
      return userService.findById(id);
    }


    @GetMapping("/team/unassigned/{teamId}")
    public List<User> getUnassignedUsers(@PathVariable Integer teamId) {
        Optional<Team> team = teamService.findById(teamId);
        List<User> returnList = new ArrayList<>();
        if(team.isPresent()) {
            List<User> allUsers = userService.findByOrgAndisActive(team.get().getOrg().getId(), Byte.valueOf("1"));
            System.out.println("allUsers : " + allUsers.size());
            List<UserTeam> userTeams = userTeamService.findByTeamId(teamId);
            System.out.println("userTeams : " + userTeams.size());
            for (User user : allUsers) {
                boolean found = false;
                for (UserTeam userTeam : userTeams) {
                    if (user.getId() == userTeam.getUser().getId()) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    returnList.add(user);
                } else {
                    System.out.println("removed user : " + user.getEmail());
                }
            }
        }
        return returnList;
    }
}
