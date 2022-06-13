package com.may22java.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.may22java.bookclub.models.Book;
import com.may22java.bookclub.models.LoginUser;
import com.may22java.bookclub.models.User;
import com.may22java.bookclub.services.BookService;
import com.may22java.bookclub.services.UserService;



@Controller
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	
	@GetMapping("/")
	public String index(
			@ModelAttribute("newUser")User user,
			@ModelAttribute("newLogin")LoginUser loginUser) {
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String registerUser(
			@Valid @ModelAttribute("newUser")User user,
			BindingResult result,
			@ModelAttribute("newLogin")LoginUser loginUser,
			HttpSession session) {
		userService.validateUser(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		userService.createUser(user);
		session.setAttribute("loggedInUser", user);
		return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin")LoginUser loginUser, 
			BindingResult result, 
			HttpSession session, 
			@ModelAttribute("newUser")User user) {
		userService.authenticateUser(loginUser, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User loggedInUser = userService.findByEmail(loginUser.getEmail());
		session.setAttribute("loggedInUser", loggedInUser);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")	
	public String dashboard(
			Model model, 
			HttpSession session) {
		List<Book> books = bookService.findAll();
		model.addAttribute("books", books);
		if(session.getAttribute("loggedInUser") != null) {
			return "dashboard.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/book/new")
	public String newBook(
			@ModelAttribute("book")Book book, 
			HttpSession session) {
		return "newBook.jsp";
	}
	
	@PostMapping("/book/new")
	public String createBook(@Valid @ModelAttribute("book")Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "newBook.jsp";
		}
		bookService.createBook(book);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/book/{id}/show")
	public String showBook(@PathVariable("id")Long id, Model model, HttpSession session) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "showBook.jsp";
	}
	
	@GetMapping("book/{id}/edit")
	public String editBook(@PathVariable("id")Long id, Model model) {		
		Book abook = bookService.findBook(id);
		model.addAttribute("book", abook);
		return "updateBook.jsp";		
	}
	
	@PutMapping("book/{id}")
	public String updateBook(@Valid @ModelAttribute("book")Book book, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute(book);
			return "updateBook.jsp";
		}
		bookService.updateBook(book);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}


