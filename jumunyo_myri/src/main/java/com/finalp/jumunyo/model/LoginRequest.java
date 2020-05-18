package com.finalp.jumunyo.model;

public class LoginRequest {
	
	String user_id;
	String user_password;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	
	public boolean passwordCheck(String password) {
		if(this.user_password.equals(password))
			return true;
		return false;
	}

}
