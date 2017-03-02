import factory.BeanFactory;
import tv.util.TV;

public class TvMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		beanFactory 타입의 생성자를 가져오는데 getInstance로 거쳐서 가져옴
		BeanFactory factory = BeanFactory.getInstance();
/////////////////////////////////////////////////싱글톤 확인
//		TV 타입의 Tv1을 생성하고 tv2를 생성해서 주소값이 같은지 확인해보자.
		TV tv1= factory.getBean("samsung");
		TV tv2= factory.getBean("samsung");
		System.out.println(tv1);
		System.out.println(tv2);
		System.out.println("=====singletom 확인====");
//////////////////////////////////////////////////////Brand name으로 검색
//		TV 기능을 가진 제품 생성
		tv1.turnOn();
		tv1.turnOff();
		tv1.soundUp();
		tv1.soundDown();
		tv1.changeChannel();
		
		
	}

}
