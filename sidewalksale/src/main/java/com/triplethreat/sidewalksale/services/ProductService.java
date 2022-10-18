package com.triplethreat.sidewalksale.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.triplethreat.sidewalksale.models.Category;
import com.triplethreat.sidewalksale.models.Product;
import com.triplethreat.sidewalksale.repositories.ProductRepository;

@Service
public class ProductService {
	private final ProductRepository productRepo;
	
	public ProductService(ProductRepository productRepo) {
		this.productRepo= productRepo;
	}
	
	//FIND ALL
	public List<Product> allProducts(){
		return productRepo.findAll();
	}
	
	//CREATE
	public Product addProduct(Product product) {
		return productRepo.save(product);
	}
	
	//UPDATE
	public Product updateProduct(Product product) {
		return productRepo.save(product);
	}
	
	//DELETE
	public void deleteProduct(Product product) {
		productRepo.delete(product);
	}
	
	//FIND ONE
	public Product findById(Long id) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		}else {
			return null;
		}
	}
	public List<Product> getAssignedCategories(Category category){
		return productRepo.findAllByCategories(category);
	}
	
	public List<Product> getUnassignedCategories(Category category){
		return productRepo.findByCategoriesNotContains(category);
	}
}
