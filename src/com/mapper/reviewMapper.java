package com.mapper;

import java.util.ArrayList;

import com.vo.Review;

public interface reviewMapper {
	public void insert(Review obj);
	public void delete(String obj);
	public void update(Review obj);
	public ArrayList<Review> select(String obj);
	public ArrayList<Review> select(String obj1,String obj2);
	public ArrayList<Review> selectall();
}