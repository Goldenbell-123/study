package board.model.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.vo.BoardVO;
import board.vo.ReplyVO;

public class BoardDaoImpl {

	////////////////////////////////////////////////////////////////////////
	public static final String driver = "oracle.jdbc.driver.OracleDriver";
	public static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final String user="hr";
	public static final String passwd = "1111";
	////////////////////////////////////////////////////////////////////////

	
	public BoardDaoImpl(){
		try {
		//1. driver loading : 드라이버를 메모리를 할당해준다.
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 메인 화면에 뿌려주는 기능
	public ArrayList<BoardVO> listRow(){
		System.out.println("Dao listRow");

		ArrayList<BoardVO> list= new ArrayList<BoardVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String listSQL="select * from board";
		
		try {
			conn= DriverManager.getConnection(url,user,passwd);
			pstmt=conn.prepareStatement(listSQL);
			rset = pstmt.executeQuery();
			while(rset.next()){
				BoardVO board = 
				new BoardVO(rset.getInt(1), rset.getString(2),
							rset.getString(3), rset.getString(4),
							rset.getString(5), rset.getInt(6));
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	/**
	 * @param seq
	 * @param writer
	 * @param title
	 * @param content
	 * @param regDate
	 * @param cnt
	 */
	// 글쓰기 기능
	public int insertRow(BoardVO board){
		System.out.println("Dao insertRow 접속...");
		int flag = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String listSQL="insert into board values(boardseq.nextval,?,?,?,sysdate,0)";  
		
		try {
			conn= DriverManager.getConnection(url,user,passwd);
			pstmt=conn.prepareStatement(listSQL);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return flag;
		
	}
	
	
	// 글하나 선택해서 상세보기
	public BoardVO readRow(int seq) {
		System.out.println("Dao readRow 접속...");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		BoardVO result = null;
		String listSQL="select * from board where seq=?";
		
		try {
			conn= DriverManager.getConnection(url,user,passwd);
			pstmt=conn.prepareStatement(listSQL);
			pstmt.setInt(1, seq);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()){
			result = new BoardVO(
					rset.getInt(1), rset.getString(2),
					rset.getString(3), rset.getString(4),
					rset.getString(5), rset.getInt(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	
	}
	
	// 수정 기능
	public int updateRow(BoardVO board){
		int flag = 0;
		System.out.println("Dao update Row");

		Connection			conn  = null;
		PreparedStatement	pstmt = null;
		String 				updateSQL ="UPDATE BOARD SET title=?, content=? WHERE seq=?";
		
		try {
			conn  = DriverManager.getConnection(url, user, passwd);
			pstmt = conn.prepareStatement(updateSQL);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getSeq());
			flag  = pstmt.executeUpdate();
			System.out.println("DAO flag : "+flag);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	// 삭제기능
	public int deleteRow(int seq){
		int flag = 0;
		System.out.println("Dao Delete Row");

		Connection			conn  = null;
		PreparedStatement	pstmt = null;
		String 				deleteSQL = "DELETE FROM BOARD WHERE seq=?";
		
		try {
			conn  = DriverManager.getConnection(url, user, passwd);
			pstmt = conn.prepareStatement(deleteSQL);
			pstmt.setInt(1, seq);
			flag  = pstmt.executeUpdate();
			System.out.println("DAO flag : "+flag);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	
	//검색기능
	public ArrayList<BoardVO> searchRow(BoardVO board){
		System.out.println("Dao Search Row");
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();

		Connection			conn  = null;
		PreparedStatement	pstmt = null;
		ResultSet			rset  = null;
		String 				searchSQL = "";

		try {
				conn  = DriverManager.getConnection(url, user, passwd);
				// '?' 는 컬럼을 명시할 때 사용할 수 없다. 그렇기 때문에 무조건 if문을 쓰도록.
				if(board.getSearchmenu().equals("title")){ 
					searchSQL = "SELECT * FROM BOARD WHERE title LIKE '%'||?||'%'";
				}else if(board.getSearchmenu().equals("writer")){
					searchSQL = "SELECT * FROM BOARD WHERE writer LIKE '%'||?||'%'";
				}else{
					searchSQL = "SELECT * FROM BOARD WHERE content LIKE '%'||?||'%'";
				}
				
				System.out.println(searchSQL);
				pstmt = conn.prepareStatement(searchSQL);
				pstmt.setString(1, board.getSearchkey());
				rset  = pstmt.executeQuery();
				
				while(rset.next()){
					board = new BoardVO(rset.getInt(1),    rset.getString(2), 
										rset.getString(3), rset.getString(4), 
										rset.getString(5), rset.getInt(6)    );
					list.add(board);
				}
			System.out.println("list.add 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	/**
	 * @param rseq
	 * @param rcontent
	 * @param rwriter
	 * @param seq
	 */
	
	//댓글 리스트 가져오기
	public ArrayList<ReplyVO> searchReplyRow(int seq){
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		System.out.println("searchReplyRow 접속...");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String listSQL="select * from reply where seq=?";
		
		try {
			conn= DriverManager.getConnection(url,user,passwd);
			pstmt=conn.prepareStatement(listSQL);
			pstmt.setInt(1, seq);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()){
			ReplyVO result = new ReplyVO(
					rset.getInt(1), rset.getString(2),
					rset.getString(3), rset.getInt(4));
				list.add(result);
			}
			System.out.println("list add 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	//댓글 추가하기
	public int replyInsertRow(ReplyVO reply){
		System.out.println("Dao replyInsertRow 접속...");
		int flag = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String listSQL="insert into reply values(boardseq.nextval,?,?,?)";  
		
		try {
			conn= DriverManager.getConnection(url,user,passwd);
			pstmt=conn.prepareStatement(listSQL);
			pstmt.setString(1, reply.getRcontent());
			pstmt.setString(2, reply.getRwriter());
			pstmt.setInt(3, reply.getSeq());
			
			flag = pstmt.executeUpdate();
			System.out.println("DAO replyInsertRow 완성");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
	}
}
