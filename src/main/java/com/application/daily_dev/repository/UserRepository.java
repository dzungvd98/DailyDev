package com.application.daily_dev.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.application.daily_dev.entity.Users;


@Repository
public interface UserRepository extends JpaRepository<Users, Integer>{
    Users findByUsername(String username);
    Users findById(int id);

}
