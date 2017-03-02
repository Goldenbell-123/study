package ajax.board.modal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;

/**
 * Servlet implementation class BoardReadAjax
 */
@WebServlet("/boardread.ajax")
public class BoardReadAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardServiceImpl service;
	
	public BoardReadAjax(){
		service  = new BoardServiceImpl();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginCheckAjax");
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("게시판 번호 : " +seq);
		
		BoardVO result = service.read(seq);
		JSONObject jObj = new JSONObject(result);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jObj);
	}

}
