package com.web.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDaoImpl implements HomeDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertRow(HomeVO obj) {
		return session.insert("org.test.mapper.insert",obj);
	}

	@Override
	public int updateRow(HomeVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRow(HomeVO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HomeVO selectRow() {
		System.out.println("Dao selectRow");
		return null;
	}

	@Override
	public ArrayList<HomeVO> selectRow(HomeVO obj) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
