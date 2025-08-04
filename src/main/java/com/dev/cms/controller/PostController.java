package com.dev.cms.controller;

import com.dev.cms.CmsApplication;
import com.dev.cms.model.Comment;
import com.dev.cms.model.Post;
import com.dev.cms.model.Reaction;
import com.dev.cms.model.TimelineResponse;
import com.dev.cms.service.CommentService;
import com.dev.cms.service.PostService;
import com.dev.cms.service.ReactionService;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/post")
public class PostController {

    private final CmsApplication cmsApplication;

    private final PostService postService;
    private final CommentService commentService;
    private final ReactionService reactionService;
    @Autowired
    public PostController(PostService postService, CommentService commentService,  ReactionService reactionService, CmsApplication cmsApplication) {
        this.postService = postService;
        this.commentService = commentService;
        this.reactionService = reactionService;
        this.cmsApplication = cmsApplication;
    }

    @PostMapping("/save")
    public Post savePost(@RequestBody Post post) {
        post.setCreatedAt(Instant.now());
        post.setCComment(Integer.valueOf(0));
        post.setCUpvote(Integer.valueOf(0));
        post.setCDownvote(Integer.valueOf(0));
        return postService.save(post);
    }

    @DeleteMapping("/{id}")
    public void deletePost(@PathVariable int id) {
        postService.deleteById(id);
    }

    @PostMapping("/timeline")
    public List<TimelineResponse> getTimeline(@RequestBody Integer[] groupIds) {
        List<TimelineResponse> finalList = new ArrayList<TimelineResponse>();
        List<Post> posts = new ArrayList<Post>();
        
        for (int i = 0; i < groupIds.length; i++) {
            posts.addAll( postService.findByTeam(groupIds[i]));
        }
        posts = sortPostsByCreatedAtDescending(posts);
        
        for (Post post : posts) {
            TimelineResponse ti = new TimelineResponse();
            ti.setId(post.getId());    
            ti.setTitle(post.getTitle());
            ti.setContent(post.getContent());
            ti.setAuthor(post.getAuthor());
            ti.setTeam(post.getTeam());
            ti.setCComment(post.getCComment());
            ti.setCDownvote(post.getCDownvote());
            ti.setCUpvote(post.getCUpvote());
            ti.setCreatedAt(post.getCreatedAt());
           
            List<Reaction> reactions = reactionService.findByPost(post.getId(), 13);
            if(reactions!=null&& !reactions.isEmpty()){
                if("Y".equalsIgnoreCase(reactions.getFirst().getReactionType())) {
                    ti.setUpvoted(true);
                    ti.setDownvoted(false);
                } else    if("N".equalsIgnoreCase(reactions.getFirst().getReactionType())) {
                    ti.setUpvoted(false);
                    ti.setDownvoted(true);
                } else {
                    ti.setUpvoted(false);
                    ti.setDownvoted(false);
                }
            } else {
                ti.setUpvoted(false);
                ti.setDownvoted(false);
            }
           finalList.add(ti);
        }
        return finalList;
    }
  
    @GetMapping("/comments/{id}")
    public List<Comment> commentsByPost(@PathVariable int id) {
        System.out.println(id);
        return commentService.findByPost(id);
    }

     public static List<Post> sortPostsByCreatedAtDescending(List<Post> posts) {
        return posts.stream()
                    .sorted((post1, post2) -> post2.getCreatedAt().compareTo(post1.getCreatedAt())) // Descending order
                    .collect(Collectors.toList());
    }
}
