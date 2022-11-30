package com.example.seekhelp.web;

import com.example.seekhelp.Constants;
import com.example.seekhelp.dto.EditPost;
import com.example.seekhelp.entities.Match;
import com.example.seekhelp.entities.Post;
import com.example.seekhelp.entities.User;
import com.example.seekhelp.responsitories.MatchRepository;
import com.example.seekhelp.responsitories.PostRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;

@SessionAttributes({"user"})
@Controller
@AllArgsConstructor
public class PostsController {
    @Autowired
    PostRepository postRepository;
    @Autowired
    MatchRepository matchRepository;

    @GetMapping(value = {"/", "/index", "/posts"})
    public String page(ModelMap mm, HttpSession session){
        if(session.getAttribute("user") == null)
            return "redirect:/login";

        List<Post> posts = postRepository.findAll();
        mm.addAttribute("posts", posts);
        return "posts";
    }

    @GetMapping("/posts/show")
    public String show(@RequestParam int id, ModelMap mm, HttpSession session){
        User user = (User)session.getAttribute("user");

        Post post = postRepository.findPostByPostId(id);
        mm.addAttribute("post", post);
        mm.addAttribute("categories", Constants.categories);

        if(post.getOwner().getUserId() == user.getUserId()){
            mm.addAttribute("matches", post.getMatches());
        }

        return "post_detail";
    }

    @GetMapping("/posts/edit")
    public String edit(@RequestParam int id, ModelMap mm){
        Post post = postRepository.findPostByPostId(id);
        mm.addAttribute("post", post);
        mm.addAttribute("categories", Constants.categories);
        return "post_edit";
    }

    @PostMapping("/posts/edit")
    public String edit(EditPost req, ModelMap mm){
        Post post = postRepository.findPostByPostId(req.getPostId());
        post.setCategory(req.getCategory());
        post.setTitle(req.getTitle());
        post.setDescription(req.getDesc());
        post.setLocation(req.getLocation());
        post.setPrice(req.getPrice());
        postRepository.save(post);

        return "redirect:/mycenter";
    }

    @GetMapping("/posts/delete")
    @Transactional
    public String edit(@RequestParam int id, ModelMap mm, HttpSession session){
        postRepository.deleteByPostId(id);
        return "redirect:/mycenter";
    }

    @GetMapping("/posts/add")
    public String add(ModelMap mm){
        mm.addAttribute("categories", Constants.categories);
        return "post_add";
    }

    @PostMapping("/posts/add")
    public String add(ModelMap mm, EditPost req, HttpSession session){
        Post post = new Post();
        post.setOwner((User)session.getAttribute("user"));
        post.setCategory(req.getCategory());
        post.setTitle(req.getTitle());
        post.setDescription(req.getDesc());
        post.setLocation(req.getLocation());
        post.setPrice(req.getPrice());
        postRepository.save(post);
        return "redirect:/posts";
    }

    @GetMapping("/posts/accept")
    public String accept(@RequestParam int id){
        Match match = matchRepository.findByMatchId(id);
        match.setStatus(1);
        matchRepository.save(match);

        Post post = match.getPost();
        post.setStatus(1);
        postRepository.save(post);

        return "redirect:/posts/show?id= " + post.getPostId();
    }
}
