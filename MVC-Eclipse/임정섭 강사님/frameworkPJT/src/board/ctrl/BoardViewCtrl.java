package board.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class BoardViewCtrl implements Command {

	private BoardServiceImpl service;
	public BoardViewCtrl(){
		service = new BoardServiceImpl();
	}
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("BoardViewCtrl");
		response.setCharacterEncoding("UTF-8");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		BoardVO board = service.read(seq);
		request.setAttribute("boards", board); 
		
		
		
		ModelAndView view = new ModelAndView();
		view.setPath("boardview.jsp");
		view.setSend(true);
		return view;
	}
}
