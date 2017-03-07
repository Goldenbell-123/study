var radius = 5;
var area = circleArea(radius);
alert(area);

function circleArea(r){
  var a = Math.PI * r * r ;
  return a;
}

// 사실 자바스크립트는 웹페이지를 처리할 때 두단계로 처리한다.
// 첫번째, 모든 함수의 정의를 읽어들인다.
// 두번째, ㅋ드를 실행하기 시작한다. 따라서 함수를 어디에 놓든 상관없다.
