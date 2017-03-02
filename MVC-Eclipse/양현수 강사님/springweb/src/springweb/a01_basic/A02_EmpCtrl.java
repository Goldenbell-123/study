package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.d01_db.A01_Database;
// springweb.a01_basic.A02_EmpCtrl
@Controller
public class A02_EmpCtrl {

	@RequestMapping("/emplist.do")
	public String emplist(Model d){
		
		//
		A01_Database db = new A01_Database();
		d.addAttribute("emplist", db.getEmpList());
		
		return "/a01_basic/a05_emplist.jsp";
	}
}
