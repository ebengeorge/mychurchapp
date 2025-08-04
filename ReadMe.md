
post.java

@JsonIgnore
@OneToMany(mappedBy = "post")
private Set<Comment> comments = new LinkedHashSet<>();

@JsonIgnore
@OneToMany(mappedBy = "post")
private Set<Reaction> reactions = new LinkedHashSet<>();
 

user.java
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
 