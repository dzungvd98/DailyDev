package com.application.daily_dev.entity;

import java.time.LocalDateTime;

import com.application.daily_dev.model.FollowType;
import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "User_Follows")
public class Follows {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private Users user;
    
    @Column(name = "followed_type")
    FollowType followType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "followed_tag_id")
    @JsonBackReference
    private Tags followedTag;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "followed_topic_id")
    @JsonBackReference
    private Topics followedTopic;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "followed_user_id")
    @JsonBackReference
    private Users followedUser;

    @Column(name = "followed_at ")
    private LocalDateTime followedAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Tags getFollowedTag() {
        return followedTag;
    }

    public void setFollowedTag(Tags followedTag) {
        this.followedTag = followedTag;
    }

    public Topics getFollowedTopic() {
        return followedTopic;
    }

    public void setFollowedTopic(Topics followedTopic) {
        this.followedTopic = followedTopic;
    }

    public Users getFollowedUser() {
        return followedUser;
    }

    public void setFollowedUser(Users followedUser) {
        this.followedUser = followedUser;
    }

    public LocalDateTime getFollowedAt() {
        return followedAt;
    }

    public void setFollowedAt(LocalDateTime createdAt) {
        this.followedAt = createdAt;
    }

    public FollowType getFollowType() {
        return followType;
    }

    public void setFollowType(FollowType followType) {
        this.followType = followType;
    }

    
}
