package webprj.z01_dbcon;

import java.sql.*;
import java.util.ArrayList;

import javastart.dao.MoneybookDao;
import javastart.dao.QuestDao;
import javastart.vo.Emp;
import javastart.vo.EmpVo;
import javastart.vo.MoneybookVo;

public class A03_DatabasePrepare {
	private Connection con;
	private Statement stmt;
	// 준비된 대화...
	/*  1) sql injection 방지 
	 *  2) performance 향상
	 * 
	 * */
	private PreparedStatement pstmt;
	ResultSet rs;
	public ArrayList<EmpVo> getEmpty(EmpVo search){
		ArrayList<EmpVo> list = new ArrayList<EmpVo>();
		try{
			setConn();
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	//throws ClassNotFoundException, SQLException
	public void setConn() throws ClassNotFoundException, SQLException{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String conInfo="jdbc:oracle:thin:@localhost:1521:XE";
			con=DriverManager.getConnection(conInfo,"hr","1111");
			System.out.println("접속 성공..");


	}
	public ArrayList<Emp> getEmpList(Emp search){
		ArrayList<Emp> list = new ArrayList<Emp>();
		try{
			setConn();
/*
1. db연결..
2. sql문 만들기.. 
    select * from emp
    where ename like '%'||'@@@'||'%'
    ==> ename like '%'|| ? || '%'
     and empno = ?
     and salary between ? and ?
     and hiredate between ? and ?
3. pstmt = con.prepareStatement( sql ) vs con.createStatement();
     ?에 대한 데이터 mapping..
     pstmt.set(순서, 매핑할 데이터) 순서 1~~시작..
     ex) pstmt.setString(1, "하이맨");
         pstmt.setInt(2, 2536 );
  
 * */
			String sql=" select first_name ||' '||last_name name, "+ 
                       " phone_number phone, "+
                       " salary, email from emp "+
                       " where phone_number like '%'|| ? ||'%' "+
                       " and last_name like '%'|| ? ||'%' ";
/*phone_number 123, last_name  K*/	
			// preparedStatement를 통한  대화.
			pstmt = con.prepareStatement(sql);
			// ?별로 mapping..
			pstmt.setString(1, search.getPhoneNumber());
			pstmt.setString(2, search.getLastName());
			// 결과값 가져오기..
			rs = pstmt.executeQuery();
			Emp e=null;
			while(rs.next()){
//				System.out.print(rs.getString("name")+"\t");
//				System.out.print(rs.getString("phone")+"\t");
//				System.out.print(rs.getString("email")+"\t");
//				System.out.print(rs.getDouble("salary")+"\n");
				e = new Emp();
				e.setName(rs.getString("name"));
				e.setPhoneNumber(rs.getString("phone"));
				e.setEmail(rs.getString("email"));
				e.setSalary(rs.getDouble("salary"));
				list.add(e);
				
				System.out.print(rs.getString(1)+"\t");
				System.out.print(rs.getString(2)+"\t");
				System.out.print(rs.getDouble(3)+"\n");				
				System.out.print(rs.getString(4)+"\t");				
			}
			
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
		
		
		
		return list;
	}
	public ArrayList<EmpVo> getEmpList2(EmpVo search){
		ArrayList<EmpVo> list = new ArrayList<EmpVo>();
		try{
			setConn();
			String sql= " SELECT a.*, salary + enhance tot "+
						"   FROM (SELECT employee_id id, "+
						"                first_name || '.' || last_name name, "+
						"                email, "+
						"                phone_number phone, "+
						"                salary, "+
						"                salary * 0.1 enhance "+
						"           FROM emp) a "+
						"  WHERE 1=1  "+
						"  AND name LIKE '%'||?||'%'  "+
						"  AND phone LIKE '%'||?||'%'  "+
						"  AND salary BETWEEN ? AND ? ";			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search.getName());
			pstmt.setString(2, search.getPhone());
			pstmt.setInt(3, search.getMinSal());
			pstmt.setInt(4, search.getMaxSal());
			
			rs = pstmt.executeQuery();
			EmpVo e=null;
			while(rs.next()){
				e = new EmpVo();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setPhone(rs.getString("phone"));
				e.setEmail(rs.getString("email"));
				e.setSalary(rs.getDouble("salary"));
				e.setEnhance(rs.getInt("enhance"));
				e.setTot(rs.getInt("tot"));
				list.add(e);
			}
			
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public void insertQuest(QuestDao insObj){
		try{
			setConn();
/*
commit : 데이터를 변경할 때, 임시로 변경했다가 확정..
 commit 하기 전에는 rollback으로 다시 원복가능..
 autocommit 옵션을 사용하면 commit을 하지 않더라고 변경확정처리가 되기에
 초기에 이런 내용을 방지 처리 하여야 한다.
 setAutoCommit(false)처리.. 
 * */		
			con.setAutoCommit(false);
			String sql =" insert into quest values( "+        
						"   quest_seqno.nextval,?,?)  ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, insObj.getContent());
			pstmt.setString(2, insObj.getAnswer());
			pstmt.executeUpdate();
			con.commit(); // 정상처리시, commit
			System.out.println("입력완료!!");
//'MES가 뜻하는 바는 무엇인가?'
// 'Manufacturing Execution System Shop Floor'			
		}catch(ClassNotFoundException e){
			System.out.println(e.getMessage());
		}catch(SQLException e){
			System.out.println(e.getMessage());
			// 입력할 때, 문제발생시, rollback처리..
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}finally{
			try {
				pstmt.close();
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
	}	
	public void updateQuest(QuestDao uptObj){
		try{
			
			setConn();
			con.setAutoCommit(false);
			String sql =" update quest \n"+        
						"   set content = ?,  \n"+
						"   answer = ?  \n"+
						" where no = ?  ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, uptObj.getContent());
			pstmt.setString(2, uptObj.getAnswer());
			pstmt.setInt(3, uptObj.getNo());
			pstmt.executeUpdate();
			con.commit(); 
			System.out.println("수정완료!!");
		
		}catch(ClassNotFoundException e){
			System.out.println(e.getMessage());
		}catch(SQLException e){
			System.out.println("##########");
			System.out.println(e.getMessage());
			// 입력할 때, 문제발생시, rollback처리..
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}finally{
			try {
				pstmt.close();
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
	}	
	public void deleteQuest(QuestDao delObj){
		try{
			
			setConn();
			con.setAutoCommit(false);
			String sql =" delete quest \n"+        
						" where no = ?  ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, delObj.getNo());
			pstmt.executeUpdate();
			con.commit(); 
			System.out.println("삭제완료!!");
		
		}catch(ClassNotFoundException e){
			System.out.println(e.getMessage());
		}catch(SQLException e){
			System.out.println("##########");
			System.out.println(e.getMessage());
			// 입력할 때, 문제발생시, rollback처리..
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}finally{
			try {
				pstmt.close();
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
	}
	public ArrayList<QuestDao> getQuestList(){
		ArrayList<QuestDao> list = new ArrayList<QuestDao>();
		try{
			setConn();
			String sql="   SELECT * " +
					"     FROM quest " +
					" ORDER BY no ";			
			
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			QuestDao e=null;
			while(rs.next()){
				e = new QuestDao();
				e.setNo(rs.getInt("no"));
				e.setContent(rs.getString("content"));
				e.setAnswer(rs.getString("answer"));
				list.add(e);
			}
			
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}		
	
	public void insMoneyBook(MoneybookDao insObj){
		try{
			setConn();
			con.setAutoCommit(false);
			String sql =" insert into moneybook values( "+        
						"   mbseq.nextval,sysdate,?,?,?)  ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, insObj.getType());
			pstmt.setString(2, insObj.getContent());
			pstmt.setInt(3, insObj.getMoney());
			pstmt.executeUpdate();
			con.commit(); // 정상처리시, commit
			System.out.println("입력완료!!");
		}catch(ClassNotFoundException e){
			System.out.println(e.getMessage());
		}catch(SQLException e){
			System.out.println(e.getMessage());
			// 입력할 때, 문제발생시, rollback처리..
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}finally{
			try {
				pstmt.close();
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
	}	
	public void insMoneyBook2(QuestDao insObj){
		try{
			setConn();
			con.setAutoCommit(false);
			String sql =" insert into moneybook2 values( "+        
						"   mbseq2.nextval,?,?)  ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, insObj.getContent());
			pstmt.setString(2, insObj.getAnswer());
			pstmt.executeUpdate();
			con.commit(); // 정상처리시, commit
			System.out.println("입력완료!!");
		}catch(ClassNotFoundException e){
			System.out.println(e.getMessage());
		}catch(SQLException e){
			System.out.println(e.getMessage());
			// 입력할 때, 문제발생시, rollback처리..
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}finally{
			try {
				pstmt.close();
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
	}
	public ArrayList<MoneybookVo> getMoneyBookList(){
		ArrayList<MoneybookVo> list = new ArrayList<MoneybookVo>();
		try{
			setConn();
			String sql="   SELECT no, " +
					"          TYPE, " +
					"          TO_CHAR (indate, 'YYYY\"년\" MM\"월\" DD\"일\"') indate, " +
					"          content, " +
					"          DECODE (TYPE, '수입', money, 0) income, " +
					"          DECODE (TYPE, '지출', money, 0) expense " +
					"     FROM moneybook " +
					" ORDER BY no ";			
			
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			MoneybookVo e=null;
			int tot=0;
			while(rs.next()){
				e = new MoneybookVo();
				e.setNo(rs.getInt("no"));
				e.setType(rs.getString("type"));
				e.setIndate(rs.getString("indate"));
				e.setContent(rs.getString("content"));
				e.setIncome(rs.getInt("income"));
				e.setExpense(rs.getInt("expense"));
				tot+=e.getIncome()-e.getExpense();
				e.setRest(tot);
				list.add(e);
			}
			
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}	
/*수정 처리..
 1) autocommit을  false
 2) 수정 sql : update moneybook
                  set 컬럼명1 = 변경할 데이터1,
                                컬럼명2 = 변경할 데이터2
                 where 조건.
 3) pstmt에서 Statement처리. pstmt=con.prepareStatement(sql);                
 4) ? ==> mapping 처리
    pstmt.setString(1, @@@@ )
 5) pstmt.executeUpdate();
 6) commit();
 7) 예외처리 rollback등..   
 * */	

	public void updateMoneyBook(MoneybookDao update){
		try {
			setConn();
/*
update MONEYBOOK
set money = 3000,
    content='저녁식대'
where no = 4
*/
			con.setAutoCommit(false);
			String sql ="update MONEYBOOK \n"+
					    "   set money = ?, \n"+
					    "       content=? \n"+
					    "where no = ? ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, update.getMoney());
			pstmt.setString(2, update.getContent());
			pstmt.setInt(3, update.getNo());
			pstmt.executeUpdate();
			con.commit();
			System.out.println("수정완료!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				pstmt.close();
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
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A03_DatabasePrepare db = new A03_DatabasePrepare();
		//Emp search = new Emp();
		/*phone_number 123, last_name  K*/		
		//search.setPhoneNumber("");
		//search.setLastName("");
		//System.out.println("데이터 건수:"+db.getEmpList(search).size());
		/*
		name LIKE '%K%' 
		 AND phone LIKE '%127%' 
		 AND salary 
		 BETWEEN 1000 AND 5000; */
//		EmpVo search=new EmpVo();
//		search.setName("K");
//		search.setPhone("127");
//		search.setMinSal(1000);
//		search.setMaxSal(5000);
//		ArrayList<EmpVo> list=db.getEmpList2(search);
//		System.out.println("데이터 건수"+list.size());
//		for(EmpVo vo:list){
//			System.out.print(vo.getId()+"\t");
//			System.out.print(vo.getName()+"\t");
//			System.out.print(vo.getEmail()+"\t");
//			System.out.print(vo.getPhone()+"\t");
//			System.out.print(vo.getSalary()+"\t");
//			System.out.print(vo.getEnhance()+"\t");
//			System.out.print(vo.getTot()+"\n");
//		}
		//'MES가 뜻하는 바는 무엇인가?'
		// 'Manufacturing Execution System Shop Floor'
//		QuestDao insObj = new QuestDao();
//		insObj.setContent("MES가 뜻하는 바는 무엇인가?");
//		insObj.setAnswer("Manufacturing Execution System");
//		db.insertQuest(insObj);
//		MoneybookDao insdao=new MoneybookDao();
//		insdao.setType("지출");
//		insdao.setContent("식대");
//		insdao.setMoney(5000);
//		db.insMoneyBook(insdao);
		//System.out.println(db.getMoneyBookList().size());
//		  MoneybookDao uptDao = new MoneybookDao();
//		  uptDao.setNo(3);
//		  uptDao.setContent("택시비");
//		  uptDao.setMoney(12000);
//		  db.updateMoneyBook(uptDao);		
		QuestDao update = new QuestDao();
		update.setNo(10002);
		update.setContent("#제조에서 PLM쓰이는 의미는?");
		update.setAnswer("#product life cycle제품 수명주기 관리");
		//db.updateQuest(update);
		db.deleteQuest(update);
		for(QuestDao dao:db.getQuestList()){
			System.out.print(dao.getNo()+"\t");
			System.out.print(dao.getContent()+"\t");
			System.out.print(dao.getAnswer()+"\n");

		}
		
		
//		for(MoneybookVo vo:db.getMoneyBookList()){
//			System.out.print(vo.getNo()+"\t");
//			System.out.print(vo.getType()+"\t");
//			System.out.print(vo.getIndate()+"\t");
//			System.out.print(vo.getContent()+"\t");
//			System.out.print(vo.getIncome()+"\t");
//			System.out.print(vo.getExpense()+"\t");
//			System.out.print(vo.getRest()+"\n");
//		}
//	 1 세뱃돈 120000	

		
	}

}
/*
CREATE TABLE MONEYBOOK
(
   NO        NUMBER,
   INDATE    DATE,
   TYPE      VARCHAR2 (6),
   CONTENT   VARCHAR2 (200),
   MONEY     NUMBER
)
NOCACHE
LOGGING;
CREATE SEQUENCE MBSEQ START WITH 21
                      INCREMENT BY 1
                      MAXVALUE 9999999999999999999999999999
                      NOMINVALUE
                      NOORDER
                      NOCYCLE
                      CACHE 20;
 * */
