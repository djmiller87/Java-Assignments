package com.may22java.allbooks.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.may22java.allbooks.models.Book;
import com.may22java.allbooks.services.BookService;

//... imports removed for brevity
@Controller
public class BooksController {
 private final BookService bookService;
 
 public BooksController(BookService bookService) {
     this.bookService = bookService;
 }
 
 @RequestMapping("/books")
 public String index(Model model) {
     List<Book> books = bookService.allBooks();
     model.addAttribute("books", books);
     return "index.jsp";
 }
 
 @RequestMapping("/book/{id}/show")
	public String showBook(Model model,@PathVariable("id") Long id) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "show.jsp";
	}
}

