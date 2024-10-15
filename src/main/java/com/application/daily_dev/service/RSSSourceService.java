package com.application.daily_dev.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.daily_dev.DTO.CategoryDTO;
import com.application.daily_dev.DTO.RssSourceDTO;
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

    @Transactional
    // Handle create category from rss link
    public void extractAndSaveCategoryFromSourceLink(RssSources rss) {
        try {
            // Connect to url and get html document
            Document doc = Jsoup.connect(rss.getRssUrl()).get();

            // Get all a of rss category
            Elements links = doc.select(rss.getContentSelector());

            for (Element link : links) {
                String href = link.attr("href");
                String title = link.attr("title");

                // Create categoryDTO to create new category
                createCategoryByLink(rss, href, title);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Create category from link tag a
    @Transactional
    public void createCategoryByLink(RssSources rss, String href, String title) {
        CategoryDTO category = new CategoryDTO();
        category.setName(title);
        category.setRssSourceId(rss.getId());
        // Check is href of category is contain all link or just rss/...
        if(href.contains("http")) {
            category.setTopicUrl(href);
        } else {
            category.setTopicUrl(rss.getWebsite() + href);
        }
        
        rssCategoriesService.createNewCategory(category);
    }

    @Transactional
    public RssSources createNewRssSource(RssSourceDTO newSource) {

        if(rssSourceRepository.existsByWebsite(newSource.getWebsiteUrl())) {
            throw new RuntimeException("Source url is exist");
        }
        RssSources rss = new RssSources();
        rss.setRssUrl(newSource.getRssUrl());
        rss.setContentSelector(newSource.getContentSelector());
        rss.setCreatedAt(LocalDateTime.now());
        rss.setLastFetchedAt(LocalDateTime.now());
        rss.setSourceName(newSource.getSourceName());
        rss.setWebsite(newSource.getWebsiteUrl());
        RssSources newSourceCreated = rssSourceRepository.save(rss);
        
        //if success extract link and create category
        extractAndSaveCategoryFromSourceLink(newSourceCreated);
        return newSourceCreated; 
    }
}
