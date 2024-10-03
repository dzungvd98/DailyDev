package com.application.daily_dev.service;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Articles;
import com.application.daily_dev.entity.RSSFeedCategories;
import com.application.daily_dev.entity.RssSources;
import com.application.daily_dev.model.SourceType;
import com.application.daily_dev.repository.ArticleRepository;
import com.application.daily_dev.repository.RSSFeedCategoryRepository;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import com.rometools.rome.io.FeedException;

import java.util.Date;
import java.util.List;

@Service
public class RssService {
    @Autowired
    private RSSFeedCategoryRepository rssFeedCategoryRepository;

    @Autowired
    private ArticleRepository articleRepository;

    // Get article rss by category
    public void fetchAndStoreArticlesByCategory(Integer categoryId) throws IOException, FeedException {
        List<RSSFeedCategories> rssFeedCategories = rssFeedCategoryRepository.findByCategoryId(categoryId);

        for (RSSFeedCategories feedCategory : rssFeedCategories) {
           List<SyndEntry> entries = fetchRSSEntries(feedCategory.getTopicUrl());
           processRSSEntries(entries, feedCategory.getRssSource());
        }
    }

    // Method Check is article exist
    public Boolean isArticleExist(String link) {
        return articleRepository.findByLink(link).isPresent();
    }

    // save new articles
    public void saveArticleFromEntry(SyndEntry entry, RssSources rssSource) {
        // Set value and at article in database
        Articles article = new Articles();
        article.setTitle(entry.getTitle());
        article.setContent(entry.getDescription().getValue());
        article.setLink(entry.getLink());
        Date publishedDate = entry.getPublishedDate();
        article.setCreatedAt(publishedDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
        article.setSourceType(SourceType.RSS);
        article.setRss(rssSource);
        article.setUpdatedAt(LocalDateTime.now());
        articleRepository.save(article);
    }

    // Fetch RSS entries
    private List<SyndEntry> fetchRSSEntries(String topicUrl) throws IOException, FeedException {
        URL feedSource = new URL(topicUrl);
        SyndFeedInput input = new SyndFeedInput();
        SyndFeed feed = input.build(new XmlReader(feedSource));
        return feed.getEntries();
    }

    private void processRSSEntries(List<SyndEntry> entries, RssSources rssSource) {
        for (SyndEntry entry : entries) {
            if (isArticleExist(entry.getLink())) {
                System.out.println("Bài viết đã tồn tại: " + entry.getLink());
                continue;
            }
            saveArticleFromEntry(entry, rssSource);
        }
    }
}
