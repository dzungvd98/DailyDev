package com.application.daily_dev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.service.ArticleService;

@RestController
@RequestMapping("/api/articles")
public class ArticleController {
    
    @Autowired
    private ArticleService articleService;

    @GetMapping("/top-view")
    public ResponseEntity<?> getTopViewArticles(@RequestParam(defaultValue = "0") int page,
                                                @RequestParam(defaultValue = "10") int size,
                                                @RequestParam(defaultValue = "3") int numDayBefore) {
        try {
            return ResponseEntity.ok(articleService.getArticlesTopView(page, size, numDayBefore));
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    
}
