package mobile;

public class Otab extends Mobile{

	/**
	 * 
	 */
	public Otab() {
		super("Otab",1000,"AND-20");
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param mobileName
	 * @param batterySize
	 * @param osType
	 */
	public Otab(String mobileName, int batterySize, String osType) {
		super(mobileName, batterySize, osType);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see mobile.Mobile#operate(int)
	 */
	@Override
	public int operate(int time) {
		// TODO Auto-generated method stub

		batterySize-=8*time;
		return batterySize;
	}

	/* (non-Javadoc)
	 * @see mobile.Mobile#charge(int)
	 */
	@Override
	public int charge(int time) {
		// TODO Auto-generated method stub

		batterySize+=8*time;
		return batterySize;
	}

	
	
}
