package com.application.daily_dev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.service.RssService;

@RestController
@RequestMapping("/api/rss")
public class RSSController {
    @Autowired
    private RssService rssService;

    @GetMapping("/fetch/category/{categoryId}")
    public ResponseEntity<String> fetchArticlesByCategory(@PathVariable Integer categoryId) {
        try {
            rssService.fetchAndStoreArticlesByCategory(categoryId);
            return ResponseEntity.ok("RSS articles fetched and stored successfully for category");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to fetch RSS: " + e.getMessage());
        }
    }
}
