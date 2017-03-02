package user.model.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.model.vo.UserVo;

public class UserDaoImpl {
	
	/* 접속절차
	 * 1. driver loading -> Class.forName();
	 * 2. Connection
	 * 3. PreparedStatement(sql);
	 * 4. executeQuery();
	 * 5. ResultSet
	 * 6. close();
	 */
	
	//1.DB 접속 Driver 로딩
	////////////////////////////////////////////////////////////////////////
	public static final String driver = "oracle.jdbc.driver.OracleDriver";
	public static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final String user="hr";
	public static final String passwd = "1111";
	////////////////////////////////////////////////////////////////////////
	
	public UserDaoImpl(){
		try {
			//1. driver loading : 드라이버를 메모리를 할당해준다.
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public UserVo loginRow(UserVo obj){
		System.out.println("Dao loginRow");
		
		
		Connection			conn = null;
		PreparedStatement	pstmt = null;
		ResultSet			rset = null;
		
		//sql 구문 작성
		String	loginSQL="select * from acornmem where id=? and pwd=?";
		
		//loginSQL담을 그릇이 필요
		UserVo result = null;
		
		
		try {
			//2. 접속하기
			conn = DriverManager.getConnection(url, user, passwd);
			
			//3. 접속한 conn에서 sql구문을 담기
			pstmt = conn.prepareStatement(loginSQL);
			pstmt.setString(1, obj.getId());
			pstmt.setString(2, obj.getPwd());
			
			//4. 쿼리를 이용해서 데이터를 꺼내오기 *select이므로 executeQuery()
			rset = pstmt.executeQuery();
			
			//5. result set 결과값을 가져오기
			while(rset.next()){		
				result = new UserVo(rset.getString(1),rset.getString(2),rset.getString(3),
						rset.getString(4),rset.getString(5),rset.getString(6));
			} 
			
			// 실행이 됬는지 확인
			System.out.println("dao result :"+result);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				//6. 연결 해제 :  메모리 및 잘못된정보가 들어갈 수 있음.
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//////////////////메서드 추가 join
	public int insertRow(UserVo obj){
		System.out.println("DAo insertRow");
		
		
		Connection			conn = null;
		PreparedStatement	pstmt = null;
		int result = 0;
		
		//sql 구문 작성
		String	loginSQL="insert into acornmem values(?,?,?,?,?,?)";

		try {
			//2. 접속하기
			conn = DriverManager.getConnection(url, user, passwd);
			
			//3. 접속한 conn에서 sql구문을 담기
			pstmt = conn.prepareStatement(loginSQL);
			pstmt.setString(1, obj.getId());
			pstmt.setString(2, obj.getPwd());
			pstmt.setString(3, obj.getName());
			pstmt.setString(4, obj.getEmail());
			pstmt.setString(5, obj.getGender());
			pstmt.setString(6, obj.getphoneNumber());
			
			//4. 쿼리를 이용해서 데이터를 꺼내오기 *select이므로 executeQuery()
			result = pstmt.executeUpdate();
			
			// 실행이 됬는지 확인
			System.out.println("dao result :"+result);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				//6. 연결 해제 :  메모리 및 잘못된정보가 들어갈 수 있음.
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//구현 부탁드립니다.
		return result;
	}
	
}
