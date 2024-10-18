package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Squads;

@Repository
public interface SquadRepository extends JpaRepository<Squads, Integer>{
    
}
