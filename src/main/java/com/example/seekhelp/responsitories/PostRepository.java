package com.example.seekhelp.responsitories;

import com.example.seekhelp.entities.Post;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

public interface PostRepository extends JpaRepository<Post, Integer> {

    public Post findPostByPostId(int postId);

    public void deleteByPostId(int postId);

    public List<Post> findPostByOwnerUserId(int userId);
}