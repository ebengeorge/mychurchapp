package com.dev.cms.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "organization")
public class Organization {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "org_id", nullable = false)
    private Integer id;

    @Column(name = "org_name", nullable = false)
    private String orgName;

    @ColumnDefault("0")
    @Column(name = "is_exclusive")
    private Byte isExclusive;

    @ColumnDefault("'CURRENT_TIMESTAMP'")
    @Column(name = "created_on", length = 45)
    private String createdOn;

    @Lob
    @Column(name = "address")
    private String address;

    @OneToMany(mappedBy = "org")
    private Set<User> users = new LinkedHashSet<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public Byte getIsExclusive() {
        return isExclusive;
    }

    public void setIsExclusive(Byte isExclusive) {
        this.isExclusive = isExclusive;
    }

    public String getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(String createdOn) {
        this.createdOn = createdOn;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Organization(Integer id, String orgName, Byte isExclusive, String createdOn, String address, Set<User> users) {
        this.id = id;
        this.orgName = orgName;
        this.isExclusive = isExclusive;
        this.createdOn = createdOn;
        this.address = address;
        this.users = users;
    }

    public Organization() {
 
    }


    
}

