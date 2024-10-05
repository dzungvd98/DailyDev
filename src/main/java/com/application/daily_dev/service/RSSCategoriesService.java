package com.application.daily_dev.service;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Articles;
import com.application.daily_dev.entity.Categories;
import com.application.daily_dev.entity.RssSources;
import com.application.daily_dev.model.SourceType;
import com.application.daily_dev.repository.ArticleRepository;
import com.application.daily_dev.repository.RSSSourceRepository;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

@Service
public class RSSCategoriesService {

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private RSSSourceRepository rssSourceRepository;

    public void fetchAndStoreArticlesByCategory(Categories category) throws IOException, FeedException {
        String topicUrl = category.getTopicUrl();

        URL feedSource = new URL(topicUrl);
        SyndFeedInput input = new SyndFeedInput();
        SyndFeed feed = input.build(new XmlReader(feedSource));

        for (SyndEntry entry : feed.getEntries()) {
            if (!isArticleExist(entry.getLink())) {
                saveNewArticle(category, entry);
            }
        }
        updateTimeFetchDataRssSource(category.getRssSource());
    }

    // Function check is article exist in database
    public boolean isArticleExist(String link) {
        return articleRepository.findByLink(link).isPresent();
    }

    // Create new article
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

        articleRepository.save(article);
    }

    // Save last fetch time
    public void updateTimeFetchDataRssSource(RssSources rssSource) {
        rssSource.setLastFetchedAt(LocalDateTime.now());
        rssSourceRepository.save(rssSource);
    }
}
