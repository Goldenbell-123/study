package test.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.command.Command;
import test.service.LoginServiceImpl;
import test.view.View;
import user.model.vo.UserVO;

public class LoginCtrl implements Command{
	private LoginServiceImpl service;
	public LoginCtrl(){
		service = new LoginServiceImpl();
	}

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LoginCtrl");
		String id= request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UserVO user = new UserVO();
		user.setId(id); 	user.setPwd(pwd);
		
		 
		UserVO result=service.login(user); 
				
		View view = new View();
		if(id.equals("jslim") && pwd.equals("jslim")){
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", result);
			view.setPath("main.jsp");
			view.setSend(true);
		}else{
			view.setPath("error.jsp");
			view.setSend(true);
		}
			
		
		return view;
	}

	
}
