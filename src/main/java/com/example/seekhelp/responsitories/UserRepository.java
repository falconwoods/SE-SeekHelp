package com.example.seekhelp.responsitories;

import com.example.seekhelp.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {
    User findUserByUserId (int kw);
    User findUserByEmail(String email);
    User findConsultantByUserId (int kw);
    List<User> findConsultantByIsConsultant (int kw);
}
