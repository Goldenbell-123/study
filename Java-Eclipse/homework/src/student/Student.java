package student;

public class Student extends Human{
	private String number;
	private String major;
	/**
	 * 
	 */
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * @param name
	 * @param age
	 * @param height
	 * @param weight
	 * @param number
	 * @param major
	 */
	public Student(String name, int age, int height, int weight, String number, String major) {
		super(name, age, height, weight);
		this.number = number;
		this.major = major;
	}


	/* (non-Javadoc)
	 * @see student.Human#printInformation()
	 */

	public String printInformation() {
		// TODO Auto-generated method stub
		return super.printInformation()+"\t"+this.number+"\t"+this.major;
	}
	
}
