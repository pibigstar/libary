package com.lei.service;

import java.util.List;

import com.lei.entity.Book;

public interface BookService {

	
	List<Book> listBook(String page);

	List<Book> getBooksByName(String name);

	void addBook(Book book);

	int countBooks();
}
