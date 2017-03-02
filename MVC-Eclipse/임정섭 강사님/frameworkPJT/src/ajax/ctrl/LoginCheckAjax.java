package ajax.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import user.model.vo.UserVO;
import user.service.UserServiceImpl;

/**
 * Servlet implementation class LoginCheckAjax
 */
@WebServlet("/loginCheck.ajax")
public class LoginCheckAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserServiceImpl service;
	public LoginCheckAjax(){
		service = new UserServiceImpl();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
			System.out.println("LoginCheckAjax");
			String id = request.getParameter("id");
			System.out.println("param : "+id);
			
			
			UserVO result = service.logCheck(id);
			
		
			System.out.println("result : "+result.isFlag());
			JSONObject jObj = new JSONObject(result);
			PrintWriter out = response.getWriter();
			out.print(jObj);
			
	}

}
