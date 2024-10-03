package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Bookmarks;
import com.application.daily_dev.entity.Users;

import java.util.List;

@Repository
public interface BookmarkRepository extends JpaRepository<Bookmarks, Integer>{
    List<Bookmarks> findByUser(Users user);
}
