package webprj.mvc01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A00_mvcPerson
 */
@WebServlet(name = "mvcPerson", urlPatterns = { "/mvcPerson" })
public class A00_mvcPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A00_mvcPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//			1. 요청
		String pknock="";
		int sum=0;
		if(request.getParameter("pkno")!=null){
			pknock=request.getParameter("pkno");
		}

//		2.모델
//		3.뷰
	}

}
