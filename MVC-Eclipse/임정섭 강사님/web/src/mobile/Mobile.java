package mobile;

abstract class Mobile {
	private String mobileName;
	protected int batterySize;
	private String osType;
	
	/**
	 * 
	 */
	public Mobile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param mobileName
	 * @param batterySize
	 * @param osType
	 */
	public Mobile(String mobileName, int batterySize, String osType) {
		super();
		this.mobileName = mobileName;
		this.batterySize = batterySize;
		this.osType = osType;
	}
	
	public abstract int operate(int time);
	
	
	public abstract int charge(int time);
	
	/**
	 * @return the mobileName
	 */
	public String getMobileName() {
		return mobileName;
	}

	/**
	 * @param mobileName the mobileName to set
	 */
	public void setMobileName(String mobileName) {
		this.mobileName = mobileName;
	}

	/**
	 * @return the batterySize
	 */
	public int getBatterySize() {
		return batterySize;
	}

	/**
	 * @param batterySize the batterySize to set
	 */
	public void setBatterySize(int batterySize) {
		this.batterySize = batterySize;
	}

	/**
	 * @return the osType
	 */
	public String getOsType() {
		return osType;
	}

	/**
	 * @param osType the osType to set
	 */
	public void setOsType(String osType) {
		this.osType = osType;
	}
	
}
