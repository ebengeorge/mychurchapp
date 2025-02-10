package com.dev.cms.service;

import com.dev.cms.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentService extends JpaRepository<Comment, Integer> {
}
