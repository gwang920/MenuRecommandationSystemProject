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
	public ModelAndView joinImpl(ModelAndView mv, Score score) {
		System.out.println("scoreInsertImpl");
		mv.setViewName("index");
		biz.insert(score);
		System.out.println(score);
		return mv;
	}

	
	@RequestMapping("/getScore.mc")
	@ResponseBody
	public ArrayList<Score> getScore(String place_name,String place_address) {
		System.out.println(biz.selectAll());
		try {
			System.out.println(biz.select(place_name,place_address));
		} catch (Exception e) {
			System.out.println("error");
		}
		
		return biz.select(place_name,place_address);
	}
}
