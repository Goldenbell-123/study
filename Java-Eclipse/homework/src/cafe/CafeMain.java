package cafe;

import java.util.ArrayList;

public class CafeMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Cafe cafe = new Cafe();
		cafe.setCoffee(new Coffee("아메리카노", 4000));
		cafe.setCoffee(new Coffee("카페라떼", 5000));
		cafe.setCoffee(new Coffee("마끼아또", 6000));
		
		ArrayList<Coffee> list=cafe.getCoffeeList();
		for(Coffee coffee: list){
			System.out.println(coffee.info());
		}
		System.out.println("\nCoffee 가격의 합 : "+cafe.totalPrice()+"원");
	}

}
