package springweb.d01_db;

import java.sql.*; // import java.sql.* : java.sql하위에 있는 모든 클래스 import
import java.util.ArrayList;



public class A01_Database {
/*
1. jdbc Driver 로딩
	DB server와 연결하기 위한 소프트웨어적인 driver설치.
	Class.forName("jdbc드라이버명호출")
	ex) Class.forName("oracle.jdbc.driver.Or
	
	
	
	
	
	
	
	
	acleDriver");
2. Database와 연결처리..
   1) IP : 어디에 있는? ex) (주소)
   2) port : 하나의 서버에 어떤 Service를 할지?
             ex) 특정 방
   3) SID : 식별자.. 오라클 DB서비스도 여러 개의 Databse
            운용 server가능..
   4) 계정 : 서버안에서도 여러개의 계정을 사용할 수 있다.
             계정은 비밀번호와 함께 매핑되어 접근할 수 있다.
   Connection con = DriverManager.getConnect("연결정보","계정","비번") 
   열결정보(문자열) ="jdbc:oracle:thin:@ip정보:port:sid";
   				coninfo ="jdbc:oracle:thin:@localhost:1521:XE";
   				계정:HR  비번:1111
             
3. 대화 - SQL
   1) 특정 데이터베이스에 접근하면 SQL을 통해서 데이터를 보거나,
      변경, 삭제, 입력을 할 수 있다.
     select, update, delete, insert
   2) 데이터 내용을 return되는 경우  ResultSet로 가져와서. ArrayList에 담는다.
   
	Statement stmt = 연결된객체 con.createStatement();
	sql ="SELECT * FROM EMP";
	stmt.executeQuery( sql );// 해당 내용을 실행하여 준다..
	리턴값이 있을 때,
	ResultSet 객체로 값을 받는다. 
       rs.next() 행단위로 커서를 변경시키며, 다음 행에 데이터가 있는지 여부를 return
       	 각 행에 rs.get데이터type("열명")로 해당 데이터를 가져온다.
       	        rs.get데이터type(정수)  select empno, ename from emp
    ArrayList<객체> 매핑처리..  
       테이블에서 컬럼정보를 확인해서 DAO, VO객체를 	        
       만든다.  	                                        1      2
4. 연결자원을 종료 처리  
    close()   
    rs.close(); stmt.close() con.close();                   
*/
/* 전역변수 선언..
 * 
 * */	
//	1. DB서버연결 객체..
	private Connection con;
//	2. 연결 후, 대화 객체
	private Statement stmt;
//	3. 결과값 받는 객체
	ResultSet rs;
	
//	연결처리 메서드 구현..
	public void setConn() throws ClassNotFoundException, SQLException{
//		4. DB driver 메모리 로딩..
		Class.forName("oracle.jdbc.driver.OracleDriver");
//		5. DB 서버 연결
//			1) jdbc정보:ip:port:sid
		String conInfo="jdbc:oracle:thin:@localhost:1521:XE";
//			2) DriverManager에 메모리에 올라온 driver로 연결처리.
//		       전역변수로 설정한 con에 열결처리..
		con=DriverManager.getConnection(conInfo,"hr","1111");
		System.out.println("접속 성공..");
	}
//	DB에 있는 데이터 내용을 ArrayList로 담는 처리..
//	emp 테이블의 내용을 ArrayList 담는 작업..
	public ArrayList<Emp> getEmpList(){
		ArrayList<Emp> elist= new ArrayList<Emp>();
		// 연결..
		try {
			
			setConn();
			// 연결된 내용에서 대화객체생성..
			stmt=con.createStatement();
			// 대화..
			String sql="SELECT * FROM EMP ";
//			실행을 통해서, 결과값을 ResultSet에 할당..	
			rs=stmt.executeQuery(sql);
//			rs.next() : 행단위 커서를 이동, 다음 행에 데이터가 있는지 여부
//			ArrayList 담기..
//
			
			Emp emp=null;
			while(rs.next()){
				emp = new Emp();
				// rs.getString("컬럼명"); ==> VO객체에 입력..
				emp.setEmployeeId(rs.getInt("EMPLOYEE_ID"));
				emp.setFirstName(rs.getString("FIRST_NAME"));
				emp.setLastName(rs.getString("LAST_NAME"));
				emp.setEmail(rs.getString("EMAIL"));
				emp.setPhoneNumber(rs.getString("PHONE_NUMBER"));
				emp.setHireDate(rs.getString("HIRE_DATE"));
				emp.setJobId(rs.getString("JOB_ID"));
				emp.setSalary(rs.getDouble("SALARY"));
				emp.setCommissionPct(rs.getDouble("COMMISSION_PCT"));
				emp.setManagerId(rs.getInt("MANAGER_ID"));
				emp.setDepartmentId(rs.getInt("DEPARTMENT_ID"));
				elist.add(emp);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return elist;
	}
	// 메서드명이 동일하더라고 param이 다르면 overloading으로 에러가 나지 않음.
	public ArrayList<Emp> getEmpList(Emp search){
		ArrayList<Emp> elist= new ArrayList<Emp>();
		// 연결..
		try {
			
			setConn();
			// 연결된 내용에서 대화객체생성..
			stmt=con.createStatement();
			// 대화..
/*
select * from emp
where LAST_NAME like '%%'
and PHONE_NUMBER like '%123%';
 * */			
			String sql="SELECT * FROM EMP WHERE 1=1 ";
			// null값이 아니거나, 공백이 아닐 때..
			if(search.getLastName()!=null&&
				!search.getLastName().trim().equals("")){
				sql+="AND LAST_NAME like '%'||'"+search.getLastName()+"'||'%' ";
			}
			if(search.getPhoneNumber()!=null&&
					!search.getPhoneNumber().trim().equals("")){
					sql+="AND PHONE_NUMBER like '%'||'"+search.getPhoneNumber()+"'||'%' ";
				}	
			System.out.println("현재sql:"+sql);
//			실행을 통해서, 결과값을 ResultSet에 할당..
			rs=stmt.executeQuery(sql);
//			rs.next() : 행단위 커서를 이동, 다음 행에 데이터가 있는지 여부
//			ArrayList 담기..
//
			
			Emp emp=null;
			while(rs.next()){
				emp = new Emp();
				// rs.getString("컬럼명"); ==> VO객체에 입력..
				emp.setEmployeeId(rs.getInt("EMPLOYEE_ID"));
				emp.setFirstName(rs.getString("FIRST_NAME"));
				emp.setLastName(rs.getString("LAST_NAME"));
				emp.setEmail(rs.getString("EMAIL"));
				emp.setPhoneNumber(rs.getString("PHONE_NUMBER"));
				emp.setHireDate(rs.getString("HIRE_DATE"));
				emp.setJobId(rs.getString("JOB_ID"));
				emp.setSalary(rs.getDouble("SALARY"));
				emp.setCommissionPct(rs.getDouble("COMMISSION_PCT"));
				emp.setManagerId(rs.getInt("MANAGER_ID"));
				emp.setDepartmentId(rs.getInt("DEPARTMENT_ID"));
				elist.add(emp);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return elist;
	}
	public ArrayList<Emp> getEmpList2(Emp search){
		ArrayList<Emp> elist= new ArrayList<Emp>();
		// 연결..
		try {
			
			setConn();
			// 연결된 내용에서 대화객체생성..
			stmt=con.createStatement();
			String sql="SELECT * FROM EMP WHERE 1=1 ";
			// null값이 아니거나, 공백이 아닐 때..
			if(search.getLastName()!=null&&
				!search.getLastName().trim().equals("")){
				sql+=" AND LAST_NAME like '%'||'"+search.getLastName()+"'||'%' ";
			}
			if(search.getPhoneNumber()!=null&&
					!search.getPhoneNumber().trim().equals("")){
					sql+=" AND PHONE_NUMBER like '%'||'"+search.getPhoneNumber()+"'||'%' ";
			}
			if(search.getCkdepartmentId()!=null&&
					!search.getCkdepartmentId().trim().equals("")){
				sql+=" AND DEPARTMENT_ID = "+search.getDepartmentId()+" ";
			}
			if(search.getCksalary()!=null&&
					!search.getCksalary().trim().equals("")){
				sql+=" AND FLOOR(SALARY/1000) = "+(search.getSalary()/1000)+" ";
			}	
			if(search.getEmail()!=null&&
					!search.getEmail().trim().equals("")){
					sql+=" AND EMAIL like '%'||'"+search.getEmail()+"'||'%' ";
			}			
			System.out.println("현재sql2:"+sql);
			rs=stmt.executeQuery(sql);
			
			Emp emp=null;
			while(rs.next()){
				emp = new Emp();
				// rs.getString("컬럼명"); ==> VO객체에 입력..
				emp.setEmployeeId(rs.getInt("EMPLOYEE_ID"));
				emp.setFirstName(rs.getString("FIRST_NAME"));
				emp.setLastName(rs.getString("LAST_NAME"));
				emp.setEmail(rs.getString("EMAIL"));
				emp.setPhoneNumber(rs.getString("PHONE_NUMBER"));
				emp.setHireDate(rs.getString("HIRE_DATE"));
				emp.setJobId(rs.getString("JOB_ID"));
				emp.setSalary(rs.getDouble("SALARY"));
				emp.setCommissionPct(rs.getDouble("COMMISSION_PCT"));
				emp.setManagerId(rs.getInt("MANAGER_ID"));
				emp.setDepartmentId(rs.getInt("DEPARTMENT_ID"));
				elist.add(emp);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return elist;
	}	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A01_Database db = new A01_Database();
		ArrayList<Emp> emplist=db.getEmpList();
//		/*
//		System.out.println("데이터 건수:"+emplist.size()+"건");
//		for(Emp e:emplist){
//			System.out.print(e.getEmployeeId()+"\t");
//			System.out.print(e.getFirstName()+"\t");
//			System.out.print(e.getLastName()+"\t");
//			System.out.print(e.getPhoneNumber()+"\t");
//			System.out.println(e.getSalary());
//		}
///*
//select * from emp
//where LAST_NAME like '%'||'k'||'%'
//and PHONE_NUMBER like '%'||'124'||'%';
// * */		
//		System.out.println("### 검색 처리 모듈1 ###");
//		Emp search = new Emp();
//		search.setLastName("k");
//		search.setPhoneNumber("124");
//		for(Emp e: db.getEmpList( search ) ){
//			System.out.print(e.getEmployeeId()+"\t");
//			System.out.print(e.getFirstName()+"\t");
//			System.out.print(e.getLastName()+"\t");
//			System.out.print(e.getPhoneNumber()+"\t");
//			System.out.println(e.getSalary());
//		}		
//		System.out.println("### 검색 처리 모듈2 ###");
//		search = new Emp();
//		//search.setCkdepartmentId("0");
//		//search.setCksalary("0");
//		search.setEmail("S");
//		for(Emp e: db.getEmpList2( search ) ){
//			System.out.print(e.getDepartmentId()+"\t");
//			System.out.print(e.getFirstName()+"\t");
//			System.out.print(e.getLastName()+"\t");
//			System.out.print(e.getEmail()+"\t");
//			System.out.println(e.getSalary());
//		}	
//		*/
	}

}
