package com.triplethreat.sidewalksale.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="products")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min=3, max=200, message="Name is required")
	private String name;
	
	@NotNull
	@Size(min=3, max=200, message="Description is required")
	private String description;
	
	@NotNull
	@Min(value = 0, message="Price is required")
	private Double price;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
   
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	
	 @ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	        name = "categories_products", 
	        joinColumns = @JoinColumn (name = "product_id"), 
	        inverseJoinColumns = @JoinColumn(name = "category_id")
	    )
	    private List<Category> categories;
	 
	 @ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	        name = "products", 
	        joinColumns = @JoinColumn(name = "user_id"), 
	        inverseJoinColumns = @JoinColumn(name = "product_id")
	    )
	    private List<User> savedBy;
	 
	    @ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name="user_id")
		private User seller;
	    
	    
public List<Category> getCategories() {
			return categories;
		}

		public void setCategories(List<Category> categories) {
			this.categories = categories;
		}

		public List<User> getSavedBy() {
			return savedBy;
		}

		public void setSavedBy(List<User> savedBy) {
			this.savedBy = savedBy;
		}

		public User getSeller() {
			return seller;
		}

		public void setSeller(User seller) {
			this.seller = seller;
		}

public Product(){
	
}

public Long getId() {
	return id;
}

public void setId(Long id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public Double getPrice() {
	return price;
}

public void setPrice(Double price) {
	this.price = price;
}

public Date getCreatedAt() {
	return createdAt;
}

public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}

public Date getUpdatedAt() {
	return updatedAt;
}

public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
}

}