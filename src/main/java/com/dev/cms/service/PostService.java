package com.dev.cms.service;

import com.dev.cms.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostService extends JpaRepository<Post, Integer> {
}
