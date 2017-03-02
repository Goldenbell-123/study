package ajax.board.modal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import board.service.BoardServiceImpl;
import board.vo.ReplyVO;

/**
 * Servlet implementation class BoardReplyListAjax
 */
@WebServlet("/boardreplylist.ajax")
public class BoardReplyListAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardServiceImpl service;
	public BoardReplyListAjax(){
		service = new BoardServiceImpl();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("boardreplylist 댓글 리스트 접속");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		System.out.println("ModalAjax SEQ : "+seq);
		ArrayList<ReplyVO> board = service.searchReply(seq);
		
		
		JSONArray jAry = new JSONArray(board);
		PrintWriter out = response.getWriter();
		out.print(jAry);
		
	}
}
