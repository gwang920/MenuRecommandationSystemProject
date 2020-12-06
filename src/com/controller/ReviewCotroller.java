package com.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frame.ObjectBiz;
import com.vo.Review;

@Controller
public class ReviewCotroller {

	@Autowired
	@Qualifier("ReviewBiz")
	ObjectBiz<String, Review> biz;
	
	@RequestMapping("/upload_review.mc")
	@ResponseBody
	public void upload_review(Review review) {
		System.out.println(review);
		try {
			biz.insert(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/select_review.mc")
	@ResponseBody
	public ArrayList<Review> select_review(String place_address,int page) {
		ArrayList<Review> rs=new ArrayList<Review>();
		ArrayList<Review> frs=new ArrayList<Review>();
		try {
			rs=biz.select(place_address);
			for(int i=page*5;i<=page+6;i++) {
				if(i>=rs.size()) break;
				frs.add(rs.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return frs;
	}
}
