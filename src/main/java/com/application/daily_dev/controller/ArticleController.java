package com.application.daily_dev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching top-view articles: " +  e.getMessage());
        }
    }

    @GetMapping("/user/{userId}/feed")
    public ResponseEntity<?> getNewFeedForEachPerson(@RequestParam(defaultValue = "0") int page,
                                                     @RequestParam(defaultValue = "10") int size,
                                                     @PathVariable int userId) {
        try {
            return ResponseEntity.ok(articleService.getNewFeedForEachUser(page, size, userId));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching new feed for user: " + e.getMessage());
        }
    }

    @GetMapping("/search")
    public ResponseEntity<?> searchArticles(@RequestParam(defaultValue = "0") int page,
                                            @RequestParam(defaultValue = "10") int size,
                                            @RequestParam(defaultValue = "a") String searchTerm) {
        try {
            return ResponseEntity.ok(articleService.searchArticles(page, size, searchTerm));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("Error searching articles: " + e.getMessage());
        }
    }

    @GetMapping("/topic/{topicId}")
    public ResponseEntity<?> getArticlesByTopic(@RequestParam(defaultValue = "0") int page,
                                                @RequestParam(defaultValue = "10") int size,
                                                @RequestParam(defaultValue = "a") int topicId) {
        try {
            return ResponseEntity.ok(articleService.getArticlesByTopicId(page, size, topicId));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("Error fetching articles by topic: " + e.getMessage());
        }                                          
    }

    @PostMapping
    public ResponseEntity<?> createArticles(@RequestBody Articles article) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED)
                                 .body(articleService.createArticle(article));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body("Error creating article: " + e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateArticle(@PathVariable int id, @RequestBody Article article) {
        try {
            return ResponseEntity.ok(articleService.updateArticle(id, article));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                 .body("Error updating article: " + e.getMessage());
        }
    }

    // Xóa một bài viết (DELETE: /api/articles/{id})
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteArticle(@PathVariable int id) {
        try {
            articleService.deleteArticle(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("Error deleting article: " + e.getMessage());
        }
    }

}
