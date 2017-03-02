package springweb.b01_di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import springweb.z01_vo.Person;

public class A01_DI_Exp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/* xml 로딩 */
		Resource rs = new ClassPathResource("springweb/b01_di/diexp01.xml");
// xml에 있는 bean를 호출해서 객체로 사용..
//		BeanFactory : bean객체 호출.
//		XmlBeanFactory : xml에 있는 bean호출.
		BeanFactory bean = new XmlBeanFactory(rs);
//		해당 bean에 id값으로 로딩. : xml에서 <bean id="man" 으로 설정한 부분 로딩.
		Person p =(Person)bean.getBean("man");
		System.out.println("이름:"+p.getName());
		System.out.println("나이:"+p.getAge());
/* 확인예제..
pringweb/b01_di/diexp02.xml
springweb.z01_vo.Woman 생성..
	name과 location 속성 설정..
A02_DI_Exp.java
	에서 호출  
	그녀의 이름은 @@@, 사는 곳은 @@@입니다.
 * */		
	}

}
