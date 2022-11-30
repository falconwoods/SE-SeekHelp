package com.example.seekhelp.responsitories;

import com.example.seekhelp.entities.Match;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MatchRepository extends JpaRepository<Match, Integer> {
    public Match findByMatchId(Integer matchId);

//    public List<Match> findByPostId(Integer postId);
}