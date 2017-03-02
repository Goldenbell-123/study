package employee;

public class Secretary extends Employee implements Bonus{

	/**
	 * 
	 */
	public Secretary() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param name
	 * @param number
	 * @param department
	 * @param salary
	 */
	public Secretary(String name, int number, String department, int salary) {
		super(name, number, department, salary);
		// TODO Auto-generated constructor stub
	}

	
	/* (non-Javadoc)
	 * @see employee.Employee#getName()
	 */
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return super.getName();
	}

	/* (non-Javadoc)
	 * @see employee.Employee#setName(java.lang.String)
	 */
	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		super.setName(name);
	}

	/* (non-Javadoc)
	 * @see employee.Employee#getNumber()
	 */
	@Override
	public int getNumber() {
		// TODO Auto-generated method stub
		return super.getNumber();
	}

	/* (non-Javadoc)
	 * @see employee.Employee#setNumber(int)
	 */
	@Override
	public void setNumber(int number) {
		// TODO Auto-generated method stub
		super.setNumber(number);
	}

	/* (non-Javadoc)
	 * @see employee.Employee#getDepartment()
	 */
	@Override
	public String getDepartment() {
		// TODO Auto-generated method stub
		return super.getDepartment();
	}

	/* (non-Javadoc)
	 * @see employee.Employee#setDepartment(java.lang.String)
	 */
	@Override
	public void setDepartment(String department) {
		// TODO Auto-generated method stub
		super.setDepartment(department);
	}

	/* (non-Javadoc)
	 * @see employee.Employee#getSalary()
	 */
	@Override
	public int getSalary() {
		// TODO Auto-generated method stub
		return super.getSalary();
	}

	/* (non-Javadoc)
	 * @see employee.Employee#setSalary(int)
	 */
	@Override
	public void setSalary(int salary) {
		// TODO Auto-generated method stub
		super.setSalary(salary);
	}

	/* (non-Javadoc)
	 * @see employee.Bonus#incentive(int)
	 */
	@Override
	public void incentive(int pay) {
		setSalary(getSalary()+(pay*80)/100);
	}

	/* (non-Javadoc)
	 * @see employee.Employee#tax()
	 */
	@Override
	double tax() {
		double tax = getSalary()*0.1;
		return tax;
	}

	
	
	
}
