package com.spring.controller;

import com.spring.entity.UsersKH;
import com.spring.repository.UserKHRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/Tai-khoan/")
public class KhachHangController {
    @Autowired
    private UserKHRepository userKHRepository;

    @GetMapping("/editAdmin")
    public String eiditForm(Model model, @RequestParam(name = "maUpdate") Integer id) {
        Optional<UsersKH> optional = userKHRepository.findById(id);
        model.addAttribute("khachHang", optional.orElse(null));
        return "KhachHang/edit";
    }

    @PostMapping("/editAdmin")
    public String edit(Model model, @Valid @ModelAttribute("khachHang") UsersKH user,
                       BindingResult result, @RequestParam("ngaySinh") String date) {
        //1 validate
        if (result.hasErrors()) {
            model.addAttribute("khachHang", user);
            return "KhachHang/edit";
        }
        user.setNgaySinh(Date.valueOf(date));
        user.setTrangThai(1);
        userKHRepository.save(user);
        List<UsersKH> page = userKHRepository.findAll();
        model.addAttribute("khachHang", page);
        model.addAttribute("mess", "update account success");
        return "khachHang_admin";
    }
    @GetMapping("/indexAdmin")
    public String productListPage(Model model
    ) {
        List<UsersKH> page = userKHRepository.findAll();
        model.addAttribute("khachHang", page);
        return "khachHang_admin";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam(name = "maDelete") Integer id, Model model) {
        Optional<UsersKH> optional = userKHRepository.findById(id);
        optional.get().setTrangThai(2);
        userKHRepository.save(optional.get());
        List<UsersKH> page = userKHRepository.findAll();
        model.addAttribute("khachHang", page);
        return "khachHang_admin";
    }
}
