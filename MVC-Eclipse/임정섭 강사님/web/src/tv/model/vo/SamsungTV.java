package tv.model.vo;

import tv.util.TV;

public class SamsungTV  implements TV{

	private String[] channels = {"jtbc","chanelA","tvn"};
	
	/* (non-Javadoc)
	 * @see tv.util.TV#turnOn()
	 */
	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		System.out.println("samsung turnOn");
		
	}

	/* (non-Javadoc)
	 * @see tv.util.TV#turnOff()
	 */
	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		System.out.println("samsung turnOff");
	}

	/* (non-Javadoc)
	 * @see tv.util.TV#soundUp()
	 */
	@Override
	public void soundUp() {
		// TODO Auto-generated method stub
		System.out.println("samsung soundUp");
	}

	/* (non-Javadoc)
	 * @see tv.util.TV#soundDown()
	 */
	@Override
	public void soundDown() {
		// TODO Auto-generated method stub
		System.out.println("samsung soundDown");
	}

	/* (non-Javadoc)
	 * @see tv.util.TV#changeChannel()
	 */
	@Override
	public void changeChannel() {
		// TODO Auto-generated method stub
		for(String channel : channels){
			System.out.println("samsung channel : "+channel);
		}
	}
	
}
