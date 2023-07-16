package com.spring.controller;


import com.spring.entity.Category;
import com.spring.entity.Product;
import com.spring.repository.CategoryRepository;
import com.spring.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private CategoryRepository categoryRepository;
    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    @RequestMapping(value = {"", "/", "/index", "/home"})
    public ModelAndView homePage(@RequestParam(name = "name", required = false, defaultValue = "Spring") String name) {
        ModelAndView m = new ModelAndView();
        Object obj = request.getSession().getAttribute("userLogged");
        m.setViewName("homePage");
        return m;
    }

    @RequestMapping(value = {"/admin", "/admin/"})
    public ModelAndView dashboard(@RequestParam(name = "name", required = false, defaultValue = "Spring") String name) {
        ModelAndView m = new ModelAndView();
        Object obj = request.getSession().getAttribute("userLoggedAdmin");
        m.setViewName("dashboard");
        return m;
    }

    @RequestMapping(value = {"/user", "/user/"})
    public ModelAndView DN(@RequestParam(name = "name", required = false, defaultValue = "Spring") String name) {
        ModelAndView m = new ModelAndView();
        Object obj = request.getSession().getAttribute("userLoggedAdmin");
        m.setViewName("homePageDN");
        return m;
    }
}
