package webprj.mvc01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webprj.y01_vo.Calcu;

/**
 * Servlet implementation class A03_Mvc
 */
@WebServlet(name = "mvc03", urlPatterns = { "/mvc03" })
public class A03_Mvc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_Mvc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		1. 요청
		String num01Str="";
		String num02Str="";
		int sum=0;
		if(request.getParameter("num01")!=null){
			num01Str=request.getParameter("num01");
		}
		if(request.getParameter("num02")!=null){
			num02Str=request.getParameter("num02");
		}		
//		2. model처리 : view단에 넘겨줄 핵심 데이터 처리..
//		   일반적으로service클래스 호출 처리..
		Calcu c = new Calcu();
		if(!num01Str.equals("")){
			c.setNum01(Integer.parseInt(num01Str));
		}
		if(!num02Str.equals("")){
			c.setNum02(Integer.parseInt(num02Str));
			c.setSum(c.getNum01()+c.getNum02());
		}		
//		view단 넘김 처리.
		if( c.getSum()!=0 ){
			//webprj.y01_vo.Calcu
			request.setAttribute("calcu", c);
			// request의 범위는 호출하는 page까지..
			// page ==> request ==> session ==> application
			// 한페이지 다음페이지 부터 저 닫힘 서버가 가동
		}
//		3. view단 호출
		String view = "/mvc/a02_callView.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

}
