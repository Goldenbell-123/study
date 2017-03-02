package com.acorn.user.model.sql;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.model.vo.LoginDTO;
import com.acorn.model.vo.UserVO;

@Repository("userDao")
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public UserVO loginRow(LoginDTO obj) {
		System.out.println("Dao loginRow");
		
		return session.selectOne("org.user.mapper.login",obj);
	}

	
}
