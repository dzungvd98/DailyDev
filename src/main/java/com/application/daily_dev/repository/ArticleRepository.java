package com.application.daily_dev.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Articles;

import java.util.List;
import java.util.Optional;


@Repository
public interface ArticleRepository extends JpaRepository<Articles, Integer>{
    Optional<Articles> findByLink(String link);

    @Query("SELECT a FROM Article a")
    List<Articles> findTopArticlesByReactionCount(Pageable pageable);
}
