package com.application.daily_dev.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.FuzzyQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Articles;
import com.application.daily_dev.repository.ArticleRepository;

@Service
public class ArticleService {

    private static final int MAX_RESULTS = 100;

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private Directory directory;

    public Page<Articles> getArticlesTopView(int page, int size, int minusDays) {
        LocalDateTime startDate = LocalDateTime.now().minusDays(minusDays);
        Pageable pageable = PageRequest.of(page, size);
        return articleRepository.findTopArticlesByReactionCount(startDate, pageable);
    }

    public Page<Articles> getNewFeedForEachUser(int page, int size, int userId) {
        Pageable pageable = PageRequest.of(page, size);
        return articleRepository.findPersonalizedArticlesByUser(userId, pageable);
    }

    // Apply fuzzy search
    public Page<Articles> searchArticles(int page, int size, String searchTerm) throws IOException {
        try (DirectoryReader reader = DirectoryReader.open(directory)) {
            IndexSearcher searcher = new IndexSearcher(reader);

            // Tạo một MultiFieldQuery để tìm kiếm trong cả title và content
            BooleanQuery.Builder queryBuilder = new BooleanQuery.Builder();
            // Tách searchTerm thành các từ riêng lẻ
            String[] terms = searchTerm.toLowerCase().split("\\s+");

            for (String term : terms) {
                BooleanQuery.Builder termQueryBuilder = new BooleanQuery.Builder();

                // Thêm FuzzyQuery cho title và content
                termQueryBuilder.add(new FuzzyQuery(new Term("title", term), 2), BooleanClause.Occur.SHOULD);
                termQueryBuilder.add(new FuzzyQuery(new Term("content", term), 2), BooleanClause.Occur.SHOULD);

                // Thêm TermQuery cho tìm kiếm chính xác
                termQueryBuilder.add(new TermQuery(new Term("title", term)), BooleanClause.Occur.SHOULD);
                termQueryBuilder.add(new TermQuery(new Term("content", term)), BooleanClause.Occur.SHOULD);

                queryBuilder.add(termQueryBuilder.build(), BooleanClause.Occur.MUST);
            }

            TopDocs results = searcher.search(queryBuilder.build(), MAX_RESULTS);

            List<Integer> articleIds = new ArrayList<>();
            for (ScoreDoc scoreDoc : results.scoreDocs) {
                Document doc = searcher.doc(scoreDoc.doc);
                articleIds.add(Integer.parseInt(doc.get("id")));
            }

            // Lấy thông tin chi tiết của bài viết từ database
            List<Articles> foundArticles = articleRepository.findAllById(articleIds);

            // Create pagination for result
            Pageable pageable = PageRequest.of(page, size, Sort.Direction.DESC, "createdAt");
            int start = (int) pageable.getOffset();
            int end = Math.min((start + pageable.getPageSize()), foundArticles.size());

            return new PageImpl<>(
                    foundArticles.subList(start, end),
                    pageable,
                    foundArticles.size());
        }

    }

    // get list articles by topic id
    public Page<Articles> getArticlesByTopicId(int page, int size, int topicId) {
        Pageable pageable = PageRequest.of(page, size);
        return articleRepository.findListArticlesByTopic(topicId, pageable);
    }

    public void deleteArticle(int id) {
        articleRepository.deleteById(id);
    }

    public Articles createArticle(Articles article) {
        Articles createdArticle = articleRepository.save(article);
        return createdArticle;
    }

    public Articles updateArticle(int id, Articles article) {
        Articles articleNeedUpdate = articleRepository.findById(id).get();
        articleNeedUpdate.setContent(article.getContent());
        articleNeedUpdate.setLink(article.getLink());
        articleNeedUpdate.setUpdatedAt(LocalDateTime.now());
        articleNeedUpdate.setThumbnailUrl(article.getThumbnailUrl());
        articleNeedUpdate.setTitle(article.getTitle());
        articleNeedUpdate.setTags(article.getTags());
        return articleRepository.save(article);
    }
}