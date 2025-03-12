package com.dev.cms.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "username", nullable = false, length = 64)
    private String username;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "password", nullable = false, length = 64)
    private String password;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_on")
    private Instant createdOn;

    @ColumnDefault("'user'")
    @Lob
    @Column(name = "role", nullable = false)
    private String role;

    @ColumnDefault("1")
    @Column(name = "is_active")
    private Byte isActive;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "org_id", nullable = false)
    private Organization org;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    private Set<Comment> comments = new LinkedHashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "createdBy")
    private Set<Event> events = new LinkedHashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "author")
    private Set<Post> posts = new LinkedHashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    private Set<Reaction> reactions = new LinkedHashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    private Set<UserTeam> userTeams = new LinkedHashSet<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Instant getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Instant createdOn) {
        this.createdOn = createdOn;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Byte getIsActive() {
        return isActive;
    }

    public void setIsActive(Byte isActive) {
        this.isActive = isActive;
    }

    public Organization getOrg() {
        return org;
    }

    public void setOrg(Organization org) {
        this.org = org;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Set<Event> getEvents() {
        return events;
    }

    public void setEvents(Set<Event> events) {
        this.events = events;
    }

    public Set<Post> getPosts() {
        return posts;
    }

    public void setPosts(Set<Post> posts) {
        this.posts = posts;
    }

    public Set<Reaction> getReactions() {
        return reactions;
    }

    public void setReactions(Set<Reaction> reactions) {
        this.reactions = reactions;
    }

    public Set<UserTeam> getUserTeams() {
        return userTeams;
    }

    public void setUserTeams(Set<UserTeam> userTeams) {
        this.userTeams = userTeams;
    }

}