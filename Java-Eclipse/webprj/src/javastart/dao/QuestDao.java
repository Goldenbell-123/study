package javastart.dao;

import java.io.Serializable;

/*
객체 직렬화란?
일반적으로 객체는 메모리에 저장되는데..
이 내용을 담은 객체는 네트워크나 통신을 통하여 전송할 때는
직렬화가 필요로 한다..
DAO, DTO, VO 객체를 직렬화를 통해서 데이터를 전송할 때,
Serializable 인터페이스를 implements해준다고 선언만 하면된다.
 * */
public class QuestDao implements Serializable{
/*
	no number primary key,
	content varchar2(200),
	answer varchar2(50)
 * */
	private int no;
	private String content;
	private String answer;
	/**
	 * 
	 */
	public QuestDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param no
	 * @param content
	 * @param answer
	 */
	public QuestDao(int no, String content, String answer) {
		super();
		this.no = no;
		this.content = content;
		this.answer = answer;
	}
	/**
	 * @return the no
	 */
	public int getNo() {
		return no;
	}
	/**
	 * @param no the no to set
	 */
	public void setNo(int no) {
		this.no = no;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the answer
	 */
	public String getAnswer() {
		return answer;
	}
	/**
	 * @param answer the answer to set
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
