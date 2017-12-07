package com.lei.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lei.entity.Book;
import com.lei.model.DataListModel;
import com.lei.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {
	@Resource
	private BookService bookService;

	@RequestMapping("list")
	@ResponseBody
	public DataListModel list() {
		
		List<Book> books = bookService.listBook();
		DataListModel d = new DataListModel();
		d.setCount(books.size());
		d.setObject(books);
		System.out.println("********"+d.getCount());
		return d;
	}
	
}
