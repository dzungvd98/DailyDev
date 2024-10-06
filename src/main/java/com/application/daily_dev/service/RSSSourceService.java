package com.application.daily_dev.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public void fetchAndStoreArticlesInSource(Integer source_id) throws IOException, FeedException {
        RssSources rss = rssSourceRepository.findById(source_id).get();
        List<Categories> categories = categoryRepository.findByRssSource(rss);
        System.out.println(categories.size());
        for(Categories category : categories) {
            rssCategoriesService.fetchAndStoreArticlesByCategory(category);
        }
    }

    public void fetchAndStoreArticles() throws IOException, FeedException {
        List<RssSources> sources = rssSourceRepository.findAll();
        for(RssSources rss : sources) {
            fetchAndStoreArticlesInSource(rss.getId());
        }
    }
}
