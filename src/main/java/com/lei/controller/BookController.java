package com.lei.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.lei.entity.Book;
import com.lei.model.DataListModel;
import com.lei.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {
	@Resource
	private BookService bookService;

	@RequestMapping(params = "list")
	@ResponseJSONP
	public DataListModel list() {
		
		List<Book> books = bookService.listBook();
		DataListModel d = new DataListModel();
		d.setCount(books.size());
		d.setData(books);
		System.out.println("********"+d.getCount());
		return d;
	}
	
	@RequestMapping(params = "toList")
	public String toList() {
		return "page/books/bookList";
	}
	
}
