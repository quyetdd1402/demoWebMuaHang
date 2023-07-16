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
@RequestMapping("/category/")
public class CategoryController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    @GetMapping("/{id}/product")
    public String productListPage(Model model,
                                  @PathVariable("id") Integer categoryId,
                                  @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);

        Category category = new Category();
        category.setId(categoryId);
        Page<Product> page = productRepository.findByCategory(category, pageable);

        model.addAttribute("products", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_user";
    }
    @GetMapping("/{id}/productDN")
    public String productListPageDN(Model model,
                                  @PathVariable("id") Integer categoryId,
                                  @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);

        Category category = new Category();
        category.setId(categoryId);
        Page<Product> page = productRepository.findByCategory(category, pageable);

        model.addAttribute("productsDN", page.getContent());
        model.addAttribute("totalPage", page.getTotalPages());
        return "product_list_userDN";
    }

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("category", new Category());
        return "category/create";
    }

    @PostMapping("/create")
    public String createLogin(Model model,
                              @Valid @ModelAttribute("category") Category category,
                              BindingResult result
    ) {
        //1 validate
        if (result.hasErrors()) {
            return "category/create";
        }
        categoryRepository.save(category);
        model.addAttribute("mess", "create new category success");
        List<Category> page = categoryRepository.findAll();
        model.addAttribute("category", page);
        return "category_admin";
    }

    @GetMapping("/index")
    public String productListPage(Model model
    ) {
        List<Category> page = categoryRepository.findAll();
        model.addAttribute("category", page);
        return "category_admin";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam(name = "maDelete") Integer id, Model model) {
        Pageable pageable = PageRequest.of(0, categoryRepository.findAll().size());
        Category category = new Category();
        category.setId(id);
        Page<Product> page1 = productRepository.findByCategory(category, pageable);
        if (page1.getContent().isEmpty()) {
            categoryRepository.deleteById(id);
            List<Category> page = categoryRepository.findAll();
            model.addAttribute("mess", "delete category success");
            model.addAttribute("category", page);
            return "category_admin";
        }
        List<Category> page = categoryRepository.findAll();
        model.addAttribute("mess", "delete category failes");
        model.addAttribute("category", page);
        return "category_admin";
    }

    @GetMapping("/edit")
    public String eiditForm(Model model, @RequestParam(name = "maUpdate") Integer id) {
        Optional<Category> optional = categoryRepository.findById(id);
        model.addAttribute("category", optional.orElse(null));
        return "category/edit";
    }

    @PostMapping("/edit")
    public String edit(Model model, @Valid @ModelAttribute("product") Category category,
                       BindingResult result) {
        //1 validate
        if (result.hasErrors()) {
            model.addAttribute("category", category);
            return "category/edit";
        }
        categoryRepository.save(category);
        List<Category> page = categoryRepository.findAll();
        model.addAttribute("category", page);
        model.addAttribute("mess", "update category success");
        return "category_admin";
    }
}
