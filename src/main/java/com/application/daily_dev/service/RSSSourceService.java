package com.application.daily_dev.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.daily_dev.entity.Categories;
import com.application.daily_dev.entity.RssSources;
import com.application.daily_dev.repository.CategoryRepository;
import com.application.daily_dev.repository.RSSSourceRepository;
import com.rometools.rome.io.FeedException;

@Service
public class RSSSourceService {
    @Autowired
    private RSSCategoriesService rssCategoriesService;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private RSSSourceRepository rssSourceRepository;

    @Transactional
    public void fetchAndStoreArticlesInSource(RssSources rss) throws IOException, FeedException {
        List<Categories> categories = categoryRepository.findByRssSource(rss);
        System.out.println(categories.size());
        for(Categories category : categories) {
            rssCategoriesService.fetchAndStoreArticlesByCategory(category);
        }
    }

    @Transactional
    public void fetchAndStoreArticles() throws IOException, FeedException {
        List<RssSources> sources = rssSourceRepository.findAll();
        for(RssSources rss : sources) {
            fetchAndStoreArticlesInSource(rss);
        }
    }
}
