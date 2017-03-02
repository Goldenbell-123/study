package board.main.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class BoardUpdateFormCtrl implements Command{
	private BoardServiceImpl service;
	
	public BoardUpdateFormCtrl() {
		service = new BoardServiceImpl();
	}
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("수정 페이지로");
		int seq =Integer.parseInt(request.getParameter("seq"));
		
		BoardVO result = service.read(seq);
		
		request.setAttribute("board", result);
		
		return new ModelAndView("boardupdate.jsp",true);
	}

	
	
}
