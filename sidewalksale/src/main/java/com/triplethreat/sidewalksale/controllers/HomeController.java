package com.triplethreat.sidewalksale.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.triplethreat.sidewalksale.models.Category;
import com.triplethreat.sidewalksale.models.Contact;
import com.triplethreat.sidewalksale.models.GeoIP;

import com.triplethreat.sidewalksale.models.Product;
import com.triplethreat.sidewalksale.models.User;
import com.triplethreat.sidewalksale.repositories.ProductRepository;
import com.triplethreat.sidewalksale.repositories.UserRepository;
import com.triplethreat.sidewalksale.services.CategoryService;
import com.triplethreat.sidewalksale.services.GeoIPService;
import com.triplethreat.sidewalksale.services.ProductService;
import com.triplethreat.sidewalksale.services.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userServ;
	@Autowired
	private ProductService productServ;
	@Autowired
	private CategoryService categoryServ;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private UserRepository userRepo;

	
	
	@GetMapping(value={"/", "/sidewalk-sale"})
    public String dashboard(HttpSession session,Model model, Principal principal) {
        String email = principal.getName();
        model.addAttribute("currentUser", userServ.findByEmail(email));
        //to find all products on home page
        model.addAttribute("productList", productServ.allProducts());
		List<Product> products= productServ.allProducts();
		//checks for correct file path
		products.forEach(p -> System.out.println(p.getPhotosImagePath()));
		
		List<Category> categories= categoryServ.allCategories();
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
    	return "homePage.jsp";
    }
	
	@GetMapping("/sidewalk-sale/saved-listings")
    public String savedListings(HttpSession session,Model model, Principal principal) {
        String email = principal.getName();
        model.addAttribute("currentUser", userServ.findByEmail(email));
		List<Product> savedProducts= productServ.allProducts();
		model.addAttribute("savedProducts", savedProducts);
    return "savePage.jsp";
    }
	

	@GetMapping("/soldbyme")
	public String itemsSoldByUser(Model model, Principal principal) {
		String email = principal.getName();
        model.addAttribute("currentUser", userServ.findByEmail(email));
		List<Product> products= productServ.allProducts();
		model.addAttribute("products", products);
		return "soldByUser.jsp";
	}
	
	//Delete item listed by the seller
	@DeleteMapping("/deletelisteditem/{id}")
	public String deleteListedItem(@PathVariable("id")Long id) {
		Product thisProd = productServ.findById(id);
		productServ.deleteProduct(thisProd);
		return"redirect:soldbyme";
	}
	//For user to add item to their saved list
	@PutMapping("/saved/{id}")
    public String saveProduct(@PathVariable("id" ) Long productId,Model model,Principal principal ) {
        String email = principal.getName();
        model.addAttribute("currentUser", userServ.findByEmail(email));
        User thisUser=userServ.findByEmail(email);
        Product thisProduct= productServ.findById(productId);
        thisUser.getSavedProducts().add(thisProduct);
        thisProduct.getSavedBy().add(thisUser);
        userRepo.save(thisUser);
        productRepo.save(thisProduct);
        return "redirect:/";
	}

	@PutMapping("/unsave/{id}")
    public String unsaveProduct(@PathVariable("id" ) Long productId,Model model,Principal principal ) {
        String email = principal.getName();
        model.addAttribute("currentUser", userServ.findByEmail(email));
        User thisUser=userServ.findByEmail(email);
        Product thisProduct= productServ.findById(productId);
        thisUser.getSavedProducts().remove(thisProduct);
        thisProduct.getSavedBy().remove(thisUser);
        userRepo.save(thisUser);
        productRepo.save(thisProduct);
        return "redirect:/sidewalk-sale/saved-listings";
	}

	//DETAILS
		@GetMapping("/sidewalk-sale/details/{id}")
		public String details(@PathVariable("id") Long id, Model model,
				ModelMap modelMap) {
			modelMap.put("contact", new Contact());
			// to view product
			Product product = productServ.findById(id);
			model.addAttribute("product", product);
			return "details.jsp";
		}
		
		

}
