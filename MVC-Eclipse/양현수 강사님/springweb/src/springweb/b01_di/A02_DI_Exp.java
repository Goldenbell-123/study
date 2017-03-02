package springweb.b01_di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import springweb.z01_vo.Woman;
public class A02_DI_Exp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Resource rsc = new ClassPathResource("springweb/b01_di/diexp02.xml");
		BeanFactory bean = new XmlBeanFactory(rsc);
		Woman woman = (Woman)bean.getBean("woman");
		System.out.println("그녀의 이름은 "+woman.getName()
		                 +", 사는 곳은 "+woman.getLocation()+"입니다.");
	}

}
