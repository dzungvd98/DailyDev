package com.application.daily_dev.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Topics;
import com.application.daily_dev.repository.TopicRepository;

@Service
public class TopicService {
    @Autowired
    private TopicRepository topicRepository;

    public void createNewTopicByName(String topicName) {
        if(!topicRepository.existsByName(topicName)) {
            Topics topic = new Topics();
            topic.setName(topicName); 
            topicRepository.save(topic);
        }
    }
}
