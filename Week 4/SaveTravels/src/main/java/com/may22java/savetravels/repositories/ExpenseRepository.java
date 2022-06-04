package com.may22java.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.may22java.savetravels.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Long>{
	
    List<Expense> findAll();
    
    List<Expense> findByDescriptionContaining(String search);
    // this method counts how many titles contain a certain string
//    Long countByTitleContaining(String search);
    // this method deletes a book that starts with a specific title
//    Long deleteByTitleStartingWith(String search);

}
