package com.dev.cms.service;

import com.dev.cms.model.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamService extends JpaRepository<Team, Integer> {
    List<Team> findByName(String name);

    List<Team> findByOrg_Id(Integer orgId);
}
