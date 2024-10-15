package com.application.daily_dev.entity;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonManagedReference;

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
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "RSS_Sources")
@NoArgsConstructor
@AllArgsConstructor
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

    @NotBlank(message = "Content selector is required")
    @Size(max = 255, message = "content selector must be less than 255 characters")
    @Column(name = "content_selector")
    private String contentSelector;

    @NotBlank(message = "Website is required")
    @Size(max = 100, message = "Website must be less than 255 characters")
    @Column(name = "website")
    private String website;

    @Column(name = "last_fetched_at")
    private LocalDateTime lastFetchedAt;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "rss", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonManagedReference
    private Set<Articles> articles;

    @OneToMany(mappedBy = "rssSource", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonManagedReference
    private Set<Categories> categories;

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

    public Set<Articles> getArticles() {
        return articles;
    }

    public void setArticles(Set<Articles> articles) {
        this.articles = articles;
    }

    public Set<Categories> getCategories() {
        return categories;
    }

    public void addCategory(Categories category) {
        if(categories == null) {
            categories = new HashSet<>();
        }
        categories.add(category);
    }

    public void setCategories(Set<Categories> categories) {
        this.categories = categories;
    }

    public String getContentSelector() {
        return contentSelector;
    }

    public void setContentSelector(String contentSelector) {
        this.contentSelector = contentSelector;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    
}
