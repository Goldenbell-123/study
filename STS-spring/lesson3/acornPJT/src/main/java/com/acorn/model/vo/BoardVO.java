package com.acorn.model.vo;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE TBL_BOARD(
	BNO NUMBER PRIMARY KEY,
	TITLE VARCHAR2(50),
	CONTENT VARCHAR2(2000),
	WRITER VARCHAR2(50),
	REGDATE DATE DEFAULT SYSDATE,
	VIEWCNT NUMBER DEFAULT 0
);

CREATE SEQUENCE DASHSEQ;
 */
public class BoardVO {
	private int bno;
	private String title,content,writer,regdate;
	private int viewcnt;
	///파일 업로드
	private MultipartFile file;
	private String img;
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVO(int bno, String title, String content, String writer, String regdate, int viewcnt) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + "]";
	}
	
	
}
