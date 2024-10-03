package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Categories;

@Repository
public interface CategoryRepository extends JpaRepository<Categories, Integer>{
    
}
