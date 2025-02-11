package com.dev.cms.service;

import com.dev.cms.model.Organization;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrgService extends JpaRepository<Organization, Integer> {

}
