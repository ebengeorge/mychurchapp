package com.dev.cms.controller;

import com.dev.cms.model.Event;
import com.dev.cms.model.Post;
import com.dev.cms.service.EventService;
import com.dev.cms.service.PostService;
import com.dev.cms.utils.Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


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

    @GetMapping("/{id}")
    public Optional<Event> getById(@PathVariable int id) {
        return eventService.findById(id);
    }
    
 
    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable int id) {
        Optional<Event> e = eventService.findById(id);
        if (e.isPresent()) {
             eventService.delete(e.get());
        }
        return true;
    }
    
    @PostMapping("/save")
    public Event createEvent(@RequestBody Event e) {
        boolean isCreate = false; 
        if(e.getId() == null) {
            e.setCreatedAt(Instant.now());
            isCreate =true;
        }
        e.setUpdatedAt(Instant.now());
        e = eventService.save(e);
        Post post = new Post();
        if(isCreate) {
            post.setTitle("#EVENT# Event Created : " + e.getTitle());
        } else {
            post.setTitle("#EVENT# Event Updated : " + e.getTitle());           
        }
        post.setContent("{\"desc\":\"" + e.getDescription() + "\", \"from\":\"" + Utils.formatInstant(e.getStartAt()) + "\",\"to\":\"" + Utils.formatInstant(e.getEndAt())+"\"}");
        post.setAuthor(e.getCreatedBy());
        post.setCreatedAt(Instant.now());
        post.setCreatedAt(Instant.now());
        post.setCComment(Integer.valueOf(0));
        post.setCUpvote(Integer.valueOf(0));
        post.setCDownvote(Integer.valueOf(0));
        post.setTeam(e.getTeam());
        postService.save(post);
        return e;
    }

    
    @PostMapping("/calendar")
    public List<Event> calendar(@RequestBody Integer[] groupIds) {
         List<Event> finalList = new ArrayList<Event>();
        for (int i = 0; i < groupIds.length; i++) {
            finalList.addAll( eventService.findByTeam(groupIds[i]));
        }
        return finalList;
    }
}
