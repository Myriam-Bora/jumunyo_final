package com.finalp.jumunyo.model;

import java.util.Date;

public class QuestionRequest {
	
	private int question_id;
	private String question_category_name;
	private String question_title;
	private String question_content;
	private String user_name;
	private Date question_date;
	private String question_check;
	private int question_category_id;
	private int user_id;
	private String question_image;
	private int user_id_receive;
	
	public int getUser_id_receive() {
		return user_id_receive;
	}
	public void setUser_id_receive(int user_id_receive) {
		this.user_id_receive = user_id_receive;
	}
	public String getQuestion_image() {
		return question_image;
	}
	public void setQuestion_image(String question_image) {
		this.question_image = question_image;
	}
	public int getQuestion_category_id() {
		return question_category_id;
	}
	public void setQuestion_category_id(int question_category_id) {
		this.question_category_id = question_category_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getQuestion_category_name() {
		return question_category_name;
	}
	public void setQuestion_category_name(String question_category_name) {
		this.question_category_name = question_category_name;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}
	public String getQuestion_check() {
		return question_check;
	}
	public void setQuestion_check(String question_check) {
		this.question_check = question_check;
	}

	
}
