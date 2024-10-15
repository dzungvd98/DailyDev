package com.application.daily_dev.entity;

import java.time.LocalDateTime;

import com.application.daily_dev.model.SourceType;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;
import jakarta.validation.constraints.Size;
import java.util.Set;

import java.util.HashSet;

@Entity
@Table(name = "Articles")
public class Articles {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @org.springframework.data.annotation.Id
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private Users user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rss_id")
    @JsonBackReference
    private RssSources rss;

    @PastOrPresent(message = "Updated date must be in the past or present")
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Size(max = 255, message = "Thumbnail URL should not exceed 255 characters")
    @Column(name = "thumbnail_url")
    private String thumbnailUrl;

    @Size(max = 255, message = "Link should not exceed 255 characters")
    @Column(name = "link")
    private String link;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Bookmarks> bookmarks;

    @OneToMany(mappedBy = "article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Comments> articleComments;

    @OneToMany(mappedBy = "article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Reactions> articlesReactions;

    @ManyToMany
    @JoinTable(
        name = "Article_Tags",
        joinColumns = @JoinColumn(name = "article_id"),
        inverseJoinColumns = @JoinColumn(name = "tag_id"))
    private Set<Tags> tags;

    @ManyToMany
    @JoinTable(
        name = "Article_Topic",
        joinColumns = @JoinColumn(name = "article_id"),
        inverseJoinColumns = @JoinColumn(name = "topic_id")
    )
    private Set<Topics> topics;

    @ManyToMany
    @JoinTable(
        name = "Article_Squads",
        joinColumns = @JoinColumn(name = "article_id"),
        inverseJoinColumns = @JoinColumn(name = "squad_id"))
    private Set<Squads> squads;

    public Articles() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
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

    public Set<Bookmarks> getBookmarks() {
        return bookmarks;
    }

    public void setBookmarks(Set<Bookmarks> bookmarks) {
        this.bookmarks = bookmarks;
    }

    public Set<Comments> getArticleComments() {
        return articleComments;
    }

    public void setArticleComments(Set<Comments> articleComments) {
        this.articleComments = articleComments;
    }

    public Set<Reactions> getArticlesReactions() {
        return articlesReactions;
    }

    public void setArticlesReactions(Set<Reactions> articlesReactions) {
        this.articlesReactions = articlesReactions;
    }

    public Set<Tags> getTags() {
        return tags;
    }

    public void setTags(Set<Tags> tags) {
        this.tags = tags;
    }

    public Set<Topics> getTopics() {
        return topics;
    }

    public void setTopics(Set<Topics> topics) {
        this.topics = topics;
    }

    public void addTopics(Topics topic) {
        if(topics == null) {
            topics = new HashSet<>();
        }
        this.topics.add(topic);
    }

    public Set<Squads> getSquads() {
        return squads;
    }

    public void setSquads(Set<Squads> squads) {
        this.squads = squads;
    }

    

}
