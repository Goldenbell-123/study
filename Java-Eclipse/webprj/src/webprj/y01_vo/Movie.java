package webprj.y01_vo;
//webprj.y01_vo.Movie
public class Movie {
//	영화명, 가격, 매표수,
	private String name;
	private int price;
	private int cnt;
	private int tot;
	
	/**
	 * @param name
	 * @param price
	 * @param cnt
	 */
	public Movie(String name, int price, int cnt) {
		super();
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
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
	/**
	 * @return the tot
	 */
	public int getTot() {
		return tot;
	}
	/**
	 * @param tot the tot to set
	 */
	public void setTot(int tot) {
		this.tot = tot;
	}
	
}
