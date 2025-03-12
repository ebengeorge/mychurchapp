package com.dev.cms.service;

import com.dev.cms.model.Organization;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrgService extends JpaRepository<Organization, Integer> {

    @Modifying
    @Transactional
    @Query("UPDATE Organization o SET o.isActive = :isActive WHERE o.id = :id")
    int updateIsActiveById(@Param("id") Integer id, @Param("isActive") Boolean isActive);

    List<Organization> findByIsActiveAndIsExclusive(Boolean isActive, Byte isExclusive);
}

