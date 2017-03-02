package webprj.z01_dbcon;
//webprj.z01_dbcon A01_DBConExp
import java.sql.*;



public class A01_DBConExp {
	
	// 1. DB서버 연결 객체..
		private Connection con;
		
	// 2.연결후, 대화 객체
		private Statement stmt;
		
	// 3. 결과값 받는 객체
		ResultSet rs;
		
	//  연결 처리 메서드 구현..
		public void setConn() throws ClassNotFoundException, SQLException{
			
//			4.DB driver 메모 로딩.. 메모리를 올릴 때는 이구문을 틀리면 안됨 Class도 대문자
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
//			5.DB 서버 연결		
//				1) jdbc정보:ip:port:sid
			String conInfo="jdbc:oracle:thin:@192.168.0.80:1521:XE";
			
//				2) DirverManager에 메모리에 올라온 driver 연결처리
//					전역변수로 설정한  con에 연결처리..
//				con 으로 담아두자. = DriverManager.getConnection(접속정보,"계정ID","비번");
			con = DriverManager.getConnection(conInfo,"HR","1111");
			// 접속 확인
			System.out.println("접속성공..");
			
			
			
			
			
		}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A01_DBConExp db = new A01_DBConExp();
		try {
			db.setConn();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
// 192.168.0.127