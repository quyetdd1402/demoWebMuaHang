package com.spring.repository;

import com.spring.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<Users, Integer> {
    Users findAllByUsernameAndPassword(String username, String password);
}
