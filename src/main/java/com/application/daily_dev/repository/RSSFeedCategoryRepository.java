package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.application.daily_dev.entity.RSSFeedCategories;
import java.util.List;


public interface RSSFeedCategoryRepository extends JpaRepository<RSSFeedCategories, Integer>{
    List<RSSFeedCategories> findByCategoryId(Integer categoryId);    
}
