package springweb.z01_vo;
// springweb.z01_vo.Product
public class Product {
	private String name;
	private int price;
	private int cnt;
	/**
	 * 
	 */
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param name
	 * @param price
	 * @param cnt
	 */
	public Product(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
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
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
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
