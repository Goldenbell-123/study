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


public class LoginCtrl implements Command{
	//객체를 매번 생성하지 않기 위해서 변수 선언한다.
	private UserServiceImpl service ;		//서비스 연결 객체
	
	public LoginCtrl(){
		service= new UserServiceImpl();
	}
	/* (non-Javadoc)
	 * @see ctrl.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LoginCtrl execute");
		
		//요청 받음
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.println("아이디 : "+id);
		System.out.println("패스워드 : "+pwd);
		
		//Persistence service로 입력 정보 넘김
		UserVo user= new UserVo();
		user.setId(id);
		user.setPwd(pwd);
		
		//Business service로 그릇에 담긴 정보를 인스턴스로 넘김
		UserVo result = service.login(user);
		
		View view = new View();
		if(result !=null ){
			view.setPath("ok.jsp");
			view.setSend(true);
		}else{
			view.setPath("error.jsp");
			view.setSend(false);
		}
		
		return view;
	}

	
}
