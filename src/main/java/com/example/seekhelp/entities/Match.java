package com.example.seekhelp.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "postmatch")
public class Match {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer matchId;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name="user_id", referencedColumnName = "userId")
    private User user;

//    private Integer userId;

    @ManyToOne(targetEntity = Post.class)
    @JoinColumn(name="post_id", referencedColumnName = "postId")
    private Post post;

//    private Integer postId;

    private Integer status;
}