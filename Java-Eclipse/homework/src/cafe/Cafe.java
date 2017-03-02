package cafe;

import java.util.ArrayList;

public class Cafe {
	private ArrayList<Coffee> list ;
	
	/**
	 * 
	 */
	public Cafe() {
		super();
		//멤버 변수의 초기화는 생성자 안에서 하라. *****
		//생성자를 생성할 적에 멤버변수의 값이 초기화됨
		list = new ArrayList<Coffee>();
		// TODO Auto-generated constructor stub
	}

	public void setCoffee(Coffee coffee){
		
		if(list.size()<=3){
			list.add(coffee);
		}else{
			System.out.println("더 이상 저장할 수 없습니다.");
		}
	}
	
	public int totalPrice(){
		int tot=0;
		
		//foreach,inlist루프
		for(Coffee coffee : list){
			tot+=coffee.getPrice();
		}
		return tot;
	}
	
	public ArrayList<Coffee> getCoffeeList(){
		return list;
	}
	
}
