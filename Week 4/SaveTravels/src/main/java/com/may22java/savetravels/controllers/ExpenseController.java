package com.may22java.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.may22java.savetravels.models.Expense;
import com.may22java.savetravels.services.ExpenseService;



@Controller
public class ExpenseController {
	private final ExpenseService expenseService;
	
	public ExpenseController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}
	@GetMapping("/expenses")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
	     List<Expense> expenses = expenseService.allExpenses();
	     model.addAttribute("expenses", expenses);
	     return "index.jsp";
	}
	
	@PostMapping("/expense/new")
	public String createExpense(@Valid @ModelAttribute("expense")Expense expense, BindingResult result,Model model) {
		List<Expense> expenses = expenseService.allExpenses();
	     model.addAttribute("expenses", expenses);
		if (result.hasErrors()) {
			return "index.jsp";
		} 
		else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
}
