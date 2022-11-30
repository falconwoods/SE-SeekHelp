package com.example.seekhelp.web;

import com.example.seekhelp.entities.Post;
import com.example.seekhelp.entities.User;
import com.example.seekhelp.responsitories.PostRepository;
import com.example.seekhelp.responsitories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@SessionAttributes({"user"})
@Controller
@AllArgsConstructor
public class MyCenterController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/mycenter")
    public String show(HttpSession session, ModelMap mm){
        User user = (User)session.getAttribute("user");
        if(user.getIsConsultant() == 1){
            return "mycenter_consultant";
        }

        List<Post> posts = userRepository.findUserByUserId(user.getUserId()).getPosts();
        mm.addAttribute("posts", posts);
        return "mycenter_customer";
    }

}
