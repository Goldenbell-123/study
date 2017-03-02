package com.acorn.model.vo;

/*
CREATE TABLE TBL_USER(
	ID		VARCHAR2(50) PRIMARY KEY,
	UPW		VARCHAR2(50),
	UNAME	VARCHAR2(100),
	UPOINT	NUMBER	DEFAULT	0
);
insert into tbl_user values('admin','admin','김지성',0);
 */

public class UserVO {
	private String id,upw,uname;
	private int upoint;
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVO(String id, String upw, String uname, int upoint) {
		super();
		this.id = id;
		this.upw = upw;
		this.uname = uname;
		this.upoint = upoint;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", upw=" + upw + ", uname=" + uname + ", upoint=" + upoint + "]";
	}
	
	
	

}
