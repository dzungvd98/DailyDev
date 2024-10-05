package com.application.daily_dev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.service.RSSSourceService;

@RestController
@RequestMapping("/api/rss")
public class RSSController {
    
    @Autowired
    private RSSSourceService rssService;

    @GetMapping("/fetch/source/{sourceId}")
    public ResponseEntity<String> fetchArticlesBySourceId(@PathVariable Integer sourceId) {
        try {
            rssService.fetchAndStoreArticlesInSource(sourceId);
            return ResponseEntity.ok("RSS articles fetched and stored successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to fetch RSS: " + e.getMessage());
        }
    }


}
