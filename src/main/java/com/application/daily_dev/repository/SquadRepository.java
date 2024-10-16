package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.application.daily_dev.entity.Squads;

public interface SquadRepository extends JpaRepository<Squads, Integer>{
    
}
