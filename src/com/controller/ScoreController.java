package com.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.frame.ObjectBiz;
import com.vo.Score;

@Controller
public class ScoreController {
	
	@Autowired
	@Qualifier("ScoreBiz")
	ObjectBiz<String, Score> biz;
	
	@RequestMapping("/scoreInsertImpl.mc")
	@ResponseBody
	public void scoreInsertImpl(Score score) {
		System.out.println(score);
		try {
			biz.insert(score);
		} catch (Exception e) {
			System.out.println("scoreInsertImpl error");
		}
	}
	
	@RequestMapping("/scoreUpdateImpl.mc")
	@ResponseBody
	public void scoreUpdateImpl(Score score) {
		System.out.println(score);
		try {
			biz.update(score);
		} catch (Exception e) {
			System.out.println("scoreUpdateImpl error");
		}
	}
	

	@RequestMapping("/getScore.mc")
	@ResponseBody
	public ArrayList<Score> getScore(String place_name,String place_address) {
		ArrayList<Score> sc=new ArrayList<Score>();
		try {
			sc=biz.select(place_name,place_address);
			System.out.println(sc);
		} catch (Exception e) {
			System.out.println("error");
		}
		return sc;
	}
}
