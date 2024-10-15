package com.application.daily_dev.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.application.daily_dev.entity.Comments;


public interface CommentRepository extends JpaRepository<Comments, Integer> {

    @Query(value = "SELECT * From Comments c WHERE  c.article_id = :articleId", 
           countQuery = "SELECT COUNT(*) FROM comments c WHERE c.article_id = :articleId",
           nativeQuery = true)
    Page<Comments> findByArticleId(@Param("articleId") int articleId, Pageable pageable);
}
