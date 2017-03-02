package test.ctrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.command.Command;
import test.service.LoginServiceImpl;
import test.view.View;
import user.model.vo.UserVO;


public class JoinFormCtrl implements Command{

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원가입 폼 : JoinFormCtrl");
		
		/**
		 * @param id
		 * @param pwd
		 * @param name
		 * @param email
		 * @param gender
		 * @param phoneNumber
		 */
		request.setCharacterEncoding("UTF-8") ; 
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String phoneNumber = request.getParameter("phoneNumber");
		
		UserVO user = new UserVO();
		
		user.setId(id);
		user.setPwd(pwd);
		user.setName(name);
		user.setEmail(email);
		user.setGender(gender);
		user.setPhoneNumber(phoneNumber);
		
		LoginServiceImpl service = new LoginServiceImpl();
		int result = service.join(user);
		
		View view = new View();
		if(result!=0){
			view.setPath("main.do");
			view.setSend(true);
		}else{
			view.setPath("error.jsp");
			view.setSend(false);
		}
		return view;
	}
}
