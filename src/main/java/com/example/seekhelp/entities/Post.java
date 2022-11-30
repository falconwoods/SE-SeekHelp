package com.example.seekhelp.entities;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY, generator = "JDBC")
    private Integer postId;

//    private Integer userId;
    private String category;
    private String title;
    private String description;
    private float price;
    private String location;
    private int status;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name="user_id", referencedColumnName = "userId")
    private User owner;

    @OneToMany(mappedBy = "post")
    private List<Match> matches;
}