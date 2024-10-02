package com.application.daily_dev.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Bookmarks;
import com.application.daily_dev.entity.Users;
import com.application.daily_dev.repository.BookmarkRepository;
import com.application.daily_dev.repository.UserRepository;

@Service
public class BookmarkService {
    @Autowired
    private BookmarkRepository bookmarkRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<Bookmarks> getAllBookmarksOfUser(Integer userId) {
        Optional<Users> user = userRepository.findById(userId);
        if(user != null) {
            return bookmarkRepository.findByUser(user);
        }
        return new ArrayList<>();
    }
}
