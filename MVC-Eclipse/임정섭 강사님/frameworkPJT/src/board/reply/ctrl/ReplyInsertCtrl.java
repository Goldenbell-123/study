package board.reply.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.ReplyVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class ReplyInsertCtrl implements Command{
	private BoardServiceImpl service;
	public ReplyInsertCtrl(){
		service = new BoardServiceImpl();
	}
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	System.out.println("댓글 작성 : ReplyInsertCtrl 접속..");
		

		request.setCharacterEncoding("UTF-8") ; 
		
		String rcontent = request.getParameter("rcontent");
		String rwriter = request.getParameter("rwriter"); 
		int seq = Integer.parseInt(request.getParameter("seq"));
		
	
		ReplyVO board = new ReplyVO();
		
		board.setSeq(seq);
		board.setRcontent(rcontent);
		board.setRwriter(rwriter);
		
		
		int result = service.replyInsert(board);
		
		ModelAndView view = new ModelAndView();
		if(result!=0){
			view.setPath("boardlist.do");
			view.setSend(false);
		}else{
			view.setPath("boardForm.jsp");
			view.setSend(false);
		}
		return view;
	}
}
