package com.may22java.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.may22java.productsandcategories.models.Category;
import com.may22java.productsandcategories.models.Product;
import com.may22java.productsandcategories.repositories.CategoryRepository;

@Service
public class CategoryService {
	private final CategoryRepository categoryRepository;
	
	public CategoryService(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}
	
    public Category createCategory(Category newCategory) {		
		categoryRepository.save(newCategory);
		return null;
	}

    public List<Category> findAll(){
		return categoryRepository.findAll();
	}
    
    public List<Category> getAssignedProducts(Product product){
    	return categoryRepository.findAllByProducts(product);
    }
    
    public List<Category> getUnassignedProducts(Product product){
    	return categoryRepository.findByProductsNotContains(product);
    }
	
	public Category findCategory(Long id) {
		Optional<Category> category = categoryRepository.findById(id);
		if(category.isPresent()) {
			return category.get();
		}
		else {
			return null;
		}
	}
	
	public  Category findById(Long id) {
		return categoryRepository.findById(id).orElse(null);
	}
	
	public  Category updateCategory(Category  products) {
		return categoryRepository.save( products);
	}
	
	public void deleteCategory(Long id) {
		 categoryRepository.deleteById(id);
	}

}
