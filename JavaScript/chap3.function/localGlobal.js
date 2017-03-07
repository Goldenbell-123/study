//전역 변수(Global scope)
var avatar;
var levelThreshold = 1000;

//points : 지역변수
function getScore(points){
  //지역 변수(Local scope)
  var score;
  var i = 0;

  while (i<levelThreshold) {
      //여기에 코드가 들어갑니다.
      i ++;
  }
  retrun score;
}



//지역변수와 전역변수의 범위
var avatar ="아바타";
var skill = 1.0;
var pointsPerlevel = 1000;
var userPoints = 2008;

function getAvatar(points){
  //getAvatar 지역변수: level, points
  // 전역변수 : pointsPerlevel
  var level = points / pointsPerlevel;

  if(level == 0){
    return "테디 베어"
  }
}

function updatePoints(bonus, newPoints){

}

//전역변수만 접근할 수있다. 지역변수는 사용할 수 없음
userPoints = updatePoints(2,100);
avatar = getAvatar(2112);


//전역변수는 페이지가 열려 있는 동안 살아 있다.
// 페이지를 다시 로딩하면? 기존에 있던 전역변수는 다시 새로 만들어진다.
// 지역변수는 함수가 종료되면 사라진다.
//함수가 종료될때 반환은 가능하다.
