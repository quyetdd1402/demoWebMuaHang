package com.spring.repository;

import com.spring.entity.Category;
import com.spring.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("SELECT p FROM Product p order by p.price desc")
    Page<Product> findByDesc(Pageable pageable);

    @Query("SELECT p FROM Product p order by p.price asc")
    Page<Product> findByAsc(Pageable pageable);

    Page<Product> findByCategory(Category category, Pageable pageable);
}
