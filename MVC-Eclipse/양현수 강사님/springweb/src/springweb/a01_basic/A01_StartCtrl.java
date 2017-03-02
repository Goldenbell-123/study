package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.z01_vo.Member;
import springweb.z01_vo.Person;
// springweb.a01_basic.A01_StartCtrl
// controller 입니다. 선언해야지 인식..annotation선언..
@Controller
public class A01_StartCtrl {
//	메서드 마다 다른 url mapping형식으로 호출 가능..

	// http://localhost:7080/springweb/start.do
	@RequestMapping("/start.do")
	public String start(Model d){
		System.out.println("스프링 시작!!");
		// controler 요청
		// model처리.:view단에 넘겨줄 핵심 데이터..
		d.addAttribute("greet", "안녕하세요(Model)");
		// view단 호출..
		// Webcontent폴드를 기준으로. view단.jsp호출..
		return "a01_basic/a01_start.jsp";
	}
	@RequestMapping("/form02.do")
	public String form02(){
		return "a01_basic/a02_form01.jsp";
	}	
//	1. 단일요청값 처리. <input name="name01"
//				   <input name="age01"
	@RequestMapping("/form01.do")
	public String form01(
					@RequestParam("name01") String name,
					@RequestParam("age01") int age,
			            Model d){
		d.addAttribute("showName", name+"님 반가워요!!");
		d.addAttribute("age10", "10년후"+(age+10));
		return "a01_basic/a02_form01.jsp";
	}	
	
// http://localhost:7080/springweb/form03.do
//	매핑된 컨트롤러
	@RequestMapping("/form03.do")
	public String form03(Person p, Model d){
		
		if(p!=null&&p.getName()!=null){
			p.setName(p.getName()+"님~~");
			p.setAge(p.getAge()+10);
		}
		return "a01_basic/a03_form01.jsp";
	}
	

	// http://localhost:7080/springweb/form04.do
	@RequestMapping("/form04.do")
	public String form04(Member m, Model d){
		String msg="";
		if(m.getId()!=null&&m.getPass()!=null){
			msg=m.getId()+"님 다시 접속하세요";
			if(m.getId().equals("himan")&&
			   m.getPass().equals("7777")){
				msg=m.getId()+"님 인증 되었습니다!";
			}
		}
		
		d.addAttribute("msg", msg);		
		return "a01_basic/a04_exp.jsp";
	}	
}
