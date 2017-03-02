package flyer;

public class Cargoplane extends Plane{
	private int seat;// 좌석수
	private int maxloadcg;// 최대 적재 용량
	private int speed;// 최대 속도
	
	
	/* (non-Javadoc)
	 * @see flyer.Plane#getplaneName()
	 */
	@Override
	public String getplaneName() {
		// TODO Auto-generated method stub
		return super.getplaneName();
	}




	/* (non-Javadoc)
	 * @see flyer.Plane#setplaneName(java.lang.String)
	 */
	@Override
	public void setplaneName(String planeName) {
		// TODO Auto-generated method stub
		super.setplaneName(planeName);
	}




	/* (non-Javadoc)
	 * @see flyer.Plane#getFuelSize()
	 */
	@Override
	public int getFuelSize() {
		// TODO Auto-generated method stub
		return super.getFuelSize();
	}




	/* (non-Javadoc)
	 * @see flyer.Plane#setFuelSize(int)
	 */
	@Override
	public void setFuelSize(int fuelSize) {
		// TODO Auto-generated method stub
		super.setFuelSize(fuelSize);
	}




	/**
	 * @return the seat
	 */
	public int getSeat() {
		return seat;
	}




	/**
	 * @param seat the seat to set
	 */
	public void setSeat(int seat) {
		this.seat = seat;
	}

	


	/**
	 * @return the maxloadcg
	 */
	public int getMaxloadcg() {
		return maxloadcg;
	}




	/**
	 * @param maxloadcg the maxloadcg to set
	 */
	public void setMaxloadcg(int maxloadcg) {
		this.maxloadcg = maxloadcg;
	}




	/**
	 * @return the speed
	 */
	public int getSpeed() {
		return speed;
	}




	/**
	 * @param speed the speed to set
	 */
	public void setSpeed(int speed) {
		this.speed = speed;
	}




	/**
	 * 
	 */
	public Cargoplane() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

	/**
	 * @param planeName
	 * @param fuelSize
	 * @param seat
	 * @param maxloadcg
	 * @param speed
	 */
	public Cargoplane(String planeName, int fuelSize, int seat, int maxloadcg, int speed) {
		super(planeName, fuelSize);
		this.seat = seat;
		this.maxloadcg = maxloadcg;
		this.speed = speed;
	}



	/* (non-Javadoc)
	 * @see flyer.Plane#flight2(int)
	 */
	@Override
	public void flight2(int distance) {
		// TODO Auto-generated method stub
		setFuelSize(getFuelSize()-distance*5);
		System.out.println(getplaneName()+"\t"+getFuelSize());
	}
	
	
	
}
