package com.lei.service.impl;

import java.util.List;

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
	public List<Book> listBook() {
		return bookDao.getList();
	}

}
