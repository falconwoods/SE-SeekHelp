package com.example.seekhelp.web;

import com.example.seekhelp.entities.User;
import com.example.seekhelp.responsitories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@SessionAttributes({"user"})
@Controller
@AllArgsConstructor
public class LoginController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/login")
    public String page(){
        return "login";
    }

    @PostMapping("/login")
    public String login(HttpSession session, ModelMap mm, @RequestParam String email, @RequestParam String pwd){
        User user = userRepository.findUserByEmail(email);
        if(user != null && user.getPassword().equals(pwd)){
            session.setAttribute("user", user);
            return "redirect:posts";
        }

        mm.addAttribute("error", "email or password is invalid");
        return "login";
    }

}
