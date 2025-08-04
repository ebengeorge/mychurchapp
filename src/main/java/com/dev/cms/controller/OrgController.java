package com.dev.cms.controller;

import com.dev.cms.model.Organization;
import com.dev.cms.model.SaveOrgRequest;
import com.dev.cms.model.Team;
import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import com.dev.cms.service.FileStorageService;
import com.dev.cms.service.OrgService;
import com.dev.cms.service.TeamService;
import com.dev.cms.service.UserService;
import com.dev.cms.service.UserTeamService;
import com.dev.cms.utils.Constants;
import com.dev.cms.utils.EncryptionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.time.Instant;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/org")
public class OrgController {

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private OrgService orgService;

    @Autowired
    private TeamService teamService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserTeamService userTeamService;

    // New GET mapping to supply data to DataTables
    @GetMapping
    public List<Organization> findAllOrganizations() {
        return orgService.findByIsActiveAndIsExclusive(Boolean.TRUE, (byte) 0);
    }

    @GetMapping("/{id}")
    public Optional<Organization> getOrganization(@PathVariable int id) {
        return orgService.findById(id);
    }

    @DeleteMapping("/{id}")
    public void deleteOrganization(@PathVariable int id) {
        orgService.updateIsActiveById(id, false);
    }

    // New save method that accepts multipart/form-data
    @PostMapping(value = "/save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> saveOrganization(@ModelAttribute SaveOrgRequest request,
                                              @RequestParam(required = false) String adminUserId) {
        try {
            // Save the uploaded image file if provided
            String logoFileName = null;
            boolean logoFileExists = false;
            if (request.getOrgLogo() != null && !request.getOrgLogo().isEmpty()) {
                logoFileExists = true;
                logoFileName = fileStorageService.saveImage(request.getOrgLogo());
            }
            Organization org = null;
            if(request.getId()!=null){
                // Update
             Optional<Organization> o = orgService.findById(request.getId());
             if(o.isPresent()){
                 org = o.get();
             }
            } else {
                // New Entry
                org = new Organization();
                org.setCreatedOn(Instant.now());
            }
            // Populate the Organization entity
            assert org != null;
            org.setOrgName(request.getOrgName());
            org.setIsExclusive(request.getIsExclusive());
            org.setAddress(request.getAddress());
            org.setIsActive(Boolean.TRUE);
            org.setTheme(request.getTheme());
            if(logoFileExists) {
                org.setImgUrl(logoFileName);
            } else {
                org.setImgUrl(org.getImgUrl());
            }
            org.setIsExclusive(Byte.valueOf("0"));
            orgService.save(org);

            // Create the default team
            Team team = new Team();
            team.setOrg(org);
            team.setDescription("Members of " + org.getOrgName());
            team.setName(org.getOrgName() + " Members");
            team.setIsDefault(Byte.valueOf("1"));
            team.setIsActive(Boolean.TRUE);
            teamService.save(team);

            // Optionally, create an admin user if adminUserId is provided
            if (adminUserId != null && !adminUserId.isEmpty()) {
                User admin = new User();
                admin.setEmail(adminUserId);
                admin.setUsername(adminUserId);
                admin.setPassword(EncryptionUtil.hashPassword(adminUserId));
                admin.setIsActive(Byte.valueOf("1"));
                admin.setCreatedOn(Instant.now());
                admin.setRole(Constants.ROLE_ADMIN);
                admin.setOrg(org);
                admin = userService.save(admin);

                // Map the admin user to the team
                UserTeam ut = new UserTeam();
                ut.setTeam(team);
                ut.setUser(admin);
                userTeamService.save(ut);
            }

            return ResponseEntity.ok(org);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error saving organization: " + e.getMessage());
        }
    }
}
