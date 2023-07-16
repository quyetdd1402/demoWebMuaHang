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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/product/")
public class ProductController {

    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;


    @GetMapping("/list")
    public String productListPage(Model model,
                                  @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> page = productRepository.findAll(pageable);
        model.addAttribute("products", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_user";
    }

    @GetMapping("/listDN")
    public String productListDNPage(Model model,
                                    @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                    @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> page = productRepository.findAll(pageable);
        model.addAttribute("productsDN", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_userDN";
    }

    @GetMapping("/{id}")
    public String showDetail(@PathVariable("id") Integer id, Model model) {

        Optional<Product> optional = productRepository.findById(id);
        model.addAttribute("product", optional.orElse(null));
        return "product_list_detail";
    }

    @GetMapping("/{id}DN")
    public String showDetailDN(@PathVariable("id") Integer id, Model model) {

        Optional<Product> optional = productRepository.findById(id);
        model.addAttribute("product", optional.orElse(null));
        return "product_list_detailDN";
    }

    @GetMapping("/increase")
    public String increaseListPage(Model model,
                                   @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                   @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> page = productRepository.findByAsc(pageable);
        model.addAttribute("products", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_user";
    }

    @GetMapping("/increaseDN")
    public String increaseDNListPage(Model model,
                                     @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                     @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> page = productRepository.findByAsc(pageable);
        model.addAttribute("productsDN", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_userDN";
    }

    @GetMapping("/reduceDN")
    public String reduceDNListPage(Model model,
                                   @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                   @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> page = productRepository.findByDesc(pageable);
        model.addAttribute("productsDN", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_userDN";
    }

    @GetMapping("/reduce")
    public String reduceListPage(Model model,
                                 @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                 @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<Product> page = productRepository.findByDesc(pageable);
        model.addAttribute("products", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_user";
    }

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("product", new Product());
        List<Category> page = categoryRepository.findAll();
        model.addAttribute("category", page);
        return "product/create";
    }

    @PostMapping("/create")
    public String createLogin(Model model,
                              @Valid @ModelAttribute("product") Product product,
                              BindingResult result
    ) {
        //1 validate
        if (result.hasErrors()) {
            return "product/create";
        }
        productRepository.save(product);
        model.addAttribute("mess", "create new product success");
        List<Category> page = categoryRepository.findAll();
        model.addAttribute("category", page);
        return "product_admin";
    }

    @GetMapping("/index")
    public String productListPage(Model model
    ) {
        List<Product> page = productRepository.findAll();
        model.addAttribute("products", page);
        return "product_admin";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam(name = "maDelete") Integer id, Model model) {
        productRepository.deleteById(id);
        List<Product> page = productRepository.findAll();
        model.addAttribute("mess", "update product success");
        model.addAttribute("products", page);
        return "redirect_admin";
    }

    @GetMapping("/edit")
    public String eiditForm(Model model, @RequestParam(name = "maUpdate") Integer id) {
        Optional<Product> optional = productRepository.findById(id);
        model.addAttribute("product", optional.orElse(null));
        List<Category> page = categoryRepository.findAll();
        model.addAttribute("category", page);
        return "product/edit";
    }

    @PostMapping("/edit")
    public String edit(Model model, @Valid @ModelAttribute("product") Product product,
                       BindingResult result) {
        //1 validate
        if (result.hasErrors()) {
            model.addAttribute("product", product);
            return "product/edit";
        }
        productRepository.save(product);
        List<Product> page = productRepository.findAll();
        model.addAttribute("products", page);
        model.addAttribute("mess", "update product success");
        return "product_admin";
    }
}

















