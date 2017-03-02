package factory;

import java.util.HashMap;

import tv.model.vo.LgTV;
import tv.model.vo.SamsungTV;
import tv.util.TV;

public class BeanFactory {
	//static 스태틱끼리만 노니까 변수선언시 달아줘야됨
	private static BeanFactory instance;
	//HashMap으로 map경로를 지정해둠
	private HashMap<String, TV> map= new HashMap<String, TV>();
	
	//BeanFactory에 제품을 생성한다.
	private BeanFactory(){
		map.put("samsung", new SamsungTV());
		map.put("lg", new LgTV());
	}
	
	//Bean Factory에 제품을 꺼낼 메소드를 만듬
	public TV getBean(String brand){
		return map.get(brand);
	}
	
	
	public static BeanFactory getInstance(){
		//인스턴스 객체를 생성하지 않았다면 새로운 인스턴스 생성하게 만듬
		if(instance==null){
			instance=new BeanFactory();
		}
		//인스턴스가 있다면 getInstance()기능때문에 이미 생성된 인스턴스가 다시 반환됨
		return instance;
	}
}
