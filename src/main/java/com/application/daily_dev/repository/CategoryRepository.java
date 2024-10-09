package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Categories;
import com.application.daily_dev.entity.RssSources;

import java.util.List;
import java.util.Optional;


@Repository
public interface CategoryRepository extends JpaRepository<Categories, Integer>{
    List<Categories> findByRssSource(RssSources rssSource);
    Optional<Categories> findByTopicUrl(String topicUrl);
    boolean existsByTopicUrlAndName(String url, String name);
}
