package com.triplethreat.sidewalksale.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.triplethreat.sidewalksale.config.FileUploadUtil;
import com.triplethreat.sidewalksale.models.Product;
import com.triplethreat.sidewalksale.repositories.ProductRepository;
import com.triplethreat.sidewalksale.services.ProductService;
import com.triplethreat.sidewalksale.services.UserService;

@Controller
public class ProductController {
	@Autowired 
	private ProductService productService;
	
	@Autowired 
	ProductRepository productRepo;
	@Autowired
	private UserService userServ;
	
	//ADD AN ITEM
	//show the form
	@GetMapping("/sidewalk-sale/add-item")
	public String addItem(@ModelAttribute("newProduct") Product newProduct, Model model, HttpSession session, Principal principal) {
		String email = principal.getName();
        model.addAttribute("currentUser", userServ.findByEmail(email));
		return "addItem.jsp";
		
	}
	//process the form
	@PostMapping("/sidewalk-sale/add-item")
	public String processProduct(
			@Valid @ModelAttribute("newProduct") Product product,
			BindingResult result, @RequestParam("image") MultipartFile multipartFile, Model model, HttpSession session) throws IOException{
//		if(result.hasErrors()) {
//			return "addItem.jsp";
//		} else {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
	        product.setPhotos(fileName);
	        
	        Product savedProduct = productRepo.save(product);
	        
	        String uploadDir = "src/main/resources/static/image/user-photos/" + savedProduct.getId();
	        
	        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
	        String productLocation = (String) session.getAttribute("userLocation");
	        product.setLocation(productLocation);
			productService.addProduct(product);
			return "redirect:/sidewalk-sale";
//		}
	}
	

}
