package com.dev.cms.controller;

import com.dev.cms.model.Organization;
import com.dev.cms.model.Team;
import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.OrgService;
import com.dev.cms.service.TeamService;
import com.dev.cms.service.UserService;
import com.dev.cms.service.UserTeamService;
import com.dev.cms.utils.Constants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/org")
public class OrgController {

    private final OrgService orgService;
    private final TeamService teamService;
    private final UserService userService;
    private final UserTeamService userTeamService;

    @Autowired
    public OrgController(OrgService orgService,
                         TeamService teamService, 
                          UserService userService,UserTeamService userTeamService) {
        this.orgService = orgService;
        this.teamService = teamService;
        this.userService = userService;
        this.userTeamService = userTeamService;
    }

    @GetMapping("/{id}")
    public Optional<Organization> getOrganization(@PathVariable int id) {
        return orgService.findById(id);
    }

    @GetMapping
    public List<Organization> findAllOrganization() {
        return orgService.findByIsActiveAndIsExclusive(Boolean.TRUE, (byte) 0);
    }

    @DeleteMapping("/{id}")
    public void deleteOrganization(@PathVariable int id) {
        orgService.updateIsActiveById(id, false);
    }

    @PostMapping("/save")
    public Organization save(@RequestBody Organization org,  @RequestParam String adminUserId) {
        try {
            orgService.save(org);
            Team team;
            team = new Team();
            team.setOrg(org);
            team.setDescription("Members of " + org.getOrgName());
            team.setName(org.getOrgName() + " Members");
            team.setIsDefault(Byte.valueOf("1"));
            System.out.println(team);
            teamService.save(team);
            if (adminUserId != null && adminUserId != "") {
                User admin = new User();
                admin.setEmail(adminUserId);
                admin.setUsername(adminUserId);
                admin.setPassword(adminUserId);
                admin.setIsActive(Byte.valueOf("1"));
                admin.setCreatedOn(Instant.now());
                admin.setRole(Constants.ROLE_ADMIN);
                admin.setOrg(org);
                admin = userService.save(admin);
                UserTeam ut = new UserTeam();
                ut.setTeam(team);
                ut.setUser(admin);
                userTeamService.save(ut);
            }
            return org;
        } catch (Exception e) {
           throw e;
        }
    }

}
