package mobile;

public class MobileMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ltab l1 = new Ltab();
		Otab O1 = new Otab();
		
		System.out.println(" Mobiel\tBattery\tOS");
		System.out.println("----------------------");
		System.out.println(l1.getMobileName()+"\t"+l1.getBatterySize()+"\t"+l1.getOsType());
		System.out.println(O1.getMobileName()+"\t"+O1.getBatterySize()+"\t"+O1.getOsType());
		System.out.println();
		System.out.println("10분 충전");
		System.out.println(" Mobiel\tBattery\tOS");
		System.out.println("----------------------");
		System.out.println(l1.getMobileName()+"\t"+l1.charge(10)+"\t"+l1.getOsType());
		System.out.println(O1.getMobileName()+"\t"+O1.charge(10)+"\t"+O1.getOsType());
		System.out.println();
		System.out.println("5분 통화");
		System.out.println(" Mobiel\tBattery\tOS");
		System.out.println("----------------------");
		System.out.println(l1.getMobileName()+"\t"+l1.operate(5)+"\t"+l1.getOsType());
		System.out.println(O1.getMobileName()+"\t"+O1.operate(5)+"\t"+O1.getOsType());

		
	}

}
