package com.example.seekhelp.web;

import com.example.seekhelp.Constants;
import com.example.seekhelp.dto.RegisterRequest;
import com.example.seekhelp.dto.RegisterSkillsRequest;
import com.example.seekhelp.entities.Skill;
import com.example.seekhelp.entities.User;
import com.example.seekhelp.responsitories.SkillRepository;
import com.example.seekhelp.responsitories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@SessionAttributes({"user"})
public class RegisterSkillsController {
    @Autowired
    SkillRepository skillRepository;

    @GetMapping("/register_skills")
    public String page(ModelMap mm){
        mm.addAttribute("categories", Constants.categories);
        return "register_skills";
    }

    @PostMapping("/register_skills")
    public String register(RegisterSkillsRequest req, ModelMap mm, HttpSession session) {
        User user = (User)session.getAttribute("user");
        Skill skill = new Skill();
//        skill.setUserId(user.getUserId());
        skill.setUser(user);
        skill.setCategory(req.category);
        skill.setCertification(req.getCert());
        skill.setDescription(req.getDesc());
        skill.setYears(req.getYears());
        skillRepository.save(skill);

        return "redirect:index";
    }
}
