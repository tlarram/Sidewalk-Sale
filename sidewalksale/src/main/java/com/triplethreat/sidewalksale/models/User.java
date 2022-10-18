package com.triplethreat.sidewalksale.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue
    private Long id;
    // NEW
    @Size(min=3)
    private String firstName;
    @Size(min=3)
    private String lastName;
    @Size(min=5)
    private String password;
    @Size(min=5)
    private String email;
	@Transient
    private String passwordConfirmation;
    private Date createdAt;
    private Date updatedAt;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List <Role> roles;

    public List<Product> getSavedProducts() {
		return savedProducts;
	}
	public void setSavedProducts(List<Product> savedProducts) {
		this.savedProducts = savedProducts;
	}
	public List<Product> getProductPosted() {
		return productPosted;
	}
	public void setProductPosted(List<Product> productPosted) {
		this.productPosted = productPosted;
	}
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "products", 
        joinColumns = @JoinColumn(name = "product_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<Product> savedProducts;
    
    @OneToMany(mappedBy="seller", fetch = FetchType.LAZY)
    private List<Product> productPosted;
    
    public User() {
    }
    public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
   
    
    public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
//	public Boolean getIsSeller() {
//		return isSeller;
//	}
//	public void setIsSeller(Boolean isSeller) {
//		this.isSeller = isSeller;
//	}
	public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }
    public void setPasswordConfirmation(String passwordConfirmation) {
        this.passwordConfirmation = passwordConfirmation;
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
    public List<Role> getRoles() {
        return roles;
    }
    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
