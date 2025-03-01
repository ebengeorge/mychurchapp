package com.dev.cms.controller;

import com.dev.cms.model.Event;
import com.dev.cms.model.Post;
import com.dev.cms.service.EventService;
import com.dev.cms.service.PostService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/api/event")
public class EventController {
    
    private final EventService eventService;
    private final PostService postService;

    @Autowired
    public EventController(EventService eventService, PostService postService) {
        this.eventService = eventService;
        this.postService = postService;
    }

    @PostMapping("/save")
    public Event createEvent(@RequestBody Event e) {
        if(e.getId() == null) {
            e.setCreatedAt(Instant.now());
        }
        e.setUpdatedAt(Instant.now());
        e = eventService.save(e);
        Post post = new Post();
        post.setTitle("New Event Created ");
        post.setContent(e.getTitle()+ "<br>" + e.getDescription() + "<br> Time: " + e.getStartAt() + " to " + e.getEndAt());
        post.setAuthor(e.getCreatedBy());
        post.setCreatedAt(Instant.now());
        post.setTeam(e.getTeam());
        postService.save(post);
        return e;
    }

    
    @GetMapping("/calendar")
    public List<Event> calendar() {
        return eventService.findAll();
    }
}
