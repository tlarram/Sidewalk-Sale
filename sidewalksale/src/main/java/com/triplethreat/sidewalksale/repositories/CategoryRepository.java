package com.triplethreat.sidewalksale.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.triplethreat.sidewalksale.models.Category;
import com.triplethreat.sidewalksale.models.Product;

public interface CategoryRepository extends CrudRepository <Category, Long> {
	List<Category> findAll();
	Category findByIdIs(Long id);
	List<Category> findAllByProducts(Product product);
	List<Category> findByProductsNotContains(Product product);
 
}
