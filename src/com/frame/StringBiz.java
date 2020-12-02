package com.frame;

import java.util.ArrayList;

public interface StringBiz<K,V> {
	public void insert(K k, V v);
	public void delete(K k,K k1);
	public void update(K k,V v);
	public ArrayList<String> select(K k);
	public ArrayList<String> selectAll();
	void delete(String id);
}
