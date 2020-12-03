package com.main;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.frame.StringDao;

public class Main {

	public static void main(String[] args) {
		AbstractApplicationContext factory = new GenericXmlApplicationContext("MySpring.xml");

		StringDao<String,String> ignoreDao = (StringDao<String, String>) factory.getBean("PreferenceDao");
		ignoreDao.insert("id01", "1040");

	}

}
