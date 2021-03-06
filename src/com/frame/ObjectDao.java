package com.frame;

import java.util.ArrayList;

public interface ObjectDao<K,V> {
	public void insert(V v);
	public void delete(K k);
	public void delete(K k,K k1,K k2,K k3);
	public void update(V v);
	public ArrayList<V> select(K k);
	public ArrayList<V> select(K k,K k1);
	public ArrayList<V> selectAll();
}
