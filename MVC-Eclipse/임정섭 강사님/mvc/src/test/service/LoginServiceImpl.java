package test.service;

import test.model.sql.LoginDaoImpl;
import user.model.vo.UserVO;

public class LoginServiceImpl {
	private LoginDaoImpl dao;
	
	public LoginServiceImpl(){
		dao = new LoginDaoImpl();
	}
	
	
	public UserVO login(UserVO user){
		System.out.println("service login");
		
		UserVO result = dao.loginRow(user);
		
		return result;
	}
	
	public int join(UserVO user){
		System.out.println("service join");
		
		int result= dao.joinRow(user);
		
		return result;
	}

}
