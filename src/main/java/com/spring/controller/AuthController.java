package com.spring.controller;

import com.spring.entity.Users;
import com.spring.entity.UsersKH;
import com.spring.repository.UserKHRepository;
import com.spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Date;

@Controller
public class AuthController {
    HttpSession session;
    @Autowired
    private UserKHRepository userKHRepository;
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("userKH", new UsersKH(1, "a", "a", "0397798203", 1, "", null, "011020382", 1, ""));
        return "login";
    }

    @PostMapping("/login")
    public String checkLogin(Model model,
                             @Valid @ModelAttribute("userKH") UsersKH userKH,
                             BindingResult result,
                             HttpSession session
    ) {
        //1 validate
        if (result.hasErrors()) {
            return "login";
        }
        //2 login success
        UsersKH userFromDB = userKHRepository.findAllByUsernameAndPassword(userKH.getUsername(), userKH.getPassword());
        if (userFromDB != null) {
            session.setAttribute("userLogged", userFromDB);
            return "redirect:/user";
        }
        //3 login failed
        model.addAttribute("mess", "Username or password incorrect");
        return "login";
    }

    @GetMapping("/createLogin")
    public String createLoginForm(Model model) {
        model.addAttribute("users", new UsersKH());
        return "createLogin";
    }

    @PostMapping("/createLogin")
    public String createLogin(Model model,
                              @Valid @ModelAttribute("users") UsersKH userKH,
                              BindingResult result,
                              @RequestParam("ngaySinh") String date,
                              HttpSession session
    ) {
        //1 validate
        if (result.hasErrors()) {
            return "createLogin";
        }

        //2 login success
        UsersKH userFromDB = userKHRepository.findAllByUsernameAndPassword(userKH.getUsername(), userKH.getPassword());
        if (userFromDB == null) {
            userKH.setNgaySinh(Date.valueOf(date));
            userKH.setTrangThai(1);
            userKHRepository.save(userKH);
            model.addAttribute("mess", "create new login success");
            return "redirect:/";
        }

        //3 login failed
        model.addAttribute("mess", "Username or password already exists");
        return "createLogin";
    }

    @GetMapping("/loginAdmin")
    public String showLoginFormAdmin(Model model, HttpSession session) {
        model.addAttribute("user", new Users());
        return "loginAdmin";
    }

    @GetMapping("/logoutAdmin")
    public String logoutAdmin(Model model, HttpSession session) {
        session.setAttribute("userLoggedAdmin", null);
        return "homePage";
    }

    @GetMapping("/logout")
    public String logout(Model model, HttpSession session) {
        session.setAttribute("userLogged", null);
        return "homePage";
    }

    @PostMapping("/loginAdmin")
    public String checkLogin(Model model,
                             @Valid @ModelAttribute("user") Users user,
                             BindingResult result,
                             HttpSession session
    ) {
        //1 validate
        if (result.hasErrors()) {
            return "loginAdmin";
        }

        //2 login success
        Users userFromDB = userRepository.findAllByUsernameAndPassword(user.getUsername(), user.getPassword());
        if (userFromDB != null) {
            session.setAttribute("userLoggedAdmin", userFromDB);
            return "redirect:/admin";

        }

        //3 login failed
        model.addAttribute("message", "Username or password incorrect");
        return "loginAdmin";
    }
}
