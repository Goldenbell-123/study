package main.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ctrl.util.Command;
import ctrl.view.ModelAndView;


public class MainCtrl implements Command{

	/* (non-Javadoc)
	 * @see ctrl.util.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("MainCtrl 접속");

		ModelAndView view = new ModelAndView();
		view.setPath("login.jsp");
		view.setSend(true);
		return view;
	}

	
}
