package com.application.daily_dev.service;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.daily_dev.entity.Articles;
import com.application.daily_dev.repository.ArticleRepository;

import jakarta.annotation.PostConstruct;

import java.io.IOException;

@Service
public class IndexingService {

    @Autowired
    private ArticleRepository repository;

    @Autowired
    private IndexWriter indexWriter;

    private static final int BATCH_SIZE = 1000;

    @PostConstruct
    @Transactional(readOnly = true)
    public void indexData() throws IOException {
        long totalArticles = repository.count();
        int totalPages = (int) Math.ceil((double) totalArticles / BATCH_SIZE);

        for (int i = 0; i < totalPages; i++) {
            Page<Articles> articlesPage = repository.findAll(PageRequest.of(i, BATCH_SIZE));
            indexBatch(articlesPage);
        }
        
        indexWriter.commit();
    }

    private void indexBatch(Page<Articles> articlesPage) throws IOException {
        for (Articles article : articlesPage) {
            Document doc = new Document();
            doc.add(new StringField("id", String.valueOf(article.getId()), Field.Store.YES));
            doc.add(new TextField("title", article.getTitle(), Field.Store.YES));
            doc.add(new TextField("content", article.getContent(), Field.Store.YES));
            // Thêm các trường khác của Articles nếu cần
            indexWriter.addDocument(doc);
        }
    }
}
