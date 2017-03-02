package springweb.d01_db;

public class Emp {
	private int employeeId;      
	private String firstName;    
	private String lastName; 
	private String name;
	private String email;        
	private String phoneNumber;  
	private String hireDate;     
	private String jobId;        
	private double salary;
	private double minsalary;
	private double maxsalary;
	private double enhance;
	private double commissionPct;
	private int managerId;       
	private int departmentId;
	private String cksalary;
	private String ckdepartmentId;
	
	


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
	 * @return the minsalary
	 */
	public double getMinsalary() {
		return minsalary;
	}

	/**
	 * @param minsalary the minsalary to set
	 */
	public void setMinsalary(double minsalary) {
		this.minsalary = minsalary;
	}

	/**
	 * @return the maxsalary
	 */
	public double getMaxsalary() {
		return maxsalary;
	}

	/**
	 * @param maxsalary the maxsalary to set
	 */
	public void setMaxsalary(double maxsalary) {
		this.maxsalary = maxsalary;
	}

	/**
	 * @return the enhance
	 */
	public double getEnhance() {
		return enhance;
	}

	/**
	 * @param enhance the enhance to set
	 */
	public void setEnhance(double enhance) {
		this.enhance = enhance;
	}

	/**
	 * 
	 */
	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param employeeId
	 * @param firstName
	 * @param lastName
	 * @param email
	 * @param phoneNumber
	 * @param hireDate
	 * @param jobId
	 * @param salary
	 * @param commissionPct
	 * @param managerId
	 * @param departmentId
	 */
	public Emp(int employeeId, String firstName, String lastName, String email, String phoneNumber, String hireDate,
			String jobId, double salary, double commissionPct, int managerId, int departmentId) {
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
	}
	
	

	/**
	 * @return the employeeId
	 */
	public int getEmployeeId() {
		return employeeId;
	}

	/**
	 * @param employeeId the employeeId to set
	 */
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * @return the hireDate
	 */
	public String getHireDate() {
		return hireDate;
	}

	/**
	 * @param hireDate the hireDate to set
	 */
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	/**
	 * @return the jobId
	 */
	public String getJobId() {
		return jobId;
	}

	/**
	 * @param jobId the jobId to set
	 */
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	/**
	 * @return the salary
	 */
	public double getSalary() {
		return salary;
	}

	/**
	 * @param salary the salary to set
	 */
	public void setSalary(double salary) {
		this.salary = salary;
	}

	/**
	 * @return the commissionPct
	 */
	public double getCommissionPct() {
		return commissionPct;
	}

	/**
	 * @param commissionPct the commissionPct to set
	 */
	public void setCommissionPct(double commissionPct) {
		this.commissionPct = commissionPct;
	}

	/**
	 * @return the managerId
	 */
	public int getManagerId() {
		return managerId;
	}

	/**
	 * @param managerId the managerId to set
	 */
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	/**
	 * @return the departmentId
	 */
	public int getDepartmentId() {
		return departmentId;
	}

	/**
	 * @param departmentId the departmentId to set
	 */
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	/**
	 * @return the ckdepartmentId
	 */
	public String getCkdepartmentId() {
		return ckdepartmentId;
	}

	/**
	 * @param ckdepartmentId the ckdepartmentId to set
	 */
	public void setCkdepartmentId(String ckdepartmentId) {
		this.ckdepartmentId = ckdepartmentId;
		// 기타 문자열 Exception 처리.
		try{
			setDepartmentId(Integer.parseInt(ckdepartmentId));
		}catch(Exception e){
		}
	}

	/**
	 * @return the cksalary
	 */
	public String getCksalary() {
		return cksalary;
	}

	/**
	 * @param cksalary the cksalary to set
	 */
	public void setCksalary(String cksalary) {
		this.cksalary = cksalary;
		// 기타 문자열 Exception 처리.
		try{
			setSalary(Integer.parseInt(cksalary));
		}catch(Exception e){
		}		
	}  
	

}
