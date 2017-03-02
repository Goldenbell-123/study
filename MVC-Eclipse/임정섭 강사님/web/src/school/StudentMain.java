package school;

public class StudentMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name = null;			// 이름
		int age = 0; 				// 나이
		
		
		
		// 생성자를 배열로 만들 경우는 생성자의 사이즈를 미리 정해줘야한다.
		Student studentArray []= new Student[3];
		
//		생성자의 정보들을 객체로 생성한다.
		Student a = new Student("홍길동",21,175,72);
		Student b = new Student("수지",27,172,43);
		Student c = new Student("지드래곤",29,161,55);
		
//		각 배열의 index에 맞게 넣어줘야된다. 직접...
		studentArray[0]=a;
		studentArray[1]=b;
		studentArray[2]=c;
		
//		for문을 돌려보자.(Student 배열 안에 값 출력)
		System.out.println("name\t나이\t신장\t몸무게");
		for(int idx=0;idx<studentArray.length;idx++){
			System.out.println(
				studentArray[idx].getName()+"\t"+
				studentArray[idx].getAge()+"\t"+
				studentArray[idx].getHeight()+"\t"+
				studentArray[idx].getWeight());
		}
		double namesum=0;
		double heightsum=0;
		double weightsum=0;
		double nameavg=0;
		double heightavg=0;
		double weightavg=0;
		for(int idx=0;idx<studentArray.length;idx++){
			namesum+=studentArray[idx].getAge();
			heightsum+=studentArray[idx].getHeight();
			weightsum+=studentArray[idx].getWeight();
			
		}
		nameavg+=Math.round(namesum/3*100d)/100d;
		heightavg+=Math.round(heightsum/3*100d)/100d;
		weightavg+=Math.round(weightsum/3*100d)/100d;
		System.out.println("===============");
		System.out.println("나이의 평균 : "+nameavg);
		System.out.println("신장의 평균 : "+heightavg);
		System.out.println("몸무게의 평균 : "+weightavg);
		
	}
	
	
	/**
	 * test
	 * 테스트 메서드 입니다.
	 * @author 김지성 (2017.02.08)
	 * @param std
	 * @return Student 타입 리턴
	 */
	public Student test(Student std){
		return std;
	}

}
