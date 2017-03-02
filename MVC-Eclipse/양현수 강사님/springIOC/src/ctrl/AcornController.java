package ctrl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import model.vo.TestVO;
import service.TestService;

@Controller("ctrl")
public class AcornController {
	
	@Resource(name="service")
	private TestService service;
	
	public AcornController(){
		
	}
	
	public String sayEcho(String name){
		return "Hi, "+name;
	}
	
	public TestVO login(String id, String pwd){
		System.out.println("login Ctrl");
		System.out.println("id : "+id);
		System.out.println("pwd : "+pwd);
		
		TestVO obj =new TestVO();
		obj.setId(id);
		obj.setPwd(pwd);
		
		TestVO result = service.login(obj);
		return result;
	}
	
	public int insert(String id,String pwd,String name){
		System.out.println("insert Ctrl");
		System.out.println("id : "+id);
		System.out.println("pwd : "+pwd);
		System.out.println("name : "+name);
		
		TestVO obj = new TestVO();
		obj.setId(id); obj.setPwd(pwd); obj.setName(name);
		
		return service.insert(obj);
		
	}
	public int update(String id,String pwd){
		System.out.println("update Ctrl");
		
		TestVO obj = new TestVO();
		obj.setId(id); obj.setPwd(pwd);
		
		return service.update(obj);
	}
	public int delete(String id){
		System.out.println("delete Ctrl");
		
		return service.delete(id);
	}
	public List<TestVO> selectAll(){
		System.out.println("selectAll Ctrl");
		
		return service.selectAll();
	}
}
