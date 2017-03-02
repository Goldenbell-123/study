package employee;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class CompanyMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		HashMap<Integer, Employee> map = new HashMap<Integer, Employee>();
		
		Secretary sec = new Secretary("Hilery",1,"secretary",800);
		Sales sale = new Sales("Clienten",2,"sales",1200);
		
		map.put(sec.getNumber(), sec);
		map.put(sale.getNumber(), sale);
		
		System.out.println("name\t\tdepartment\tsalary");
		System.out.println("-----------------------------------------");
		for (Map.Entry<Integer, Employee> tmp: map.entrySet()) {
			System.out.println(tmp.getValue().getName()+"  \t"+
								tmp.getValue().getDepartment()+"    \t"+
								tmp.getValue().getSalary());
			
		}

		
		
		sec.incentive(100);
		sale.incentive(100);
		
		System.out.println();
		System.out.println("인센티브 100 지급");
		System.out.println("name\t\tdepartment\tsalary\ttax");
		System.out.println("----------------------------------------------");
		for (Map.Entry<Integer, Employee> entry : map.entrySet()) {
			System.out.println(entry.getValue().getName()+"  \t"+
					entry.getValue().getDepartment()+"    \t"+
					entry.getValue().getSalary()+"\t"+
					entry.getValue().tax());
			
		}
		
		
		
		
	}

}
