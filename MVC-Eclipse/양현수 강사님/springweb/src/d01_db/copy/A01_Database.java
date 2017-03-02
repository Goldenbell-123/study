package d01_db.copy;

import java.sql.*; // import java.sql.* : java.sql������ �ִ� ��� Ŭ���� import
import java.util.ArrayList;



public class A01_Database {
/*
1. jdbc Driver �ε�
	DB server�� �����ϱ� ���� ����Ʈ�������� driver��ġ.
	Class.forName("jdbc����̹���ȣ��")
	ex) Class.forName("oracle.jdbc.driver.OracleDriver");
2. Database�� ����ó��..
   1) IP : ��� �ִ�? ex) (�ּ�)
   2) port : �ϳ��� ������ � Service�� ����?
             ex) Ư�� ��
   3) SID : �ĺ���.. ����Ŭ DB���񽺵� ���� ���� Databse
            ��� server����..
   4) ���� : �����ȿ����� �������� ������ ����� �� �ִ�.
             ������ ��й�ȣ�� �Բ� ���εǾ� ������ �� �ִ�.
   Connection con = DriverManager.getConnect("��������","����","���") 
   ��������(���ڿ�) ="jdbc:oracle:thin:@ip����:port:sid";
   				coninfo ="jdbc:oracle:thin:@localhost:1521:XE";
   				����:HR  ���:1111
             
3. ��ȭ - SQL
   1) Ư�� �����ͺ��̽��� �����ϸ� SQL�� ���ؼ� �����͸� ���ų�,
      ����, ����, �Է��� �� �� �ִ�.
     select, update, delete, insert
   2) ������ ������ return�Ǵ� ���  ResultSet�� �����ͼ�. ArrayList�� ��´�.
   
	Statement stmt = ����Ȱ�ü con.createStatement();
	sql ="SELECT * FROM EMP";
	stmt.executeQuery( sql );// �ش� ������ �����Ͽ� �ش�..
	���ϰ��� ���� ��,
	ResultSet ��ü�� ���� �޴´�. 
       rs.next() ������� Ŀ���� �����Ű��, ���� �࿡ �����Ͱ� �ִ��� ���θ� return
       	 �� �࿡ rs.get������type("����")�� �ش� �����͸� �����´�.
       	        rs.get������type(����)  select empno, ename from emp
    ArrayList<��ü> ����ó��..  
       ���̺��� �÷������� Ȯ���ؼ� DAO, VO��ü�� 	        
       �����.  	                                        1      2
4. �����ڿ��� ���� ó��  
    close()   
    rs.close(); stmt.close() con.close();                   
*/
/* �������� ����..
 * 
 * */	
//	1. DB�������� ��ü..
	private Connection con;
//	2. ���� ��, ��ȭ ��ü
	private Statement stmt;
//	3. ����� �޴� ��ü
	ResultSet rs;
	
//	����ó�� �޼��� ����..
	public void setConn() throws ClassNotFoundException, SQLException{
//		4. DB driver �޸� �ε�..
		Class.forName("oracle.jdbc.driver.OracleDriver");
//		5. DB ���� ����
//			1) jdbc����:ip:port:sid
		String conInfo="jdbc:oracle:thin:@localhost:1521:XE";
//			2) DriverManager�� �޸𸮿� �ö�� driver�� ����ó��.
//		       ���������� ������ con�� ����ó��..
		con=DriverManager.getConnection(conInfo,"hr","1111");
		System.out.println("���� ����..");
	}
//	DB�� �ִ� ������ ������ ArrayList�� ��� ó��..
//	emp ���̺��� ������ ArrayList ��� �۾�..
	public ArrayList<Emp> getEmpList(){
		ArrayList<Emp> elist= new ArrayList<Emp>();
		// ����..
		try {
			
			setConn();
			// ����� ���뿡�� ��ȭ��ü����..
			stmt=con.createStatement();
			// ��ȭ..
			String sql="SELECT * FROM EMP ";
//			������ ���ؼ�, ������� ResultSet�� �Ҵ�..	
			rs=stmt.executeQuery(sql);
//			rs.next() : ����� Ŀ���� �̵�, ���� �࿡ �����Ͱ� �ִ��� ����
//			ArrayList ���..
//
			
			Emp emp=null;
			while(rs.next()){
				emp = new Emp();
				// rs.getString("�÷���"); ==> VO��ü�� �Է�..
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
	// �޼������ �����ϴ���� param�� �ٸ��� overloading���� ������ ���� ����.
	public ArrayList<Emp> getEmpList(Emp search){
		ArrayList<Emp> elist= new ArrayList<Emp>();
		// ����..
		try {
			
			setConn();
			// ����� ���뿡�� ��ȭ��ü����..
			stmt=con.createStatement();
			// ��ȭ..
/*
select * from emp
where LAST_NAME like '%%'
and PHONE_NUMBER like '%123%';
 * */			
			String sql="SELECT * FROM EMP WHERE 1=1 ";
			// null���� �ƴϰų�, ������ �ƴ� ��..
			if(search.getLastName()!=null&&
				!search.getLastName().trim().equals("")){
				sql+="AND LAST_NAME like '%'||'"+search.getLastName()+"'||'%' ";
			}
			if(search.getPhoneNumber()!=null&&
					!search.getPhoneNumber().trim().equals("")){
					sql+="AND PHONE_NUMBER like '%'||'"+search.getPhoneNumber()+"'||'%' ";
				}	
			System.out.println("����sql:"+sql);
//			������ ���ؼ�, ������� ResultSet�� �Ҵ�..
			rs=stmt.executeQuery(sql);
//			rs.next() : ����� Ŀ���� �̵�, ���� �࿡ �����Ͱ� �ִ��� ����
//			ArrayList ���..
//
			
			Emp emp=null;
			while(rs.next()){
				emp = new Emp();
				// rs.getString("�÷���"); ==> VO��ü�� �Է�..
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
		// ����..
		try {
			
			setConn();
			// ����� ���뿡�� ��ȭ��ü����..
			stmt=con.createStatement();
			String sql="SELECT * FROM EMP WHERE 1=1 ";
			// null���� �ƴϰų�, ������ �ƴ� ��..
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
			System.out.println("����sql2:"+sql);
			rs=stmt.executeQuery(sql);
			
			Emp emp=null;
			while(rs.next()){
				emp = new Emp();
				// rs.getString("�÷���"); ==> VO��ü�� �Է�..
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
//		System.out.println("������ �Ǽ�:"+emplist.size()+"��");
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
//		System.out.println("### �˻� ó�� ���1 ###");
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
//		System.out.println("### �˻� ó�� ���2 ###");
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
