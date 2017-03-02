package com.web.spring;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.model.HomeDao;
import com.web.model.HomeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataSourceTest {

	@Autowired
	private HomeDao dao;
	
	@Test
	public void testConnection() throws Exception{
		int flag = dao.insertRow(new HomeVO("이건","되나","왜그러지"));
		System.out.println("flag : "+flag);
	}
	
}


