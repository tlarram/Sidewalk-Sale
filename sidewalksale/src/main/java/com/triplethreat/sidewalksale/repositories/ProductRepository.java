package com.triplethreat.sidewalksale.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.triplethreat.sidewalksale.models.Category;
import com.triplethreat.sidewalksale.models.Product;

public interface ProductRepository extends CrudRepository<Product, Long>{
	List<Product> findAll();
	Product findByIdIs(Long id);
	List<Product> findAllByCategories(Category category);
	List<Product> findByCategoriesNotContains(Category category);
}
