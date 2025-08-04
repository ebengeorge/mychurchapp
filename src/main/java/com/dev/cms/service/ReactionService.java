package com.dev.cms.service;

import com.dev.cms.model.Reaction;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ReactionService extends JpaRepository<Reaction, Integer> {
    @Query("select c from Reaction c where c.post.id = ?1 and c.user.id=?2")
    List<Reaction> findByPost(int postId, int userId);

    @Query("select c from Reaction c where c.post.id = ?1 and c.user.id=?2 and reactionType=?3")
    List<Reaction> findByPostAndReaction(int postId, int userId, String reaction);
}
