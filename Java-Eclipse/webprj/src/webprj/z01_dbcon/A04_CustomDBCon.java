package webprj.z01_dbcon;
//webprj.z01_dbcon.A04_CustomDBCon
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import webprj.y01_vo.Customer;

public class A04_CustomDBCon {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConn() throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String conInfo="jdbc:oracle:thin:@localhost:1521:XE";
		con=DriverManager.getConnection(conInfo,"hr","1111");
		System.out.println("접속 성공..");


}
	// customer가 데이터 있는지 여부 check모듈..
	public boolean ckLogin(Customer ckcus) {
		boolean hasCustomer=false;
		try {
			setConn();
			String sql="select 1 from customer where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ckcus.getId());
			pstmt.setString(2, ckcus.getPass());
			rs= pstmt.executeQuery();
			hasCustomer=rs.next();
		}catch(ClassNotFoundException e){
			System.out.println(e.getMessage());
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch blockemp
				e.printStackTrace();
			}
		}
		return hasCustomer;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A04_CustomDBCon con = new A04_CustomDBCon();
		Customer ckcus= new Customer();
		ckcus.setId("홍길동");
		ckcus.setPass("1234");
		System.out.println(con.ckLogin(ckcus));
	}

}
