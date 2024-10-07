package com.application.daily_dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Articles;
import com.application.daily_dev.repository.ArticleRepository;

@Service
public class ArticleService {
    @Autowired
    private ArticleRepository articleRepository;

    public List<Articles> getArticlesTopView(int page) {
        Pageable pageable = PageRequest.of(page, 10);
        return articleRepository.findTopArticlesByReactionCount(pageable);
        
    }
}
