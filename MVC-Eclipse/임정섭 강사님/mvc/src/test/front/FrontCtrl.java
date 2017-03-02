package test.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.command.Command;
import test.factory.CtrlFactory;
import test.view.View;



/**
 * Servlet implementation class FrontCtrl
 */
@WebServlet("*.do")
public class FrontCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	
	protected void process(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri 확인 : "+uri);
		
		//팩토리 호출
		CtrlFactory ctrl = CtrlFactory.getInstance();
		Command mainctrl = ctrl.getBean(uri);
		
		//mainctrl 처리 후 뷰로 다시 호출
		View view = mainctrl.execute(request,response);
		System.out.println("view 호출 :"+view);
		//jsp 분기
		if(view.isSend()){
			RequestDispatcher rd=request.getRequestDispatcher(view.getPath());
			rd.forward(request, response);
		}else{
			response.sendRedirect(view.getPath());
		}
		
	}
}
