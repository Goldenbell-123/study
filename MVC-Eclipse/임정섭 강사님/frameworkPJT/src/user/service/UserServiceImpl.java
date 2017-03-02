package user.service;

import user.model.sql.UserDaoImpl;
import user.model.vo.UserVO;

public class UserServiceImpl {
	private UserDaoImpl dao;
	
	public  UserServiceImpl(){
		dao= new UserDaoImpl();
	}
	
	public UserVO login(UserVO obj){
		System.out.println("service login");
		
		UserVO result = dao.loginRow(obj);
		
		return result;
	}
	
	public UserVO logCheck(String obj){
		System.out.println("service check");
		
		UserVO result = dao.logCheckRow(obj);
		
		return result;
	}
	
	public int join(UserVO obj){
		System.out.println("service join");
		int result = dao.joinRow(obj);
		return result;
	}
}
