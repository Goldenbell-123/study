package user.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class LogoutCtrl implements Command{

	/* (non-Javadoc)
	 * @see ctrl.util.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("로그아웃 처리");
		
		HttpSession session = request.getSession(false);
		session.invalidate();

		ModelAndView view = new ModelAndView();
		view.setPath("index.jsp");
		view.setSend(false);
		return view;
	}

	
}
