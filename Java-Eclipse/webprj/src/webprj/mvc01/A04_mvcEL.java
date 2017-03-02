package webprj.mvc01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webprj.y01_vo.Movie;

/**
 * Servlet implementation class A04_mvcEL
 */
@WebServlet(name = "elexp", urlPatterns = { "/elexp" })
public class A04_mvcEL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_mvcEL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		1. 요청
//		2. model
		request.setAttribute("movie", new Movie("더킹",10000,2));
//			jsp ${movie.title} ${movie.price} ${movie.cnt}
//				$movie.price*movie.cnt}
//		3. view단 호출
		String view ="/mvc/a03_elExp.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

}
