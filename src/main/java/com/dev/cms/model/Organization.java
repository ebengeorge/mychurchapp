package com.dev.cms.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

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

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_on")
    private Instant createdOn;

    @Lob
    @Column(name = "address")
    private String address;

    @Column(name = "is_active")
    private Boolean isActive;

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

    public Instant getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Instant createdOn) {
        this.createdOn = createdOn;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

}