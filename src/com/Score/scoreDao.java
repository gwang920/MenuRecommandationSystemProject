package com.Score;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.frame.ObjectDao;
import com.mapper.scoreMapper;
import com.vo.Score;

@Component("ScoreDao")

public class scoreDao implements ObjectDao<String, Score> {

	@Autowired
	scoreMapper sm;

	@Override
	public void insert(Score v) {
		sm.insert(v);
	}

	@Override
	public void delete(String k) {
	}

	@Override
	public void update(Score v) {
	}

	@Override
	public ArrayList<Score> select(String k) {
		return sm.select(k);
	}

	@Override
	public ArrayList<Score> selectAll() {
		return sm.selectAll();
	}

	@Override
	public ArrayList<Score> select(String k, String k1) {
		// TODO Auto-generated method stub
		return sm.select(k, k1);
	}
}
