package com.dev.cms.service;

import com.dev.cms.model.Comment;
import com.dev.cms.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentService extends JpaRepository<Comment, Integer> {
    @Query("select c from Comment c where c.post.id = ?1 order by c.id desc")
    List<Comment> findByPost(int postId);
}
