package com.application.daily_dev.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.rometools.rome.io.FeedException;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class RSSScheduler {
    @Autowired
    private RSSSourceService rssService;

    @Scheduled(fixedRate = 60 * 60 * 1000)
    public void scheduleRssFetching() throws IOException, FeedException {
        rssService.fetchAndStoreArticles();
    }
}
