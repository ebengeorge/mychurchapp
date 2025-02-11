package com.dev.cms.controller;

import com.dev.cms.model.Team;
import com.dev.cms.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/team")
public class TeamController {

    private final TeamService teamService;

    @Autowired
    public TeamController(TeamService teamService) {
        this.teamService = teamService;
    }

    @GetMapping("/{id}")
    public Optional<Team> getDepartmentById(@PathVariable int id) {
        return teamService.findById(id);
    }

    @PostMapping
    public Team saveDepartment(@RequestBody Team team) {
        return teamService.save(team);
    }

    @DeleteMapping("/{id}")
    public void deleteDepartment(@PathVariable int id) {
        teamService.deleteById(id);
    }
}
