package com.dev.cms.controller;

import com.dev.cms.model.Reaction;
import com.dev.cms.service.ReactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/reaction")
public class ReactionController {

    private final ReactionService reactionService;

    @Autowired
    public ReactionController(ReactionService reactionService) {
        this.reactionService = reactionService;
    }

    @PostMapping
    public Reaction saveReaction(@RequestBody Reaction reaction) {
        return reactionService.save(reaction);
    }

    @DeleteMapping("/{id}")
    public void deleteReaction(@PathVariable int id) {
        reactionService.deleteById(id);
    }
}
