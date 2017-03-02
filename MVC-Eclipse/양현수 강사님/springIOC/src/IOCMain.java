import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import ctrl.AcornController;
import model.vo.TestVO;

public class IOCMain {

	public static void main(String[] args) {
		
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("root-context.xml","sevlet-context.xml");
		AcornController ctrl = 
				(AcornController)factory.getBean("ctrl");
		
	
		
	/*	//1. login
		TestVO result = ctrl.login("이건","되나");
		System.out.println(result);*/
		//2. insert
//		int flag =ctrl.insert("admin","jslim","관리자");
//		System.out.println(flag);
		//3. update
//		int flag = ctrl.update("admin","admin");
//		System.out.println(flag);
		//4. delete
//		int flag= ctrl.delete("이건");
//		System.out.println(flag);
		//5. select list
		List<TestVO> list= ctrl.selectAll();
		for(TestVO a:list){
			System.out.println(a);
		}
		
		
	}

}
