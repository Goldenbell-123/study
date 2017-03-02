package flyer;

public class planeMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/**
		 * @param planewName
		 * @param fuelSize
		 * @param seat
		 * @param maxloadcg
		 * @param speed
		 */
		Airplane air = new Airplane("보잉-747",15000,150,5500,322);
		Cargoplane cargo = new Cargoplane("카고-542",20000,20,22000,220);
		
		System.out.println("Plane\tFuelSize");
		System.out.println("----------------");
		System.out.println(cargo.getplaneName()+"\t"+cargo.getFuelSize());
		System.out.println(air.getplaneName()+"\t"+air.getFuelSize());
		
		
		System.out.println("\n운항 100km");
		System.out.println("plane\tfuelSize");
		System.out.println("----------------");
		cargo.flight2(100);
		air.flight2(100);
		
		System.out.println("\n주유 200L");
		System.out.println("plane\tfuelSize");
		System.out.println("----------------");
		cargo.refuel(200);
		air.refuel(200);
		
	}

}
