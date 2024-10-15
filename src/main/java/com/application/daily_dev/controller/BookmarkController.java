package com.application.daily_dev.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.service.BookmarkService;

@RestController
@RequestMapping("/api/bookmarks")
public class BookmarkController {
    @Autowired
    private BookmarkService bookmarkService;

    @GetMapping("/user/{userId}")
    public ResponseEntity<?> getListBookmarkOfUser(@RequestParam(defaultValue = "0") int page,
                                      @RequestParam(defaultValue = "10") int size,
                                      @PathVariable Integer userId) {
        try {
            return ResponseEntity.ok(bookmarkService.getListBookMarkOfUser(page, size, userId));
        } catch (Exception e) {
            return new ResponseEntity<>("Have error: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
