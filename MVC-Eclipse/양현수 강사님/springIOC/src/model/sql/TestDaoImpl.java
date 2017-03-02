package model.sql;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.vo.TestVO;

@Repository("dao")
public class TestDaoImpl implements TestDao{

	
	@Autowired
	private SqlSession session;
	public TestDaoImpl(){
		
	}
	
	@Override
	public TestVO loginRow(TestVO obj) {
		System.out.println("Dao loginRow 디버그");
		System.out.println("Dao id :"+obj.getId());
		System.out.println("Dao pwd :"+obj.getPwd());
		
		return session.selectOne("org.home.user.login", obj);
	}
	
	@Override	
	public int insertRow(TestVO obj){
		System.out.println("Dao insertRow 디버그");
		System.out.println("Dao id :"+obj.getId());
		System.out.println("Dao pwd :"+obj.getPwd());
		System.out.println("Dao Name :"+obj.getName());
		
		return session.insert("org.home.user.insert", obj);
	}

	@Override
	public int updateRow(TestVO obj) {
		System.out.println("Dao updateRow 디버그");
		
		return session.update("org.home.user.update", obj);
	}

	@Override
	public int deleteRow(String id) {
		System.out.println("Dao deleteRow 디버그");
		
		return session.delete("org.home.user.delete", id);
	}

	@Override
	public List<TestVO> selectAllRow() {
		System.out.println("Dao selectAllRow 디버그");
		
		return session.selectList("org.home.user.selectAll");
	}
	
	

}


