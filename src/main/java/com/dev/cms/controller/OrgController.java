package com.dev.cms.controller;

import com.dev.cms.model.Organization;
import com.dev.cms.model.Team;
import com.dev.cms.service.OrgService;
import com.dev.cms.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/org")
public class OrgController {

    private final OrgService orgService;
    private final TeamService teamService;

    @Autowired
    public OrgController(OrgService orgService,
                         TeamService teamService) {
        this.orgService = orgService;
        this.teamService = teamService;
    }

    @GetMapping("/{id}")
    public Optional<Organization> getOrganization(@PathVariable int id) {
        return orgService.findById(id);
    }

    @GetMapping
    public List<Organization> findAllOrganization() {
        return orgService.findAll();
    }

    @PostMapping("/save")
    public Organization save(@RequestBody Organization org) {
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
            return org;
        } catch (Exception e) {
           throw e;
        }
    }

}
