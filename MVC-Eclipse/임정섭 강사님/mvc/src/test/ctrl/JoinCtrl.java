package test.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.command.Command;
import test.view.View;

public class JoinCtrl implements Command{

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("조인 컨트롤 : JoinCtrl");
		View view = new View();
		view.setPath("joinForm.jsp");
		view.setSend(true);
		return view;
	}

	
}
