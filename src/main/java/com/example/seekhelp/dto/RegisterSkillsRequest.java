package com.example.seekhelp.dto;

import lombok.Data;

@Data
public class RegisterSkillsRequest {
    public String category;
    public Integer years;
    public String desc;
    public String cert;
}
