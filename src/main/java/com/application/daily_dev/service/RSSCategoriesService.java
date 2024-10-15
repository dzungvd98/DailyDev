package com.application.daily_dev.service;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.daily_dev.DTO.CategoryDTO;
import com.application.daily_dev.entity.Articles;
import com.application.daily_dev.entity.Categories;
import com.application.daily_dev.entity.RssSources;
import com.application.daily_dev.entity.Topics;
import com.application.daily_dev.model.SourceType;
import com.application.daily_dev.repository.ArticleRepository;
import com.application.daily_dev.repository.CategoryRepository;
import com.application.daily_dev.repository.RSSSourceRepository;
import com.application.daily_dev.repository.TopicRepository;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RSSCategoriesService {

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private RSSSourceRepository rssSourceRepository;

    @Autowired
    private CategoryRepository categoryRepository;


    @Autowired
    private TopicService topicService;

    @Autowired
    private TopicRepository topicRepository;

    @Transactional
    public void fetchAndStoreArticlesByCategory(Categories category) throws IOException, FeedException {
        String topicUrl = category.getTopicUrl();

        URL feedSource = new URL(topicUrl);
        SyndFeedInput input = new SyndFeedInput();
        SyndFeed feed = input.build(new XmlReader(feedSource));

        for (SyndEntry entry : feed.getEntries()) {
            try {
                if (!isArticleExist(entry.getLink())) {
                    saveNewArticle(category, entry);
                }
            } catch (Exception e) {
                // Write error and continue next
                System.err.println("Error processing entry " + entry.getLink() + ": " + e.getMessage());
            }
            
        }
        updateTimeFetchDataRssSource(category.getRssSource());
    }

    // Function check is article exist in database
    public boolean isArticleExist(String link) {
        return articleRepository.findByLink(link).isPresent();
    }

    // Create new article
    @Transactional
    public void saveNewArticle(Categories category, SyndEntry entry) {
        Articles article = new Articles();
        article.setTitle(entry.getTitle());
        System.out.println(entry.getTitle());
        article.setContent(entry.getDescription().getValue());
        article.setLink(entry.getLink());
        
        // get publish date
        if (entry.getPublishedDate() != null) {
            article.setCreatedAt(entry.getPublishedDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
        } else {
            article.setCreatedAt(LocalDateTime.now());
        }
        article.setUpdatedAt(LocalDateTime.now());
        article.setSourceType(SourceType.RSS);
        article.setRss(category.getRssSource());

        // get thumpnail from enclore 
        if(!entry.getEnclosures().isEmpty()) {
            String imgThumpnailUrl = entry.getEnclosures().get(0).getUrl();
            article.setThumbnailUrl(imgThumpnailUrl); 
        }

        // Set topic for articles
        Optional<Topics> topic = topicRepository.findByName(category.getName());
        if(topic.isPresent()) {
            article.addTopics(topic.get());
        }

        articleRepository.save(article);
    }

    // Save last fetch time
    @Transactional
    public void updateTimeFetchDataRssSource(RssSources rssSource) {
        rssSource.setLastFetchedAt(LocalDateTime.now());
        rssSourceRepository.save(rssSource);
    }

    // Create new categories
    @Transactional
    public Categories createNewCategory(CategoryDTO categoryDTO) {
        // Find RSS by id
        RssSources rss = rssSourceRepository.findById(categoryDTO.getRssSourceId()).orElseThrow(() -> new RuntimeException("RSS Source not found"));
        
        // Check is category exist
        if(categoryRepository.existsByTopicUrlAndName(categoryDTO.getTopicUrl(), categoryDTO.getName())) {
            throw new RuntimeException("Category was existed");
        }
        // Create new category
        Categories category = Categories.builder()
                    .name(categoryDTO.getName())
                    .topicUrl(categoryDTO.getTopicUrl())
                    .rssSource(rss)
                    .build();

        // Save category
        Categories savedCategory = categoryRepository.save(category);

        // ADD category name to TOPIC if it not exist
        topicService.createNewTopicByName(category.getName());

        return savedCategory;
    }
}
