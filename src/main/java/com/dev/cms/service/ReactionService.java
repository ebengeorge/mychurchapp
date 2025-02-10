package com.dev.cms.service;

import com.dev.cms.model.Reaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReactionService extends JpaRepository<Reaction, Integer> {
}
