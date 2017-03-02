package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.model.HomeDao;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired // 이해를 돕자면, new HomeDaoImpl 하는 것처럼..
	private HomeDao dao;
	
	
	@Override
	public void lunch(){
		System.out.println("맛점");
		dao.selectRow();
	}
	
	
	
	
}
