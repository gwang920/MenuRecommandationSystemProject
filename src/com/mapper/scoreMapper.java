package com.mapper;

import java.util.ArrayList;

import com.vo.Score;

public interface scoreMapper {
	public void insert(Score obj);
	public ArrayList<Score> select(String obj,String obj2);
	public ArrayList<Score> select(String obj);
	public ArrayList<Score> selectAll();
}



