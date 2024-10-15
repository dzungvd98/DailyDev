package com.application.daily_dev.entity;

import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "Topic")
public class Topics {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotBlank(message = "Topic name is required")
    @Size(max = 100, message = "Topic name must be less than 50 characters")
    @Column(name = "name", unique = true)
    private String name;
    
    private String description;

    public Topics() {
    }

    @ManyToMany(mappedBy = "topics")
    @JsonIgnore
    private Set<Articles> articles;
    
    @ManyToMany
    @JoinTable(
        name = "Topic_Tags",
        joinColumns = @JoinColumn(name = "topic_id"),
        inverseJoinColumns = @JoinColumn(name = "tag_id")
    )
    private Set<Tags> tags;

    @OneToMany(mappedBy = "followedTopic", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Subscriptions> followingTopics;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Articles> getArticles() {
        return articles;
    }

    public void setArticles(Set<Articles> articles) {
        this.articles = articles;
    }

    public Set<Tags> getTags() {
        return tags;
    }

    public void setTags(Set<Tags> tags) {
        this.tags = tags;
    }

    public Set<Subscriptions> getFollowingTopics() {
        return followingTopics;
    }

    public void setFollowingTopics(Set<Subscriptions> followingTopics) {
        this.followingTopics = followingTopics;
    }

    
    
}
