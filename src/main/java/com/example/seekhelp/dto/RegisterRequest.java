package com.example.seekhelp.dto;

import lombok.Data;

@Data
public class RegisterRequest {
    public String name;
    public String email;
    public String password;
    public String phone;
    public String city;
    public String type;
}
