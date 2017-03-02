package javastart.vo;

public class Emp {

	private int employeeId;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private String hireDate;
	private String jobId;
	private double salary;
	private double commissionPct;
	private int managerId;
	private int departmentId;
	private String chkdepartmentId;
	private String chksalary;
	private String name;
	
	public Emp() {
		super();
	}

	
	public Emp(int employeeId, String firstName, String lastName, String email, String phoneNumber, String hireDate,
			String jobId, double salary, double commissionPct, int managerId, int departmentId, String chkdepartmentId,
			String chksalary, String name) {
		super();
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.hireDate = hireDate;
		this.jobId = jobId;
		this.salary = salary;
		this.commissionPct = commissionPct;
		this.managerId = managerId;
		this.departmentId = departmentId;
		this.chkdepartmentId = chkdepartmentId;
		this.chksalary = chksalary;
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


	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public double getCommissionPct() {
		return commissionPct;
	}

	public void setCommissionPct(double commissionPct) {
		this.commissionPct = commissionPct;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getChkdepartmentId() {
		return chkdepartmentId;
	}

	public void setChkdepartmentId(String chkdepartmentId) {
		this.chkdepartmentId = chkdepartmentId;
		try{	
			setDepartmentId(Integer.parseInt(chkdepartmentId));
		}catch(Exception e){
		}
	}

	public String getChksalary() {
		return chksalary;
	}

	public void setChksalary(String chksalary) {
		this.chksalary = chksalary;
		try{	
			setSalary(Integer.parseInt(chksalary));
		}catch(Exception e){
		}
	}
}
