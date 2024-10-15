package com.application.daily_dev.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.RssSources;

@Repository
public interface RSSSourceRepository extends JpaRepository<RssSources, Integer>{
    boolean existsByWebsite(String websiteUrl);
}
