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
 * Servlet implementation class joinServlet
 */
@WebServlet("/join.acorn")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("joinServlet doPost");
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
		UserServiceImpl service = new UserServiceImpl();
		int result = service.join(user);
		
		//view로 응답하기
		if(result != 0){
			RequestDispatcher rd= request.getRequestDispatcher("ok.jsp");
			rd.forward(request,response);
		}else{
			RequestDispatcher rd= request.getRequestDispatcher("error.jsp");
			rd.forward(request,response);
		}
		
	}

}
