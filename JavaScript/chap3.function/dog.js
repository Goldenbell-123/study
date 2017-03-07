//function: 키워드
// bar(): 함수명
//parameter : name,weight
// {}: 본체
function bark(name, weight){
  if(weight>20){
    console.log(name + "는 월월 짖습니다.");
  }else{
    console.log(name + "는 멍멍 짖습니다.");
  }
}// 파라미터를 통해서 함수를 한번 정의하지만

//인자를 넣어서 함수를 여러번 호출한다.
bark('해피',23);
bark('쫑',13);
bark('워리',53);
bark('메리',17);
// 파라미터와 인자는 의미가 다르다.
