package boardmodel.vo;

public class BoardVO {
	private int			seq;
	private String		writer, title, content, regDate;
	private int			cnt;
	
	/**
	 * 
	 */
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @param seq
	 * @param writer
	 * @param title
	 * @param content
	 * @param regDate
	 * @param cnt
	 */
	public BoardVO(int seq, String writer, String title, String content, String regDate, int cnt) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.cnt = cnt;
	}

	/**
	 * @return the seq
	 */
	public int getSeq() {
		return seq;
	}
	/**
	 * @param seq the seq to set
	 */
	public void setSeq(int seq) {
		this.seq = seq;
	}
	/**
	 * @return the writer
	 */
	public String getWriter() {
		return writer;
	}
	/**
	 * @param writer the writer to set
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
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
	 * @return the regDate
	 */
	public String getRegDate() {
		return regDate;
	}
	/**
	 * @param regDate the regDate to set
	 */
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	/**
	 * @return the cnt
	 */
	public int getCnt() {
		return cnt;
	}
	/**
	 * @param cnt the cnt to set
	 */
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
