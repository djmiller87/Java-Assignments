package com.may22java.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.may22java.productsandcategories.models.Category;
import com.may22java.productsandcategories.models.Product;
import com.may22java.productsandcategories.repositories.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    
    public ProductService(ProductRepository productRepository) {
    	this.productRepository = productRepository;
    }
    
    public Product createProduct(Product newProduct) {		
		productRepository.save(newProduct);
		return null;
	}
	
	public List<Product> findAll(){
		return productRepository.findAll();
	}
	
	public List<Product> getAssignedCategories(Category category){
    	return productRepository.findAllByCategories(category);
    }
    
    public List<Product> getUnassignedCategories(Category category){
    	return productRepository.findByCategoriesNotContains(category);
    }
	
	public Product findProduct(Long id) {
		Optional<Product> product = productRepository.findById(id);
		if(product.isPresent()) {
			return product.get();
		}
		else {
			return null;
		}
	}
	
	public Product findById(Long id) {
		return productRepository.findById(id).orElse(null);
	}
	
	public Product updateProduct( Product  product) {
		return productRepository.save( product);
	}
	
	public void deleteProduct(Long id) {
		 productRepository.deleteById(id);
	}
}
