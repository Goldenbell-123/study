package webprj.service;

import webprj.y01_vo.Customer;
import webprj.z01_dbcon.A04_CustomDBCon;

public class service01 {
	
	public Customer search(String pknock) {
		Customer c= new Customer();
	
		return c;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A04_CustomDBCon con = new A04_CustomDBCon();
		Customer c= new Customer();
			c.setPkno(Integer.parseInt());
	}
}

