package springweb.b01_di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import springweb.z01_vo.Mart;
import springweb.z01_vo.Woman;
public class A03_DI_Exp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Resource rsc = new ClassPathResource("springweb/b01_di/diexp03.xml");
		BeanFactory bean = new XmlBeanFactory(rsc);
		System.out.println("name==========");
		Mart m =(Mart)bean.getBean("mart");
		m.show();
		System.out.println("type===============");
		Mart m2 =(Mart)bean.getBean("mart2");
		m2.show();		
/*확인예제..
 Mart
   name:마트이름 :생성자로setting
   Product : setProduct로 가져옮
   show() 출력 메서드  @@@마트에 가서 
              물건 @@@를 @@개를 @@원에 구매하였다.
 Product
   name  
   cnt
   price

 A03_DI_Exp.java
 
 * */		
		
		
	}

}
