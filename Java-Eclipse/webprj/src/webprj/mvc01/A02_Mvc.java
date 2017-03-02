package webprj.mvc01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A02_Mvc
 */
@WebServlet(name = "mvc02", urlPatterns = { "/mvc02" })
public class A02_Mvc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_Mvc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//	1.요청
		
//	2.model 처리.
//	3.view단 호출..
//		jsp호출..
		String view = "mvc/a01_start.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);//요청데이터를 다시 jsp로 넘기 곘습니다.
/*
 A03_Mvc.java
 http://localhost:7080/webprj/mvc03s
 view단..
 mvc.a02_callView.jsp
 	MVC 호출 되었습니다!!
 */
		
	}

}
