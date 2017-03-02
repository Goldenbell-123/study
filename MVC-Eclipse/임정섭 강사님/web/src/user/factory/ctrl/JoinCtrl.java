package user.factory.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ctrl.command.Command;
import ctrl.view.View;
import user.model.vo.UserVo;
import user.service.UserServiceImpl;

public class JoinCtrl implements Command{
	private UserServiceImpl service;
	
	public JoinCtrl(){
		service= new UserServiceImpl();
	}
	/* (non-Javadoc)
	 * @see ctrl.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("JoinCtrl execute 완료");
		request.setCharacterEncoding("UTF-8");
		/* joinForm.jsp에서
		 * 1. getParameter();
		 * 2. UserVo
		 * 3. UserServiceImpl -> join() call
		 * 4. 리턴 값이 0이면 error.jsp, 1이면 ok.jsp 이동
		 * 5. 디비에서 입력된 결과를 확인하세요.
		 * 
		 */
		//요청받음
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name= request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String phoneNumber = request.getParameter("phoneNumber");
		
		System.out.println("아이디 :"+id);
		System.out.println("패스워드 :"+pwd);
		System.out.println("이름 :"+name);
		System.out.println("이메일 :"+email);
		System.out.println("성별 :"+gender);
		System.out.println("폰넘버 :"+phoneNumber);
		
		//Persistence service로 입력정보 넘김
		UserVo user = new UserVo();
		user.setId(id);
		user.setPwd(pwd);
		user.setName(name);
		user.setEmail(email);
		user.setGender(gender);
		user.setphoneNumber(phoneNumber);
		
		//Business model에 다시 거쳐서 결과를 담음
		
		int result = service.join(user);
		
		View view = new View();
			if(result!=0){
				view.setPath("ok.jsp");
				view.setSend(true);
			}else{
				view.setPath("error.jsp");
				view.setSend(false);
			}
		return view;
	}
	

}
