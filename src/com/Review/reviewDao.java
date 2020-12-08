package com.Review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.frame.ObjectDao;
import com.mapper.reviewMapper;
import com.vo.Review;
@Component("ReviewDao")

public class reviewDao implements ObjectDao<String, Review> {

	@Autowired
	reviewMapper rm;

	@Override
	public void insert(Review v) {
		rm.insert(v);
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
		return rm.select(k);
	}

	@Override
	public ArrayList<Review> select(String k, String k1) {
		// TODO Auto-generated 
		return null;
	}

	@Override
	public ArrayList<Review> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String k, String k1, String k2, String k3) {
		// TODO Auto-generated method stub
		
	}

}
