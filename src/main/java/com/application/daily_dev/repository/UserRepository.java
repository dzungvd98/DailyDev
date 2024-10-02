package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.application.daily_dev.entity.Users;



public interface UserRepository extends JpaRepository<Users, Integer>{
    Users findByUsername(String username);
    Users findById(int id);

}
