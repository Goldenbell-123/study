package student;

import java.util.ArrayList;

public class StudentMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<Student> list= new ArrayList<Student>();
		ArrayList<Human> list2= new ArrayList<Human>();
		

		list2.add(new Human("홍길동",15,171,81));
		list2.add(new Human("한사람",13,183,72));
		list2.add(new Human("임꺽정",16,175,65));
		
		list.add(new Student("홍길동",15,171,81,"201101","영문"));
		list.add(new Student("한사람",13,183,72,"201102","건축"));
		list.add(new Student("임꺽정",16,175,65,"201103","무용"));


		System.out.println("---------------------------");
		for(Student b : list){
			System.out.println(b.printInformation());
		}
		System.out.println("---------------------------");
		for(Human a: list2 ){
			System.out.println(a.printInformation());
		}
	}

}
