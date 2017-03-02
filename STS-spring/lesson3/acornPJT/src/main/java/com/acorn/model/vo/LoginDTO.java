package com.acorn.model.vo;

public class LoginDTO {
	private String id, upw;
	private boolean useCookie;
	
	public LoginDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginDTO(String id, String upw, boolean useCookie) {
		super();
		this.id = id;
		this.upw = upw;
		this.useCookie = useCookie;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", upw=" + upw + ", useCookie=" + useCookie + "]";
	}
	
	
}
