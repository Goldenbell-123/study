package test.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import test.command.Command;
import test.view.View;

public class LogoutCtrl implements Command{

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그아웃 : LogoutCtrl");
		
		//getSession에 false를 해놓으면 기존에있던 데이터를 다시 불러들어옴
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		View view =new View();
		view.setPath("main.do");
		view.setSend(false);
		return view;
	}
	
	
}
