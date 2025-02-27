package com.dev.cms.controller;

import com.dev.cms.model.Event;
import com.dev.cms.service.EventService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/event")
public class EventController {
    
    private final EventService eventService;

    @Autowired
    public EventController(EventService eventService) {
        this.eventService = eventService;
    }

    @PostMapping("/save")
    public Event createEvent(@RequestBody Event e) {
        return eventService.save(e);
    }

    
    @GetMapping("/calendar")
    public List<Event> calendar() {
        return eventService.findAll();
    }
}
