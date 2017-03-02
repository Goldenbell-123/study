package board.main.ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;

public class BoardListCtrl implements Command{
	private BoardServiceImpl service;
	public BoardListCtrl() {
		service = new BoardServiceImpl();
	}
	/* (non-Javadoc)
	 * @see ctrl.util.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("BoardListCtrl 접속...");
		ArrayList<BoardVO> list = service.list();
		
		request.setAttribute("boards", list);
		return new ModelAndView("boardlist.jsp",true); 
		
		
		

	}

	
}
