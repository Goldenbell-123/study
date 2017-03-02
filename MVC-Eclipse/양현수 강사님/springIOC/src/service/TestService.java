package service;

import java.util.List;

import model.vo.TestVO;

public interface TestService {

	public TestVO login(TestVO obj);
	public int insert(TestVO obj);
	public int update(TestVO obj);
	public int delete(String id);
	public List<TestVO> selectAll();
}
