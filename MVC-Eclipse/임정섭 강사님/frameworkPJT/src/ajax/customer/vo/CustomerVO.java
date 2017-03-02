package ajax.customer.vo;

public class CustomerVO {
	private int seq;
	private String title;
	/**
	 * 
	 */
	public CustomerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param seq
	 * @param title
	 */
	public CustomerVO(int seq, String title) {
		super();
		this.seq = seq;
		this.title = title;
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
	
	
}
