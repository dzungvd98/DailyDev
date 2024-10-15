package com.application.daily_dev.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Bookmarks;


@Repository
public interface BookmarkRepository extends JpaRepository<Bookmarks, Integer>{
    
    @Query(value = "SELECT * FROM Bookmarks b WHERE b.user_id = :userId", 
           countQuery = "SELECT COUNT(*) FROM Bookmarks b WHERE b.user_id = :userId",
            nativeQuery = true)
    Page<Bookmarks> findByUser(@Param("userId")Integer userId, Pageable pageable);
}
