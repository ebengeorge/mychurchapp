package com.dev.cms.controller;

import com.dev.cms.model.Organization;
import com.dev.cms.service.OrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/org") // Base path for organization-related endpoints
public class OrgController {

    private final OrgService orgService;

    @Autowired
    public OrgController(OrgService orgService) {
        this.orgService = orgService;
    }

    @GetMapping("/{id}")
    public Organization getOrganization(@PathVariable int id) {
        return orgService.getOrg(id)
                .orElseThrow(() -> new RuntimeException("Organization not found for id: " + id));
    }
}
