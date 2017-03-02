package com.acorn.board.service;

import java.util.List;

import com.acorn.model.vo.AttachVO;
import com.acorn.model.vo.BoardVO;
import com.acorn.model.vo.ReplyVO;

public interface BoardService {
	
	public List<BoardVO>	list();
	public int				insert(BoardVO obj);
	public BoardVO			read(int bno);
	public int				view(int bno);
	public int				readDelete(int bno);
	public int				modify(BoardVO obj);
	public int				replyRegistor(ReplyVO robj);
	public List<ReplyVO>	replyList(int robj);
}
