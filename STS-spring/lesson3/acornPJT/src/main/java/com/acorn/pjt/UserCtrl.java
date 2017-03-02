package com.acorn.pjt;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.acorn.model.vo.LoginDTO;
import com.acorn.model.vo.UserVO;
import com.acorn.user.service.UserService;

@Controller
@RequestMapping("/user")
//@SessionAttributes("userLogin")
public class UserCtrl {

	
	@Resource(name="userService")
	private UserService service;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String loginForm(){
		System.out.println("loginForm");
		return "user/login";
	}
	
	@RequestMapping(value="/loginPost.do",method=RequestMethod.POST)
	public String login(LoginDTO dto,ModelMap model){
		System.out.println("login");
		UserVO vo = service.login(dto);
		String path = "user/login";
		if(vo != null){
			model.addAttribute("userLogin", vo);
		}
		return path;
	}
	
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		System.out.println("logout");
		HttpSession session= request.getSession();
		session.invalidate();
		return "user/login";
	}
	
}
