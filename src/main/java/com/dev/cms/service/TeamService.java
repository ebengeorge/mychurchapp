package com.dev.cms.service;

import com.dev.cms.model.Organization;
import com.dev.cms.model.Team;
import jakarta.persistence.*;
import jakarta.transaction.Transactional;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamService extends JpaRepository<Team, Integer> {
    List<Team> findByName(String name);

    // Updated method name to clearly indicate filtering by organization ID
    List<Team> findByOrgId(Integer orgId);

    @Modifying
    @Transactional
    @Query("UPDATE Team o SET o.isActive = :isActive WHERE o.id = :id")
    int updateIsActiveById(@Param("id") Integer id, @Param("isActive") Boolean isActive);
    @Query("SELECT t FROM Team t WHERE t.org.id = :orgId AND t.isActive = :isActive")
    List<Team> findTeamsByOrgIdAndIsActive(@Param("orgId") Integer orgId, @Param("isActive") Boolean isActive);



}
