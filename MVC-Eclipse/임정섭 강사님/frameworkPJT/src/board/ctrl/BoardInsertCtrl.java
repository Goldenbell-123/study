package board.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;
import ctrl.util.Command;
import ctrl.view.ModelAndView;


public class BoardInsertCtrl implements Command{
	private BoardServiceImpl service;
	public BoardInsertCtrl(){
		service = new BoardServiceImpl();
	}
	/* (non-Javadoc)
	 * @see ctrl.util.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		System.out.println("글작성 완료 : BoardInsertCtrl 접속..");
		
		/**
		 * @param id
		 * @param pwd
		 * @param name
		 * @param email
		 * @param gender
		 * @param phoneNumber
		 */
		request.setCharacterEncoding("UTF-8") ; 
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer"); 
		String content = request.getParameter("content");
		
	
		BoardVO board = new BoardVO();
		
		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);
		
		
		
		int result = service.insert(board);
		
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
