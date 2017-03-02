package board.model.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import boardmodel.vo.BoardVO;

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
}
