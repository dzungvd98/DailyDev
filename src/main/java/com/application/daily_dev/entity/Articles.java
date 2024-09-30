package com.application.daily_dev.entity;

import java.time.LocalDateTime;

import com.application.daily_dev.model.SourceType;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "Articles")
public class Articles {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotBlank(message = "Title is mandatory")
    @Size(max = 1000, message = "Title should not exceed 1000 characters")
    @Column(name = "title", nullable = false)
    private String title;

    @NotBlank(message = "Content is mandatory")
    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;

    @NotNull(message = "Source type is mandatory")
    @Enumerated(EnumType.STRING)
    @Column(name = "source_type", nullable = false)
    private SourceType sourceType;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne
    @JoinColumn(name = "rss_id")
    private RssSources rss;

    @PastOrPresent(message = "Published date must be in the past or present")
    @Column(name = "published_at")
    private LocalDateTime publishedAt;

    @Size(max = 255, message = "Thumbnail URL should not exceed 255 characters")
    @Column(name = "thumbnail_url")
    private String thumbnailUrl;

    @Size(max = 255, message = "Link should not exceed 255 characters")
    @Column(name = "link")
    private String link;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    public Articles() {
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public SourceType getSourceType() {
        return sourceType;
    }

    public void setSourceType(SourceType sourceType) {
        this.sourceType = sourceType;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public RssSources getRss() {
        return rss;
    }

    public void setRss(RssSources rss) {
        this.rss = rss;
    }

    public LocalDateTime getPublishedAt() {
        return publishedAt;
    }

    public void setPublishedAt(LocalDateTime publishedAt) {
        this.publishedAt = publishedAt;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    

}
