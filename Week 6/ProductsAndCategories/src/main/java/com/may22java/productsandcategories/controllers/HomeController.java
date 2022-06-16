package com.may22java.productsandcategories.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.may22java.productsandcategories.models.Category;
import com.may22java.productsandcategories.models.Product;
import com.may22java.productsandcategories.services.CategoryService;
import com.may22java.productsandcategories.services.ProductService;

@Controller
public class HomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		return "home.jsp";
	}
	
	@GetMapping("/product/new")
	public String newProduct(@ModelAttribute("product")Product product) {
		return "newProduct.jsp";
	}
	
	@PostMapping("/product/create")
	public String createProduct(@Valid @ModelAttribute("product")Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "newProduct.jsp";
		}
		else {
			productService.createProduct(product);
			return "redirect:/";
		}
	}
	
	@GetMapping("/product/{id}")
	public String showProduct(@PathVariable("id")Long id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		List<Category> unassignedCategories = categoryService.getUnassignedProducts(product);
		model.addAttribute("unassignedCategories", unassignedCategories);
		return "product.jsp";
	}
	
	@PostMapping("/product/{id}")
	public String addCategoryToProduct(@PathVariable("id")Long id, @RequestParam(value="categoryId")Long categoryId, Model model) {
		Product product= productService.findById(id);		
		Category category = categoryService.findById(categoryId);
		product.getCategories().add(category);
		productService.updateProduct(product);
		model.addAttribute("assignedCategories", categoryService.getAssignedProducts(product));
		model.addAttribute("unassignedCategories", categoryService.getUnassignedProducts(product));
		return "redirect:/product/" + id;
		
	}
	
	@GetMapping("/category/new")
	public String newCategory(@ModelAttribute("category")Category category) {
		return "newCategory.jsp";
	}
	
	@PostMapping("/category/create")
	public String createCategory(@Valid @ModelAttribute("category")Category category, BindingResult result) {
		if(result.hasErrors()) {
			return "newCategory.jsp";
		}
		else {
			categoryService.createCategory(category);
			return "redirect:/";
		}
	}
	
	@GetMapping("/category/{id}")
	public String showCategory(@PathVariable("id")Long id, Model model) {
		Category category = categoryService.findById(id);
		model.addAttribute("category", category);
		List<Product> unassignedProducts = productService.getUnassignedCategories(category);
		model.addAttribute("unassignedProducts", unassignedProducts);
		return "category.jsp";		
	}
	
	@PostMapping("/category/{id}")
	public String addProductToCategory(@PathVariable("id")Long id, @RequestParam(value="productId")Long productId, Model model) {
		Category category = categoryService.findById(id);
		Product product = productService.findById(productId);
		category.getProducts().add(product);
		categoryService.updateCategory(category);
		model.addAttribute("assignedProducts", productService.getAssignedCategories(category));
		model.addAttribute("unassignedProducts", productService.getUnassignedCategories(category));
		return "redirect:/category/" + id;
		
	}
}
