package com.application.daily_dev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.daily_dev.entity.Squads;
import com.application.daily_dev.repository.SquadRepository;

@Service
public class SquadService {
    
    @Autowired
    private SquadRepository squadRepository;

    public Squads createSquad(Squads squad) {
        return squadRepository.save(squad);
    }
}
