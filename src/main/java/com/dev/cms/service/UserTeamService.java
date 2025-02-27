package com.dev.cms.service;

import com.dev.cms.model.UserTeam;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTeamService extends JpaRepository<UserTeam, Integer> {
    List<UserTeam> findByUserId(Long userId);
}
