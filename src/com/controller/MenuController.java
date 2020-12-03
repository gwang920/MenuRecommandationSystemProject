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
	// �޴� ����Ʈ�� string �������� �����´�. (��ȣ���̺�, ��ȣ ���̺� ���� �����͸� )
	// [{"id":1,"name":"���ϱ���","imgName1":"123","imgName2":"123","imgName3":"123","category":"1"}]
	@RequestMapping(value="/menu_add_table_add_list.mc", produces="application/text; charset=utf8")
	@ResponseBody
	public String addMenuList(@RequestParam("id") String id) {
		// ObjectMapper ���̺귯���� JSON�� �Ľ��ؿ��� ����.
		ObjectMapper obm = new ObjectMapper();
		// xml�� �о�´�.
		// AbstractApplicationContext : ���ý�Ʈ�� �����ϴ� �������̽�
		// ��, ��������.xml�� ��ġ�� �������ְ�, AbstractApplicationContext��� �������̽��� ���� ������������ factory�� ���
		// getBean�� ���ؼ� xml�� �ִ� Ŭ������ �ش������� ��´�.
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
	
	// Delete ��� = > ��ȣ ���̺� �ִ� �޴��� �����´�. (��ȣ ���̺� �ִ� �����͸� �����ϱ� ����)
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
	
	// ��ȣ���̺� �����Ͱ� ����.
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
	
	// ��ȣ ���̺� �����͸� �����Ѵ�.
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
