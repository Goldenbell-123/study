package webprj.y01_vo;
//webprj.y01_vo.Person
public class Person {
	private int pkno;
	private String name;
	private int age;
	private String location;
	
	
	
	public Person() {
		super();
	}



	public Person(String name, int age, String location) {
		super();
		this.name = name;
		this.age = age;
		this.location = location;
	}



	/**
	 * @param pkno
	 * @param name
	 * @param age
	 * @param location
	 */
	public Person(int pkno, String name, int age, String location) {
		super();
		this.pkno = pkno;
		this.name = name;
		this.age = age;
		this.location = location;
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



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}
	
	
}