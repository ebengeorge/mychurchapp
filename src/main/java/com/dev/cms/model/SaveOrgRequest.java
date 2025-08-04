package com.dev.cms.model;

import org.springframework.web.multipart.MultipartFile;

public class SaveOrgRequest {
    private Integer id;
    private String orgName;
    private Byte isExclusive;
    private String address;
    private Boolean isActive;
    private MultipartFile orgLogo;
    private String theme;

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

    public MultipartFile getOrgLogo() {
        return orgLogo;
    }

    public void setOrgLogo(MultipartFile orgLogo) {
        this.orgLogo = orgLogo;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }
}
