package com.acorn.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.acorn.model.vo.LoginDTO;
import com.acorn.model.vo.UserVO;
import com.acorn.user.model.sql.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userDao")
	private UserDao dao;
	
	@Override
	public UserVO login(LoginDTO obj) {
		System.out.println("service login");
		return dao.loginRow(obj);
	}
	
	
}
