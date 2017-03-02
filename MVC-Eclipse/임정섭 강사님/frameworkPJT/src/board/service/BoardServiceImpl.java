package board.service;

import java.util.ArrayList;

import board.model.sql.BoardDaoImpl;
import board.vo.BoardVO;
import board.vo.ReplyVO;

public class BoardServiceImpl {
	private BoardDaoImpl dao;
	
	public BoardServiceImpl(){
		dao = new BoardDaoImpl();
	}
	
	public ArrayList<BoardVO> list(){
		System.out.println("Board Service list접속..");
		
		ArrayList<BoardVO> list = dao.listRow();
		return list;
	}
	
	public int insert(BoardVO board){
		System.out.println("Board Service insert접속..");
		
		int flag = dao.insertRow(board);
		
		return flag;
	}
	
	public BoardVO read(int seq){
		System.out.println("BoardSevice read 접속..");
		
		BoardVO result= dao.readRow(seq);
		
		return result;
	}
	public int update(BoardVO board){
		System.out.println("Service update");
		
		return dao.updateRow(board);
	}
	public int delete(int seq){
		System.out.println("Service delete");
		
		
		return dao.deleteRow(seq);
	}
	public ArrayList<ReplyVO> searchReply(int seq){
		System.out.println("Service searchReply");
		
		return dao.searchReplyRow(seq);
	}
	
	public ArrayList<BoardVO> search(BoardVO board){
		System.out.println("Service search");
		
		return dao.searchRow(board);
	}
	
	public int replyInsert(ReplyVO board){
		System.out.println("BoardSevice reply 접속..");
		int result=dao.replyInsertRow(board);
		
		return result;
	}


	
	
}
