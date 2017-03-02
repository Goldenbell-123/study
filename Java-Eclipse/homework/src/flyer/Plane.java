package flyer;

abstract class Plane {
	private String planeName;
	private int fuelSize;
	
	/**
	 * 
	 */
	public Plane() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param planeName
	 * @param fuelSize
	 */
	public Plane(String planeName, int fuelSize) {
		super();
		this.planeName = planeName;
		this.fuelSize = fuelSize;
	}
	
	/**
	 * @return the planeName
	 */
	public String getplaneName() {
		return planeName;
	}
	/**
	 * @param planeName the planeName to set
	 */
	public void setplaneName(String planeName) {
		this.planeName = planeName;
	}
	/**
	 * @return the fuelSize
	 */
	public int getFuelSize() {
		return fuelSize;
	}
	/**
	 * @param fuelSize the fuelSize to set
	 */
	public void setFuelSize(int fuelSize) {
		this.fuelSize = fuelSize;
	}
	//주유
	public void refuel(int fuel){
		setFuelSize(getFuelSize()+fuel);
		System.out.println(getplaneName()+"\t"+getFuelSize());
	}
	
	//운항

	public abstract void flight2(int distance);
}
