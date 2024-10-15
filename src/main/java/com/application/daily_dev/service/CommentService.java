package com.application.daily_dev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Comments;
import com.application.daily_dev.repository.CommentRepository;

@Service
public class CommentService {
    
    @Autowired
    private CommentRepository commentRepository;

    public Page<Comments> getListCommentOfArticles(int page, int size, Integer articleId) {

        Pageable pageable = PageRequest.of(page, size);
        return commentRepository.findByArticleId(articleId, pageable);
    }

}
