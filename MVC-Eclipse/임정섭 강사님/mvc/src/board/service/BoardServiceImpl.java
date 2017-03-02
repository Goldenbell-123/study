package board.service;

import java.util.ArrayList;

import board.model.sql.BoardDaoImpl;
import boardmodel.vo.BoardVO;

public class BoardServiceImpl {
	private BoardDaoImpl dao;
	public BoardServiceImpl(){
		dao = new BoardDaoImpl();
	}

	public  ArrayList<BoardVO> getListRow(){
		System.out.println("Board Service");
		
		ArrayList<BoardVO> list = dao.listRow();
		return list;
	}
	
}
