package webprj.y01_vo;
//webprj.y01_vo.Product
public class Product {
	private int pkno;
	private String name;
	private int cnt;
	
	public Product() {
		super();
	}
	
	public Product(String name) {
		super();
		this.name = name;
	}

	/**
	 * @return the pkno
	 */
	public int getPkno() {
		return pkno;
	}
	/**
	 * @param pkno the pkno to set
	 */
	public void setPkno(int pkno) {
		this.pkno = pkno;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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

	/**
	 * @param name
	 * @param cnt
	 */
	public Product(String name, int cnt) {
		super();
		this.name = name;
		this.cnt = cnt;
	}
	
	
}