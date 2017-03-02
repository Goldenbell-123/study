package com.acorn.board.model.sql;

import java.util.List;

import com.acorn.model.vo.AttachVO;
import com.acorn.model.vo.BoardVO;
import com.acorn.model.vo.ReplyVO;

public interface BoardDao {

	public List<BoardVO>	listRow();
	public int				insertRow(BoardVO obj);
	public BoardVO			readRow(int bno);
	public int				viewRow(int bno);
	public int				readDeleteRow(int bno);
	public int				modifyRow(BoardVO obj);
	public int				replyRegistorRow(ReplyVO robj);
	public List<ReplyVO>	replyListRow(int bno);
}
