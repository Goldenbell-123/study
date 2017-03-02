package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.sql.TestDao;
import model.vo.TestVO;


@Service("service")
public class TestServiceImpl implements TestService{
	
	@Resource(name="dao")
	private TestDao dao;
	
	public TestServiceImpl(){
		
	}
	@Override
	public TestVO login(TestVO obj) {
		System.out.println("servcie 디버그");
		
		return dao.loginRow(obj);
	}
	
	@Override
	public int insert(TestVO obj){
		System.out.println("servcie insert 디버그");
		System.out.println("servcie id :"+obj.getId());
		System.out.println("servcie pwd :"+obj.getPwd());
		System.out.println("servcie Name :"+obj.getName());
		
		return dao.insertRow(obj);
	}
	
	@Override
	public int update(TestVO obj) {
		System.out.println("servcie update 디버그");
		return dao.updateRow(obj);
	}
	@Override
	public int delete(String id) {
		System.out.println("servcie delete 디버그");
		return dao.deleteRow(id);
	}
	@Override
	public List<TestVO> selectAll() {
		System.out.println("servcie selectAll 디버그");		
		return dao.selectAllRow();
	}
	

}
