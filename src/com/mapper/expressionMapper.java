package com.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.vo.Expression;

public interface expressionMapper {
	public void insert(Expression v);
	public void delete(String id);
	public void delete(@Param("review_id") String review_id,@Param("user_id") String user_id,@Param("place_address") String place_address,@Param("motion") String motion);
	public void update(Expression exp);
	public ArrayList<Expression> select(String id);
	public ArrayList<Expression> selectall();
}



