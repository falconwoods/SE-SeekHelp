package com.example.seekhelp.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;


@Entity
@Getter
@Setter
public class Skill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY, generator = "JDBC")

    private Integer skillId;
//    private Integer userId;
    private String category;
    private String description;
    private Integer years;
    private String certification;

    @OneToOne(targetEntity = User.class)
    @JoinColumn(name="user_id", referencedColumnName = "userId")
    private User user;
}