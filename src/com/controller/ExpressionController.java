package com.controller;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frame.ObjectBiz;
import com.vo.Expression;

@Controller
public class ExpressionController {

	@Autowired
	@Qualifier("ExpressionBiz")
	ObjectBiz<String, Expression> biz;
	
	@RequestMapping("/upload_expression.mc")
	@ResponseBody
	public void upload_review(String review_id,String user_id,String place_address,String motion) {
		Expression expression=new Expression(review_id,user_id, place_address,motion);
		
		try {
			biz.insert(expression);
		} catch (Exception e) {
			System.out.println("expression error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/select_Expression.mc")
	@ResponseBody
	public ArrayList<Expression> select_expression(String place_address) {
		ArrayList<Expression> rs=new ArrayList<Expression>();
		try {
			rs=biz.select(place_address);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	@RequestMapping("/delete_Expression.mc")
	@ResponseBody
	public void delete_expression(String review_id,String user_id,String place_address,String motion) {
		System.out.println(review_id);
		try {
			biz.delete(review_id,user_id,place_address,motion);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
