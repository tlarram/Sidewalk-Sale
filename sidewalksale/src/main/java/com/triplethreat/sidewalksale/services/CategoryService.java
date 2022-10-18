package com.triplethreat.sidewalksale.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.triplethreat.sidewalksale.models.Category;
import com.triplethreat.sidewalksale.models.Product;
import com.triplethreat.sidewalksale.repositories.CategoryRepository;

@Service
public class CategoryService {
	private final CategoryRepository categoryRepo;
	
	public CategoryService (CategoryRepository categoryRepo) {
		this.categoryRepo= categoryRepo;
	}
	public List<Category> allCategories(){
		return this.categoryRepo.findAll();
	}
	
	public Category addCategory(Category category) {
		return categoryRepo.save(category);
	}
	
	public Category updateCategory(Category category) {
		return categoryRepo.save(category);
	}
	
	public void deleteCategory(Category category) {
		categoryRepo.delete(category);
	}
	public Category findById(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		}else {
			return null;
		}
	}
	public List<Category> getAssignedProducts(Product product){
		return categoryRepo.findAllByProducts(product);
	}
	
	public List<Category> getUnassignedProducts(Product product){
		return categoryRepo.findByProductsNotContains(product);
	}
}
