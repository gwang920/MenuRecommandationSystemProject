package com.Expression;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.frame.ObjectBiz;
import com.frame.ObjectDao;
import com.vo.Expression;

@Component("ExpressionBiz")
public class ExpressionBiz implements ObjectBiz<String, Expression> {

	@Resource(name="ExpressionDao")
	ObjectDao<String,Expression> dao;

	@Override
	public void insert(Expression v) {
		dao.insert(v);
	}
	


	@Override
	public void update(Expression v) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Expression> select(String k) {
		// TODO Auto-generated method stub
		return dao.select(k);
	}

	@Override
	public ArrayList<Expression> select(String k, String k1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Expression> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public void delete(String k) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void delete(String k, String k1, String k2, String k3) {
		dao.delete(k, k1, k2, k3);
	}

}
