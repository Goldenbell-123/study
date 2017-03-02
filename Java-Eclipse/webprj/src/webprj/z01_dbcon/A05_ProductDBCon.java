package webprj.z01_dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import webprj.y01_vo.Product;
//webprj.z01_dbcon.A05_ProductDBCon;
public class A05_ProductDBCon {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConn() throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String conInfo="jdbc:oracle:thin:@localhost:1521:XE";
		con=DriverManager.getConnection(conInfo,"hr","1111");
		System.out.println("접속 성공..");
}
	public boolean ckValid(Product p) {
		//물건 객체가 들어오면 이름을 
		boolean hasProd= false;
		try {
			setConn();
			String sql="select 1 from fruit where name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p.getName());
			rs= pstmt.executeQuery();
			hasProd=rs.next();
			
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
		return hasProd;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//webprj.z01_dbcon.A05_ProductDBCon;
		A05_ProductDBCon db = new A05_ProductDBCon();
		System.out.println(db.ckValid(new Product("사과")));
		
	}

}
