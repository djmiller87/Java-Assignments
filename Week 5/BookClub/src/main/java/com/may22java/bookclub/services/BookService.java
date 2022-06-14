package com.may22java.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.may22java.bookclub.models.Book;
import com.may22java.bookclub.models.User;
import com.may22java.bookclub.repositories.BookRepository;

@Service
public class BookService {
	private final BookRepository bookRepository;
	
	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
	}
	
	public Book createBook(Book newBook) {
		return bookRepository.save(newBook);
	}
	
	public Book findBook(Long id) {
		Optional<Book> book = bookRepository.findById(id);
		if(book.isPresent()) {
			return book.get();
		}
		else {
			return null;
		}
	}
	
	public List<Book> findAll(){
		return bookRepository.findAll();
	}
	
	public Book updateBook(Book book) {
		return bookRepository.save(book);
	}
	
	public void addBorrower(Book book, User user) {
		book.setBorrower(user);
		bookRepository.save(book);
	}
	
	public void removeBorrower(Book book) {
		book.setBorrower(null);
		bookRepository.save(book);
	}
		
	
	public void deleteBook(Long id) {
		bookRepository.deleteById(id);
	}

}
