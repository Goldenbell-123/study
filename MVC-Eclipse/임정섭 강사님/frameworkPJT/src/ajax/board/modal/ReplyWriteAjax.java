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
import org.json.JSONObject;

import board.service.BoardServiceImpl;
import board.vo.ReplyVO;
import ctrl.view.ModelAndView;

/**
 * Servlet implementation class ReplyWriteAjax
 */
@WebServlet("/reqlywrite.ajax")
public class ReplyWriteAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardServiceImpl service;
	public ReplyWriteAjax(){
		service = new BoardServiceImpl();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("댓글 작성 : ReplyInsertCtrl 접속..");
		

		request.setCharacterEncoding("UTF-8") ; 
		
		String rcontent = request.getParameter("rcontent");
		String rwriter = request.getParameter("rwriter"); 
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("rcontent : "+rcontent);
		System.out.println("rwriter : "+rwriter);
		System.out.println("seq : "+seq);
	
		ReplyVO board = new ReplyVO();
		
		board.setSeq(seq);
		board.setRcontent(rcontent);
		board.setRwriter(rwriter);
		
		int result = service.replyInsert(board);
		System.out.println(result);
		
		ArrayList<ReplyVO> list = service.searchReply(seq);
		
		JSONArray jAry = new JSONArray(list);
		PrintWriter out = response.getWriter();
		out.print(jAry);
	}
	

}
