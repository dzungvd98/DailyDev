package com.application.daily_dev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.DTO.RssSourceDTO;
import com.application.daily_dev.entity.RssSources;
import com.application.daily_dev.service.RSSSourceService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/rss")
public class RSSController {
    
    @Autowired
    private RSSSourceService rssService;

    @PostMapping
    public ResponseEntity<?> createNewRssSource(@Valid @RequestBody RssSourceDTO newSource) {
        try {
            RssSources rss = rssService.createNewRssSource(newSource);
            return new ResponseEntity<>(rss, HttpStatus.CREATED);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to create RSS: " + e.getMessage());
        }
    }


}
