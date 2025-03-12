package com.dev.cms.controller;

import com.dev.cms.model.Post;
import com.dev.cms.service.PostService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("/api/post")
public class PostController {

    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @PostMapping("/save")
    public Post savePost(@RequestBody Post post) {
        return postService.save(post);
    }

    @DeleteMapping("/{id}")
    public void deletePost(@PathVariable int id) {
        postService.deleteById(id);
    }

    @GetMapping("/timeline")
    public List<Post> getTimeline() {
        return postService.findAll();
    }
  

}
