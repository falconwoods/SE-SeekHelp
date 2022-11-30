package com.example.seekhelp.web;

import com.example.seekhelp.dto.RegisterRequest;
import com.example.seekhelp.entities.User;
import com.example.seekhelp.responsitories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
public class RegisterController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/register")
    public String page(){
        return "register";
    }

    @PostMapping("/register")
    public String register(RegisterRequest req, ModelMap mm, HttpSession session) {
        User user = userRepository.findUserByEmail(req.email);
        if(user != null){
            mm.addAttribute("error", "email is already used, please use another one");
            return "/register";
        }

        user = new User();
        user.setName(req.name);
        user.setEmail(req.email);
        user.setPhone(req.phone);
        user.setPassword(req.password);
        user.setCity(req.city);
        if(req.type == null)
            user.setIsConsultant(0);
        else
            user.setIsConsultant(req.type.equals("consultant") ? 1 : 0);
        user = userRepository.save(user);

        session.setAttribute("user", user);

        if(user.getIsConsultant() == 1){
            return "redirect:register_skills";
        }

        return "redirect:index";
    }
}
