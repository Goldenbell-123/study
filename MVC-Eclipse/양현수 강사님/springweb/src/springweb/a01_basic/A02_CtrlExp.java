package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A02_CtrlExp {

	// http://localhost:7080/springweb/exp.do
	@RequestMapping("/exp.do")
	public String start(Model d){
		
		return "a01_basic/a02_exp.jsp";
	}

}
