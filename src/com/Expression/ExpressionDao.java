package com.Expression;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.frame.ObjectDao;
import com.mapper.expressionMapper;
import com.vo.Expression;

@Component("ExpressionDao")

public class ExpressionDao implements ObjectDao<String, Expression> {

	@Autowired
	expressionMapper em;

	@Override
	public void insert(Expression v) {
		em.insert(v);
	}

	@Override
	public void delete(String k) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Expression v) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Expression> select(String k) {
		// TODO Auto-generated method stub
		return em.select(k);
	}

	@Override
	public ArrayList<Expression> select(String k, String k1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Expression> selectAll() {
		// TODO Auto-generated method stub
		return em.selectall();
	}

	@Override
	public void delete(String k, String k1, String k2,String k3) {
		em.delete(k, k1, k2,k3);
	}
}
