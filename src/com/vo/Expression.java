package com.vo;

public class Expression {
	String review_id;
	String user_id;
	String place_address;
	String motion;
	
	public Expression() {
		
	}
	public Expression(String review_id,String user_id,String place_address,String motion){
		this.review_id=review_id;
		this.user_id=user_id;
		this.place_address=place_address;
		this.motion=motion;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPlace_address() {
		return place_address;
	}
	public void setPlace_address(String place_address) {
		this.place_address = place_address;
	}
	public String getMotion() {
		return motion;
	}
	public void setMotion(String motion) {
		this.motion = motion;
	}
}
