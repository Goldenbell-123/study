package user.ctrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.vo.UserVo;
import user.service.UserServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.acorn")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 이걸 Service 메소드라고 함
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LoginSevlet doPost");
		
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
		UserServiceImpl service = new UserServiceImpl();
		UserVo result = service.login(user);
		
		
		//presentation view 응답해줌
		if(result != null){
			RequestDispatcher rd= request.getRequestDispatcher("ok.jsp");
			rd.forward(request,response);
		}else{
			RequestDispatcher rd= request.getRequestDispatcher("error.jsp");
			rd.forward(request,response);
		}
		
	}

}



