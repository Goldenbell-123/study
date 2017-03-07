// 배가 위치한방
var location1 = 3;
var location2 = 4;
var location3 = 5;


var guess; // 추측값
var hits = 0; // 명중 횟수
var guesses = 0; // 추측한 횟수 저장

var isSunk = false; // 격침 상태 가라앉았는지 여부

while(isSunk==false){
  guess=prompt("준비,조준,발사! (0에서 6까지 중 추측한 숫자를 입력하세요):");
  if(guess< 0|| guess>6 ||guess==""){
    alert("0 ~ 6까지의 숫자를 입력하세요.");

  }else{
    guesses++;
    if(guess==location1|| guess==location2 || guess==location3){
      hits++;
        alert(hits+"회 명중!")
      if(hits==3){
        isSunk = true;
        alert("전함 침몰")
      }
    }else{
      alert("도탄되었습니다!!")
    }
  }
}
var stats = "발사된 미사일 :"+guesses + "\n명중률 :" +(3/guesses)*100+"%";
alert(stats);
