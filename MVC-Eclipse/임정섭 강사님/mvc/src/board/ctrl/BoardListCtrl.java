package board.ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import boardmodel.vo.BoardVO;
import test.command.Command;
import test.view.View;


public class BoardListCtrl implements Command{
	
	private BoardServiceImpl service;
	
	public BoardListCtrl(){
		service= new BoardServiceImpl();
	}
	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("boardlistctrl 접속");
		
		
		//Persistence service로 입력 정보 넘김
		
	
		
		//Business service로 그릇에 담긴 정보를 인스턴스로 넘김
		ArrayList<BoardVO> list = service.getListRow();
		
		//리케스트에 정보를 등록 등록
		request.setAttribute("boards", list);
		
		View view = new View();
			view.setPath("list.jsp");
			view.setSend(true);
	
		
		return view;
	}

	
}
