package mobile;

public class Ltab extends Mobile{
	/**
	 * 
	 */
	public Ltab() {
		super("Ltab",500,"AP-01");
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param mobileName
	 * @param batterySize
	 * @param osType
	 */
	public Ltab(String mobileName, int batterySize, String osType) {
		super(mobileName, batterySize, osType);
		// TODO Auto-generated constructor stub
	}
	/* (non-Javadoc)
	 * @see mobile.Mobile#operate(int)
	 */
	@Override
	public int operate(int time) {
		// TODO Auto-generated method stub
		
		batterySize-=10*time;
		
		return batterySize;
	}
	/* (non-Javadoc)
	 * @see mobile.Mobile#charge(int)
	 */
	@Override
	public int charge(int time) {
		// TODO Auto-generated method stub
		
		batterySize+=10*time;
		return batterySize;
	}

	
	
	
	
	
}
