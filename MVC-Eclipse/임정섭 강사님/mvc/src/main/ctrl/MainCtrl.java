package main.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.command.Command;
import test.view.View;

public class MainCtrl implements Command{

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("MainCtrl 접속");
		View view = new View();
		view.setPath("main.jsp");
		view.setSend(true);
		return view;
	}

	
}
