package com.application.daily_dev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.entity.Bookmarks;
import com.application.daily_dev.service.BookmarkService;

@RestController
@RequestMapping("/api/bookmarks")
public class BookmarkController {
    @Autowired
    private BookmarkService bookmarkService;

    @GetMapping
    public List<Bookmarks> getListBookmarksOfUser(Integer userId) {
        return this.getListBookmarksOfUser(userId);
    }
}
