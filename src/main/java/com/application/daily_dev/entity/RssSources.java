package com.application.daily_dev.entity;

import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "RSS_Sources")
public class RssSources {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotBlank(message = "Souce name is required")
    @Size(max = 255, message = "Source name must be less than 255 characters")
    @Column(name = "source_name")
    private String sourceName;

    @NotBlank(message = "RSS URL is required")
    @Size(max = 255, message = "RSS URL must be less than 255 characters")
    @Column(name = "rss_url")
    private String rssUrl;

    @Size(max = 255, message = "Website URL must be less than 255 characters")
    @Column(name = "website_url")
    private String website_url;

    @Column(name = "last_fetched_at")
    private LocalDateTime lastFetchedAt;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "rss", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Articles> articles;

    @OneToMany(mappedBy = "rssSource", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<RSSFeedCategories> rssFeedCategories;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }

    public String getRssUrl() {
        return rssUrl;
    }

    public void setRssUrl(String rssUrl) {
        this.rssUrl = rssUrl;
    }

    public String getWebsite_url() {
        return website_url;
    }

    public void setWebsite_url(String website_url) {
        this.website_url = website_url;
    }

    public LocalDateTime getLastFetchedAt() {
        return lastFetchedAt;
    }

    public void setLastFetchedAt(LocalDateTime lastFetchedAt) {
        this.lastFetchedAt = lastFetchedAt;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    
}
