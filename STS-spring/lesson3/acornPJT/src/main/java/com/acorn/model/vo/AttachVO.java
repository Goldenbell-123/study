package com.acorn.model.vo;
/*
CREATE TABLE TBL_ATTACH(
	IMG			VARCHAR2(500)	PRIMARY	KEY,
	BNO			NUMBER			REFERENCES	TBL_BOARD(BNO),
	REGDATE		DATE
);
*/

public class AttachVO {

	private String img;
	private int bno;
	private String regdate;
	public AttachVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AttachVO(String img, int bno, String regdate) {
		super();
		this.img = img;
		this.bno = bno;
		this.regdate = regdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "AttachVO [img=" + img + ", bno=" + bno + ", regdate=" + regdate + "]";
	}
	
	
}
