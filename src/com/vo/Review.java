package com.vo;

import java.sql.Date;

public class Review {
	int review_id;
	String time;
	String content;
	String user_id;
	Boolean is_deleted;
	String place_name;
	String place_address;
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Boolean getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(Boolean is_deleted) {
		this.is_deleted = is_deleted;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_address() {
		return place_address;
	}
	public void setPlace_address(String place_address) {
		this.place_address = place_address;
	}
	@Override
	public String toString() {
		return "Review [review_id=" + review_id + ", time=" + time + ", content=" + content + ", user_id=" + user_id
				+ ", is_deleted=" + is_deleted + ", place_name=" + place_name + ", place_address=" + place_address
				+ "]";
	}
}
