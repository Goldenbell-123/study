package springweb.z01_vo;
// springweb.z01_vo.Person
public class Person {
	private String name;
	private int age;
	private Woman woman;
	/**
	 * 
	 */
	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param name
	 * @param age
	 */
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
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
	 * @return the age
	 */
	public int getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}
	/**
	 * @return the woman
	 */
	public Woman getWoman() {
		return woman;
	}
	/**
	 * @param woman the woman to set
	 */
	public void setWoman(Woman woman) {
		this.woman = woman;
	}
	
}
