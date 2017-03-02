package ajax.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import board.service.BoardServiceImpl;
import board.vo.BoardVO;



@WebServlet("/BoardSearch.Ajax")
public class BoardSearchAjax extends HttpServlet {
	
	private BoardServiceImpl service;
	public BoardSearchAjax(){
		service = new BoardServiceImpl();
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		System.out.println("BoardSearchAjax");
		request.setCharacterEncoding("UTF-8");
		
		
		String keymenu = request.getParameter("searchMenu");
		String keyword = request.getParameter("searchKeyword");
		System.out.println(" keymenu : "+keymenu);
		System.out.println(" keyword : "+keyword);
		
		//BoardVO board = new BoardVO();
		//board.setTitle(keymenu);
		//board.setContent(keyword);
		
		BoardVO board = new BoardVO();
		board.setSearchmenu(keymenu);
		board.setSearchkey(keyword);
		
		ArrayList<BoardVO> list = service.search(board);
		
		JSONArray jAry = new JSONArray(list);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jAry);
		
		
	}
}
