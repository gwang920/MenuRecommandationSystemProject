package com.User;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.frame.ObjectBiz;
import com.frame.ObjectDao;
import com.vo.User;

@Component("UserBiz")
public class userBiz implements ObjectBiz<String, User> {

	@Resource(name="UserDao")
	ObjectDao<String,User> dao;
	
	@Override
	public void insert(User v) {
		// TODO Auto-generated method stub
		dao.insert(v);
	}

	@Override
	public void delete(String k) {
		// TODO Auto-generated method stub
		dao.delete(k);
	}

	@Override
	public void update( User v) {
		// TODO Auto-generated method stub
		dao.update(v);
	}

	@Override
	public ArrayList<User> select(String k) {
		System.out.println("userBiz");
		// TODO Auto-generated method stub
		return dao.select(k);
	}

	@Override
	public ArrayList<User> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public ArrayList<User> select(String k, String k1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String k, String k1, String k2, String k3) {
		// TODO Auto-generated method stub
		
	}


}
