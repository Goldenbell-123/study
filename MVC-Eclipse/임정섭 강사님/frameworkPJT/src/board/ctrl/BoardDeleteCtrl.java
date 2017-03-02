package board.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class BoardDeleteCtrl implements Command {
	
	private BoardServiceImpl service;
	public BoardDeleteCtrl(){
		service = new BoardServiceImpl();
	}

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("BoardDeleteCtrl");
		request.setCharacterEncoding("UTF-8");
		
		
		int seq = Integer.parseInt(request.getParameter("Checkseq"));
		System.out.println("Delete SEQ : "+seq);
		
		int result = service.delete(seq);
		

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
