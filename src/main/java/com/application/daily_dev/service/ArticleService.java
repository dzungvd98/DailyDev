package com.application.daily_dev.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Articles;
import com.application.daily_dev.repository.ArticleRepository;

@Service
public class ArticleService {
    @Autowired
    private ArticleRepository articleRepository;

    public Page<Articles> getArticlesTopView(int page, int size, int minusDays) {
        LocalDateTime startDate = LocalDateTime.now().minusDays(minusDays); 
        Pageable pageable = PageRequest.of(page, size);
        return articleRepository.findTopArticlesByReactionCount(startDate, pageable);
    }


}
