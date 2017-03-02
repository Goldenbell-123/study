package ajax.customer.service;

import java.util.ArrayList;

import ajax.customer.model.sql.CustomerDaoImpl;
import ajax.customer.vo.CustomerVO;

public class CustomerServiceImpl {
	private CustomerDaoImpl dao;
	
	public CustomerServiceImpl(){
		dao= new CustomerDaoImpl(); 
	}
	
	public ArrayList<CustomerVO> cusList(){
		System.out.println("CustomerServiceImpl 접속...");
		ArrayList<CustomerVO> result= dao.cusListRow();
		return result;
	}
}
