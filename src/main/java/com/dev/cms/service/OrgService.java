package com.dev.cms.service;

import com.dev.cms.model.Organization;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OrgService extends JpaRepository<Organization, Integer> {

    // Custom query to fetch Organization details by id
    @Query("SELECT o FROM Organization o WHERE o.id = ?1")
    Optional<Organization> getOrg(int id);
}
