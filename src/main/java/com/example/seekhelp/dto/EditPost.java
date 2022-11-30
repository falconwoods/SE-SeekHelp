package com.example.seekhelp.dto;

import lombok.Data;

@Data
public class EditPost {
    private int postId;
    private String category;
    private String title;
    private String desc;
    private String location;
    private float price;
}
