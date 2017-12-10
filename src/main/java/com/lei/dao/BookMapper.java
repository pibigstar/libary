package com.lei.dao;

import java.util.List;

import com.lei.entity.Book;

public interface BookMapper {
    int deleteByPrimaryKey(String id);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

	List<Book> getList(int page);

	List<Book> getBooksByName(String name);

	int count();
}