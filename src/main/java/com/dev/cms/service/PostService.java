package com.dev.cms.service;

import com.dev.cms.model.Post;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PostService extends JpaRepository<Post, Integer> {
   @Query("select p from Post p where p.team.id = ?1 order by p.createdAt desc")
   List<Post> findByTeam(Integer teamId);
 
}
