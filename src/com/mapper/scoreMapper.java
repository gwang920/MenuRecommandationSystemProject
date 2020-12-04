package com.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.vo.Score;

public interface scoreMapper {
	public void insert(Score obj);
	public ArrayList<Score> select(@Param("place_name") String obj,@Param("place_address") String obj2);
	public ArrayList<Score> select(String obj);
	public ArrayList<Score> selectAll();
	public void update(Score obj);
}



