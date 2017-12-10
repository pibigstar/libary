package com.lei.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lei.dao.BookMapper;
import com.lei.entity.Book;
import com.lei.service.BookService;
@Service("bookService")
public class BookServiceImpl implements BookService {

	@Resource
	private BookMapper bookDao;
	@Override
	public List<Book> listBook(String p) {
		int page = Integer.parseInt(p);
		page = (page-1)*10;
		return bookDao.getList(page);
	}
	@Override
	public List<Book> getBooksByName(String name) {
		
		return bookDao.getBooksByName(name);
	}
	@Override
	public void addBook(Book book) {
		book.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		book.setDeleteFlag("0");
		book.setUpdateTime(book.getCreateTime());
		bookDao.insertSelective(book);
		
	}
	@Override
	public int countBooks() {
		return bookDao.count();
	}

}
