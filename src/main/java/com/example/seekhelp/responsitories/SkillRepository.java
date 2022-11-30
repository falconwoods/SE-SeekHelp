package com.example.seekhelp.responsitories;

import com.example.seekhelp.entities.Skill;
import com.example.seekhelp.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SkillRepository extends JpaRepository<Skill,Long> {

}
