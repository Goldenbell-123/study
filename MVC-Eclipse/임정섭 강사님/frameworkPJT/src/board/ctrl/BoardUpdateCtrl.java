package board.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class BoardUpdateCtrl implements Command {

	
	private BoardServiceImpl service;
	public BoardUpdateCtrl(){
		service = new BoardServiceImpl();
	}
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("BoardUpdateCtrl");
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("updateTitle");
		String content = request.getParameter("updateContent");
		int seq = Integer.parseInt(request.getParameter("Checkseq"));
		System.out.println("update title : "+title);
		System.out.println("update content : "+content);
		System.out.println("update seq : "+seq);
		
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setContent(content);
		board.setSeq(seq);

		int result = service.update(board);
		
		ModelAndView view = new ModelAndView();
		if(result != 0 ){
			view.setPath("boardlist.do");
			view.setSend(false);
		}else{
			view.setPath("error.jsp");
			view.setSend(false);
		}
		return view;
	}
	
	
	
	
}
