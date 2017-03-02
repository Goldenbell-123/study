package com.acorn.board.model.sql;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.model.vo.AttachVO;
import com.acorn.model.vo.BoardVO;
import com.acorn.model.vo.ReplyVO;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	


	@Override
	public List<BoardVO> listRow() {
		System.out.println("listRow");
		return session.selectList("org.board.mapper.boardList");
	}

	@Override
	public int insertRow(BoardVO obj) {
		System.out.println("insertRow");
		int result = session.insert("org.board.mapper.boardInsert", obj);
		if(result != 0){
			 session.insert("org.board.mapper.attachInsert", obj);
		}
		return result;
	}


	@Override
	public BoardVO readRow(int bno) {
		System.out.println("readRow");
		return session.selectOne("org.board.mapper.boardRead",bno);
	}
	
	@Override
	public int viewRow(int bno) {
		System.out.println("viewRow");
		return session.update("org.board.mapper.boardView", bno);
	}
	

	@Override
	public int readDeleteRow(int bno) {
		System.out.println("readDeleteRow");
		return session.delete("org.board.mapper.boardDelete", bno);
	}

	@Override
	public int modifyRow(BoardVO obj) {
		System.out.println("modifyRow");
		return session.update("org.board.mapper.boardView", obj);
	}

	@Override
	public int replyRegistorRow(ReplyVO robj) {
		System.out.println("replyRegistorRow Dao");
		return session.insert("org.board.mapper.replyRegister",robj);
	}
	
	@Override
	public List<ReplyVO> replyListRow(int bno) {
		System.out.println("replyListRow Dao 완료");
		return session.selectList("org.board.mapper.replyList",bno);
	}
	

}
