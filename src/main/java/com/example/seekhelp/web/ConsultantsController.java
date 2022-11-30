package com.example.seekhelp.web;

import com.example.seekhelp.Constants;
import com.example.seekhelp.entities.Match;
import com.example.seekhelp.entities.Post;
import com.example.seekhelp.entities.User;
import com.example.seekhelp.responsitories.MatchRepository;
import com.example.seekhelp.responsitories.PostRepository;
import com.example.seekhelp.responsitories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@SessionAttributes({"user"})
@Controller
@AllArgsConstructor
public class ConsultantsController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    PostRepository postRepository;
    @Autowired
    MatchRepository matchRepository;

    @GetMapping(value = {"/consultants"})
    public String page(ModelMap mm, HttpSession session) {
        if (session.getAttribute("user") == null)
            return "redirect:/login";

        List<User> constants = userRepository.findConsultantByIsConsultant(1);
        mm.addAttribute("consultants", constants);
        return "consultants";
    }

    @GetMapping("/consultant/show")
    public String show(@RequestParam int id, ModelMap mm, HttpSession session) {
        if (session.getAttribute("user") == null)
            return "redirect:/login";
        User user = (User) session.getAttribute("user");

        User consultant = userRepository.findConsultantByUserId(id);
        List<Post> posts = postRepository.findPostByOwnerUserId(user.getUserId());

        mm.addAttribute("consultant", consultant);
        mm.addAttribute("categories", Constants.categories);
        mm.addAttribute("posts", posts);
        return "consultant_detail";
    }

    @PostMapping("/consultant/invite")
    public String invite(HttpSession session, ModelMap mm, @RequestParam int userId, @RequestParam int postId) {
        Post post = postRepository.findPostByPostId(postId);
        User user = userRepository.findConsultantByUserId(userId);

        Match match = new Match();
        match.setPost(post);
        match.setUser(user);
        match.setStatus(0);

        matchRepository.save(match);

        return "redirect:/consultants";
    }

}
