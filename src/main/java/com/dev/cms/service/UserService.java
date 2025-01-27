package com.dev.cms.service;

import java.time.Instant;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dev.cms.model.User;

@Repository
public interface UserService extends JpaRepository<User, Integer>{


@Query("select new User(u.id,\n" + //
        "    u.username,\n" + //
        "    u.email,\n" + //
        "    u.password,\n" + //
        "    u.createdOn, u.role, u.isActive, u.org) from User u where u.email = ?1")
List<User> findByEmailId(String username);

}
