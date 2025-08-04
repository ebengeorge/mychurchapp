package com.dev.cms.controller;

import com.dev.cms.model.Comment;
import com.dev.cms.model.Post;
import com.dev.cms.service.CommentService;
import com.dev.cms.service.PostService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/api/comment")
public class CommentController {

    private final CommentService commentService;
    private final PostService postService;

    @Autowired
    public CommentController(CommentService commentService, PostService postService) {
        this.commentService = commentService;
        this.postService = postService;
    }

    @SuppressWarnings("removal")
    @PostMapping("/save")
    public Comment createComment(@RequestBody Comment comment) {
        comment.setCreatedAt(Instant.now());
        comment = commentService.save(comment);
        Optional<Post> opost = postService.findById(comment.getPost().getId());
        if(opost.isPresent()) {
            Post p = opost.get();
            p.setCComment(new Integer(p.getCComment().intValue() + 1));
            postService.save(p);
        }
        return comment;
    }

    @DeleteMapping("/{id}")
    public void deleteComment(@PathVariable int id) {
        commentService.deleteById(id);
    }


    
}
