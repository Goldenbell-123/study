package board.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class BoardReadCtrl implements Command{
	private BoardServiceImpl service;
	
	public BoardReadCtrl() {
		service = new BoardServiceImpl();
	}
	/* (non-Javadoc)
	 * @see ctrl.util.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("BoardRead 접속..");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoardVO result = service.read(seq);
		
		request.setAttribute("board", result);
		return new ModelAndView("boardview.jsp",true);
	}
	
	

}
