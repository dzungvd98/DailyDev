package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Topics;

@Repository
public interface TopicRepository extends JpaRepository<Topics, Integer>{
    boolean existsByName(String name);
}
