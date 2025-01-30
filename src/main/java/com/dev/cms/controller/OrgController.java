package com.dev.cms.controller;

import com.dev.cms.service.OrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/org")
public class OrgController {

    private final OrgService orgService;

    @Autowired
    public OrgController(OrgService orgService) {
        this.orgService = orgService;
    }
    @GetMapping("/{id}")
    public Optional<Organization> getOrganization(@PathVariable int id) {
        return orgService.findById(id);
    }
    @PostMapping("/save")
    public Organization save(@RequestBody Organization org) {
       return orgService.save(org);
    }

}
