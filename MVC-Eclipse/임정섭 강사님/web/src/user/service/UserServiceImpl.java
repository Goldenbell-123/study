package user.service;

import user.model.sql.UserDaoImpl;
import user.model.vo.UserVo;

public class UserServiceImpl {

	public UserVo login(UserVo user){
		System.out.println("service login");
		
		UserDaoImpl dao= new UserDaoImpl();
		UserVo result = dao.loginRow(user);
			
		return result;
	}
	
	public int join(UserVo obj){
		System.out.println("Service join");
		int result = 0;
		
		UserDaoImpl dao = new UserDaoImpl();
		result =dao.insertRow(obj);
		// 구현부탁립니다.
		return result;
	}
}
