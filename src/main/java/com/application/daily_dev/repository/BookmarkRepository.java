package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.application.daily_dev.entity.Bookmarks;
import com.application.daily_dev.entity.Users;

import java.util.List;


public interface BookmarkRepository extends JpaRepository<Bookmarks, Integer>{
    List<Bookmarks> findByUser(Users user);
}
