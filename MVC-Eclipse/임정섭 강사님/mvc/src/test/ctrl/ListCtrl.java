package test.ctrl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardmodel.vo.BoardVO;
import test.command.Command;
import test.view.View;


public class ListCtrl implements Command{

	/* (non-Javadoc)
	 * @see test.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public View execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LisCtrl");
		
		//구현이 필요한부분
		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		list.add(new BoardVO(1,"한영광","옆자리","딴짓함","17/02/08",0));
		list.add(new BoardVO(2,"김주영","앞자리","집중함","17/02/08",0));
		
//		HttpSession session = request.getSession();
//		session.setAttribute("boards", list);
//		
		//포워드 영역까지만 정보를 세팅하여 보내준다.
		request. setAttribute("boards",list);
		
		
		
		
		
		View view = new View();
		view.setPath("list.jsp");
		view.setSend(true);
		return view;
	}
}
