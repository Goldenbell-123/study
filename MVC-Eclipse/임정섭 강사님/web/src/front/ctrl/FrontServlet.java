package front.ctrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ctrl.command.Command;
import ctrl.mapping.CtrlFactory;
import ctrl.view.View;

/**
 * Servlet implementation class FrontServlet
 */
@WebServlet("*.do")
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// doGet 방식  process(request,response); 받을수잇음
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	// doPost 방식  process(request,response); 받을수잇음
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}
	//위에서 받은 정보를 넘김
	protected void process(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		// TODO Auto-generated method stub
		//uri 정보를 먼저 넘김
		String uri = request.getRequestURI();
		System.out.println("client uri : "+uri);
		
		//factory에 먼저 보내서 검사
		CtrlFactory factory = CtrlFactory.getInstance();
		
		//받은 정보를 다시 커맨드 자식 컨트롤러에 execute 넘김
		Command ctrl = factory.getBean(uri);

		System.out.println("Command 정보 확인: "+ctrl);
		//뷰에서 넘어온 정보와 경로를 뿌려줌
		View view = ctrl.execute(request, response);
		if(view.isSend()){
			RequestDispatcher rd= request.getRequestDispatcher(view.getPath());
			rd.forward(request, response);
		}else{
			response.sendRedirect(view.getPath());
		}
	}
}
