package com.lei.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.lei.entity.Book;
import com.lei.model.DataListModel;
import com.lei.model.JSONModel;
import com.lei.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {
	@Resource
	private BookService bookService;
	
	
	@RequestMapping(params = "toList")
	public String toList() {
		return "page/books/bookList";
	}
	
	@RequestMapping(params = "toBookAdd")
	public String toBookAdd() {
		return "page/books/bookAdd";
	}

	//列表初始化
	@RequestMapping(params = "list")
	@ResponseJSONP
	public DataListModel list(String page) {
		List<Book> books = bookService.listBook(page);
		int count = bookService.countBooks();
		DataListModel d = new DataListModel();
		d.setCount(count);
		d.setData(books);
		return d;
	}
	//查询
	@RequestMapping(params = "search")
	@ResponseJSONP
	public DataListModel search(@RequestParam(value="name", required=false)String name) {
		
		List<Book> books = bookService.getBooksByName(name);
		DataListModel d = new DataListModel();
		d.setCount(books.size());
		d.setData(books);
		return d;
	}
	
	/**
	 * 添加图书
	 * @return
	 */
	@RequestMapping(params = "addBook",method = RequestMethod.POST)
	@ResponseJSONP
	public JSONModel add(Book book) {
		System.out.println(book.getName());
		JSONModel j = new JSONModel();
		try {
			bookService.addBook(book);
			j.setMsg("图书添加成功");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
			j.setSuccess(false);
		}
		return j;
	}

}
