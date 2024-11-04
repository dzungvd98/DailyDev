package com.application.daily_dev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Bookmarks;
import com.application.daily_dev.repository.BookmarkRepository;


@Service
public class BookmarkService {

    @Autowired
    private BookmarkRepository bookmarkRepository;

    public Page<Bookmarks> getListBookMarkOfUser(int page, int size, Integer userId) {
        Pageable pageable = PageRequest.of(page, size);
        return bookmarkRepository.findByUserId(userId, pageable);
    }

    public Bookmarks createBookmark(Bookmarks bookmark) {
        return bookmarkRepository.save(bookmark);
    }

    public void deleteBookmark(Integer bookmarkId) {
        bookmarkRepository.deleteById(bookmarkId);
    }
}
