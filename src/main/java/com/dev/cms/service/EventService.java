package com.dev.cms.service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dev.cms.model.Event;
@Repository

public interface EventService extends JpaRepository<Event, Integer> {
}

