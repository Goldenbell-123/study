package board.vo;
/*
 CREATE TABLE REPLY(
 	RSEQ 		NUMBER PRIMARY KEY,
 	RCONTENT 	VARCHAR2(100),
 	RWRITER 	VARCHAR2(20),
 	SEQ 		NUMBER 	REFERENCES BOARD(SEQ)
 );
 
 CREATE SEQUENCE REPLYSEQ;
 */
public class ReplyVO {
	private int rseq;
	private String rcontent,rwriter;
	private int seq;
	/**
	 * 
	 */
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param rseq
	 * @param rcontent
	 * @param rwriter
	 * @param seq
	 */
	public ReplyVO(int rseq, String rcontent, String rwriter, int seq) {
		super();
		this.rseq = rseq;
		this.rcontent = rcontent;
		this.rwriter = rwriter;
		this.seq = seq;
	}
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
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
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
	

}
