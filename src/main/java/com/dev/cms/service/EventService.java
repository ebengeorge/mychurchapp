package com.dev.cms.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dev.cms.model.Event;

@Repository

public interface EventService extends JpaRepository<Event, Integer> {
    @Query("select e from Event e where e.team.id = ?1")
   List<Event> findByTeam(Integer teamId);
}

