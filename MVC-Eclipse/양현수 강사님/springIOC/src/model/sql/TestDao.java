package model.sql;

import java.util.List;

import model.vo.TestVO;

public interface TestDao {
	
	public TestVO loginRow(TestVO obj);
	public int insertRow(TestVO obj);
	public int updateRow(TestVO obj);
	public int deleteRow(String id);
	public List<TestVO> selectAllRow();
}
