package user.factory.ctrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ctrl.command.Command;
import ctrl.view.View;
import user.model.vo.UserVo;
import user.service.UserServiceImpl;

public class JoinFormCtrl implements Command{
	/* (non-Javadoc)
	 * @see ctrl.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("JoinFormCtrl execute 완료");	
		View view = new View();
		
				view.setPath("joinForm.jsp");
				view.setSend(true);
		
		return view;
	}
	

	
}
