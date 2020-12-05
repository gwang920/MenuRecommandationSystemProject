package com.Review;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.frame.ObjectBiz;
import com.frame.ObjectDao;
import com.vo.Review;

@Component("ReviewBiz")
public class reviewBiz implements ObjectBiz<String, Review> {

	@Resource(name="ReviewDao")
	ObjectDao<String,Review> dao;

	@Override
	public void insert(Review v) {
		dao.insert(v);
	}

	@Override
	public void delete(String k) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Review v) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Review> select(String k) {
		return dao.select(k);
	}

	@Override
	public ArrayList<Review> select(String k, String k1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Review> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
