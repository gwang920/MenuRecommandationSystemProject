package com.Score;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.frame.ObjectBiz;
import com.frame.ObjectDao;
import com.vo.Score;

@Component("ScoreBiz")
public class scoreBiz implements ObjectBiz<String, Score> {

	@Resource(name="ScoreDao")
	ObjectDao<String,Score> dao;

	@Override
	public void insert(Score v) {
		dao.insert(v);
	}

	@Override
	public void delete(String k) {
		
	}

	@Override
	public void update(Score v) {
		dao.update(v);
	}

	@Override
	public ArrayList<Score> select(String k) {
		return dao.select(k);
	}

	@Override
	public ArrayList<Score> selectAll() {
		return dao.selectAll();
	}

	@Override
	public ArrayList<Score> select(String k, String k1) {
		return dao.select(k, k1);
	}
}
