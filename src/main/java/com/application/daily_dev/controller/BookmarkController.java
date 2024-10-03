package com.application.daily_dev.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.service.BookmarkService;

@RestController
@RequestMapping("/api/bookmarks")
public class BookmarkController {
    @Autowired
    private BookmarkService bookmarkService;

    
}
