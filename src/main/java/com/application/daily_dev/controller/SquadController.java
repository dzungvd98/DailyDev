package com.application.daily_dev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.application.daily_dev.entity.Squads;
import com.application.daily_dev.service.SquadService;

@RestController
@RequestMapping("/api/squads")
public class SquadController {
    
    @Autowired
    private SquadService squadService;

    @PostMapping("/create")
    public ResponseEntity<?> createSquad(@RequestBody Squads squad) {
        try {
            return ResponseEntity.ok(squadService.createSquad(squad));
        } catch (Exception e) {
            return new ResponseEntity<>("Have error: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
