package model.vo;

public class TestVO {

	private String id, pwd, name;

	/**
	 * 
	 */
	public TestVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param id
	 * @param pwd
	 * @param name
	 */
	public TestVO(String id, String pwd, String name) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "TestVO [id=" + id + ", pwd=" + pwd + ", name=" + name + "]";
	}
	
	
	
}
