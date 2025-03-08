package com.dev.cms.service;

import com.dev.cms.model.User;
import com.dev.cms.model.UserTeam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTeamService extends JpaRepository<UserTeam, Integer> {
    List<UserTeam> findByUser(User user);
    List<UserTeam> findByTeamId(Integer teamId);
}
