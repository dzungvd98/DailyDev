package com.application.daily_dev.entity;

import java.time.LocalDateTime;

import com.application.daily_dev.model.Role;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Squad_Members")
public class SquadMembers {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "squad_id")
    private Squads squad;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @Enumerated(EnumType.STRING)
    private Role role;

    @Column(name = "joined_at")
    private LocalDateTime joinedAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Squads getSquad() {
        return squad;
    }

    public void setSquad(Squads squad) {
        this.squad = squad;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public LocalDateTime getJoinedAt() {
        return joinedAt;
    }

    public void setJoinedAt(LocalDateTime joinedAt) {
        this.joinedAt = joinedAt;
    }

    
}
