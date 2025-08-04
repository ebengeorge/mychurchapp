package com.dev.cms.model;

import java.time.Instant;


public class TimelineResponse {
    private Integer id;
    private String title;
    private String content;
    private User author;
    private Instant createdAt;
    private Instant updatedAt;
    private Team team;
    private Integer cUpvote;
    private Integer cDownvote;
    private Integer cComment;
    private Boolean upvoted;
    private Boolean downvoted;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public Integer getCUpvote() {
        return cUpvote;
    }

    public void setCUpvote(Integer cUpvote) {
        this.cUpvote = cUpvote;
    }

    public Integer getCDownvote() {
        return cDownvote;
    }

    public void setCDownvote(Integer cDownvote) {
        this.cDownvote = cDownvote;
    }

    public Integer getCComment() {
        return cComment;
    }

    public void setCComment(Integer cComment) {
        this.cComment = cComment;
    }

    public Boolean getUpvoted() {
        return upvoted;
    }

    public void setUpvoted(Boolean upvoted) {
        this.upvoted = upvoted;
    }

    public Boolean getDownvoted() {
        return downvoted;
    }

    public void setDownvoted(Boolean downvoted) {
        this.downvoted = downvoted;
    }

    

}