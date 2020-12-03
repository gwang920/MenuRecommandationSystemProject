package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;	
import com.frame.ObjectBiz;
import com.frame.StringBiz;
import com.mapper.preferenceMapper;
import com.vo.Food;

@Controller
public class MenuController {
	// 메뉴 리스트를 string 형식으로 가져온다. (선호테이블, 비선호 테이블에 없는 데이터만 )
	// [{"id":1,"name":"대하구이","imgName1":"123","imgName2":"123","imgName3":"123","category":"1"}]
	@RequestMapping(value="/menu_add_table_add_list.mc", produces="application/text; charset=utf8")
	@ResponseBody
	public String addMenuList(@RequestParam("id") String id) {
		// ObjectMapper 라이브러리는 JSON을 파싱해오기 좋다.
		ObjectMapper obm = new ObjectMapper();
		// xml을 읽어온다.
		// AbstractApplicationContext : 컨택스트를 생성하는 인터페이스
		// 즉, 설정파일.xml로 위치를 지정해주고, AbstractApplicationContext라는 인터페이스를 통해 저장한파일을 factory에 담고
		// getBean을 통해서 xml에 있는 클래스와 해당정보를 담는다.
		AbstractApplicationContext factory = new GenericXmlApplicationContext("MySpring.xml");
		ObjectBiz<String,Food> foodList = (ObjectBiz<String, Food>)factory.getBean("FoodBiz");
		String val ="fail";
		System.out.println(foodList +" ok");
		try {
			if(id == "") val = obm.writeValueAsString(foodList.selectAll());
			else val = obm.writeValueAsString(foodList.select(id));
			System.out.println(val);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return val;
	}
	
	@Autowired
	preferenceMapper pm;
	
	// Delete 기능 = > 선호 테이블에 있는 메뉴를 가져온다. (선호 테이블에 있는 데이터를 삭제하기 위함)
	@RequestMapping(value="/add_pre_roullet.mc",  produces="application/text; charset=utf8")
	@ResponseBody
	public String addPreInRoullet(@RequestParam("id") String id) {
		
		ObjectMapper obm = new ObjectMapper();
		AbstractApplicationContext factory = new GenericXmlApplicationContext("MySpring.xml");
		StringBiz<String,String> preBiz = (StringBiz<String,String>)factory.getBean("PreferenceBiz");
		String val ="fail";

		try {
			val = obm.writeValueAsString(pm.selectById(id));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return val;
	}
	
	// 선호테이블에 데이터가 들어간다.
	@RequestMapping("AddPre.mc")
	@ResponseBody
	public String addPreTable(@RequestParam("id") String id,@RequestParam("name") String name) {
		AbstractApplicationContext factory = new GenericXmlApplicationContext("MySpring.xml");
		StringBiz<String, String> PreBiz = (StringBiz<String, String>)factory.getBean("PreferenceBiz");
		try {
			PreBiz.insert(id, name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	// 선호 테이블 데이터를 삭제한다.
	@RequestMapping("delPre.mc")
	@ResponseBody
	public String DelPreTable(@RequestParam("id") String id,@RequestParam("name") String name) {
		AbstractApplicationContext factory = new GenericXmlApplicationContext("MySpring.xml");
		StringBiz<String, String> PreBiz = (StringBiz<String, String>)factory.getBean("PreferenceBiz");
		try {
			PreBiz.delete(id, name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	@RequestMapping("AddIgnore.mc")
	@ResponseBody
	public String addIgnTable(@RequestParam("id") String id,@RequestParam("name") String name) {
		AbstractApplicationContext factory = new GenericXmlApplicationContext("MySpring.xml");
		StringBiz<String,String> IgnBiz = (StringBiz<String,String>)factory.getBean("IgnoreBiz");
		try {
			IgnBiz.insert(id, name);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
}
