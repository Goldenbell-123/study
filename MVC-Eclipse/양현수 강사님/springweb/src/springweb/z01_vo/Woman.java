package springweb.z01_vo;
// springweb.z01_vo.Woman
public class Woman {
	private String name;
	private String location;
	/**
	 * 
	 */
	public Woman() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param name
	 * @param location
	 */
	public Woman(String name, String location) {
		super();
		this.name = name;
		this.location = location;
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
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}
	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}
	
}
