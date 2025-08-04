package com.dev.cms.controller;

import com.dev.cms.model.Post;
import com.dev.cms.model.Reaction;
import com.dev.cms.service.PostService;
import com.dev.cms.service.ReactionService;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/reaction")
public class ReactionController {

    private final ReactionService reactionService;
    private final PostService postService;

    @Autowired
    public ReactionController(ReactionService reactionService,  PostService postService) {
        this.reactionService = reactionService;
        this.postService = postService;
    }

    @SuppressWarnings("removal")
    @PostMapping("/save")
    public Reaction saveReaction(@RequestBody Reaction reaction) {
        reaction = reactionService.save(reaction);
        Optional<Post> post = postService.findById(reaction.getPost().getId());
        if(post.isPresent()){
            Post p = post.get();
            if("Y".equalsIgnoreCase(reaction.getReactionType())){
                p.setCUpvote(new Integer(p.getCUpvote().intValue() + 1));
            } else if("N".equalsIgnoreCase(reaction.getReactionType())){
                p.setCDownvote(new Integer(p.getCDownvote().intValue() + 1));
            }
          postService.save(p);    
        }
        return reaction;
    }

    @DeleteMapping("/{id}")
    public void deleteReaction(@PathVariable int id) {
        reactionService.deleteById(id);
    }

    @DeleteMapping("/delete")
    public boolean deleteReaction(@RequestBody Reaction reaction) {
        List<Reaction> r = reactionService.findByPostAndReaction(reaction.getPost().getId(), reaction.getUser().getId(), reaction.getReactionType());
        reactionService.deleteById(r.getFirst().getId());
        Optional<Post> po = postService.findById(reaction.getPost().getId());
        if(po.isPresent()){
            Post p = po.get();
            if("Y".equalsIgnoreCase(reaction.getReactionType())){
                p.setCUpvote(p.getCUpvote()-1);
            } else  if("N".equalsIgnoreCase(reaction.getReactionType())){
                p.setCDownvote(p.getCDownvote()-1);
            }
            postService.save(p);
        }
        return true;
    }
}
