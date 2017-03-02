package webprj.mvc01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A01_start
 * http://localhost:7080/webprj/mvc01?name=himan&age=25
 * 포스트 방식으로 받으면 어떻게 해야되는가?
 */
@WebServlet(name = "mvc01", urlPatterns = { "/mvc01" })
public class A01_Start extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_Start() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		1. 요청 내용 확인..
		String name= null;
		System.out.println("서블릿 호출!!");
		if(request.getParameter("name")!=null){
			System.out.println("요청값 name:"+request.getParameter("name"));	
			name=request.getParameter("name");
		}
		if(request.getParameter("age")!=null){
			System.out.println("요청값 age:"+request.getParameter("age"));	
			
		}
//		2. servlet에서 화면에 나타나는 내용..
//		1) 화면 처리 방식..
		response.setContentType("text/html;charset=utf-8");
//		2) 화면 출력 내용..request
//		Stream으로 html을 클라이언트에 전송..
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1 align='center'>화면출력</h1>");
		if(name!=null){
			out.println("<h1 align='center'>이름:"+name+"</h1>");
			
		}
		out.println("</body>");
		out.println("</html>");
		
	}
}
