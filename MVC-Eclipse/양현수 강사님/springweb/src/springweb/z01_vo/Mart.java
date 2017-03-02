package springweb.z01_vo;
// springweb.z01_vo.Mart
public class Mart {
	private String name;
	private Product product;
	/**
	 * 
	 */
	public Mart() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param name
	 */
	public Mart(String name) {
		super();
		this.name = name;
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
	 * @return the product
	 */
	public Product getProduct() {
		return product;
	}
	/**
	 * @param product the product to set
	 */
	public void setProduct(Product product) {
		this.product = product;
		System.out.println("type이면");
	}
	public void setProd(Product product) {
		this.product = product;
		System.out.println("둘다 뜸");
	}	
	
	public void show(){
		System.out.println(name+"마트에 가서 ");
		if(product!=null){
		System.out.println("물건 "+product.getName()+"를  "
								+product.getCnt()+"개를  "
					+product.getPrice()+"원에 구매하였다. ");
		}
	}
	
}
