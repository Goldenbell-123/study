package com.acorn.model.vo;

/*
CREATE TABLE TBL_REPLY(
	RBNO NUMBER PRIMARY KEY,
	RCONTENT VARCHAR2(200),
	RWRITER	VARCHAR2(20),
	BNO NUMBER REFERENCES TBL_BOARD(BNO)
);

 CREATE SEQUENCE TBL_REPLYSEQ;
 * */
public class ReplyVO {

	private int rbno;
	private String rcontent,rwriter;
	private int bno;
	
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReplyVO(int rbno, String rcontent, String rwriter, int bno) {
		super();
		this.rbno = rbno;
		this.rcontent = rcontent;
		this.rwriter = rwriter;
		this.bno = bno;
	}
	
	public int getRbno() {
		return rbno;
	}
	public void setRbno(int rbno) {
		this.rbno = rbno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

	@Override
	public String toString() {
		return "ReplyVO [rbno=" + rbno + ", rcontent=" + rcontent + ", rwriter=" + rwriter + ", bno=" + bno + "]";
	}
	
	
}
