package com.application.daily_dev.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Articles;

import java.time.LocalDateTime;
import java.util.Optional;


@Repository
public interface ArticleRepository extends JpaRepository<Articles, Integer>{
    Optional<Articles> findByLink(String link);

    @Query("SELECT a, COALESCE(COUNT(r), 0) as reactionCount " +
       "FROM Articles a " +
       "LEFT JOIN a.articlesReactions r " +
       "WHERE a.createdAt >= :startDate " +
       "GROUP BY a " +
       "ORDER BY reactionCount DESC, a.createdAt DESC")
    Page<Articles> findTopArticlesByReactionCount(@Param("startDate") LocalDateTime startDate, Pageable pageable);

    // Select articles pagination for each person
    @Query("SELECT a, COALESCE(COUNT(r), 0) as reactionCount " +
           "FROM Articles a " +
           "LEFT JOIN a.articlesReactions r " +
           "JOIN a.topics t " +
           "JOIN t.followingTopics s " +
           "WHERE s.user.id = :userId " +
           "GROUP BY a " +
           "ORDER BY reactionCount DESC, a.createdAt")
    Page<Articles> findPersonalizedArticlesByUser(@Param("userId") int userId, Pageable pageable);
}
