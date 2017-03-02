package com.acorn.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.board.model.sql.BoardDao;
import com.acorn.model.vo.AttachVO;
import com.acorn.model.vo.BoardVO;
import com.acorn.model.vo.ReplyVO;

@Repository("boardService")
public class BoardServiceImpl implements BoardService{

	

	@Resource(name="boardDao")
	private BoardDao dao;
	
	@Override
	public List<BoardVO> list() {
		System.out.println("List 완료");
		return dao.listRow();
	}

	@Override
	public int insert(BoardVO obj) {
		System.out.println("insert");
		
		return dao.insertRow(obj);
	}

	@Override
	public BoardVO read(int bno) {
		System.out.println("read");
		return dao.readRow(bno);
	}

	@Override
	public int view(int bno) {
		System.out.println("view");
		return dao.viewRow(bno);
	}
	
	@Override
	public int readDelete(int bno) {
		System.out.println("readDelete");
		return dao.readDeleteRow(bno);
	}

	@Override
	public int modify(BoardVO obj) {
		System.out.println("modify");
		return dao.modifyRow(obj);
	}

	@Override
	public int replyRegistor(ReplyVO robj) {
		System.out.println("replyRegistor service");
		return dao.replyRegistorRow(robj);
	}

	@Override
	public List<ReplyVO> replyList(int bno) {
		System.out.println("replyList 완료");
		return dao.replyListRow(bno);
	}
	

}
