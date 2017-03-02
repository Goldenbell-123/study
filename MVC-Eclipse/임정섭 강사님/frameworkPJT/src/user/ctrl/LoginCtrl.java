package user.ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;
import user.model.vo.UserVO;
import user.service.UserServiceImpl;

public class LoginCtrl implements Command{
	private UserServiceImpl service;
	private BoardServiceImpl boardservice;
	public LoginCtrl(){
		service = new UserServiceImpl();
		boardservice = new BoardServiceImpl();
	}
	/* (non-Javadoc)
	 * @see ctrl.util.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LoginCtrl 접속");
		
		//로그인 정보가져오기
		String email= request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		UserVO user = new UserVO();
		user.setEmail(email); user.setPwd(pwd);
		
		UserVO result=service.login(user); 
		
		//board 가져오기
		ArrayList<BoardVO> board= boardservice.list();
		
				
		ModelAndView view = new ModelAndView();
		if(result!=null){
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", result);
			request.setAttribute("boards", board);
			view.setPath("main.jsp");
			view.setSend(true);
		}else{
			view.setPath("index.jsp");
			view.setSend(false);
		}
			
		
		return view;
	}

	
}
