var canvas = document.getElementById('canvas'),
    ctx = canvas.getContext('2d');
    font_height = 15,
    margin = 100,
    handTrunc = canvas.width/25,
    hourHand = canvas.width/10,
    numspace = 20,
    radius = canvas.width/2 - margin,
    handradius = radius + numspace;

//함수=====================================================

// 시계 틀
function drawCircle(){
  ctx.beginPath();
  ctx.arc(canvas.width/2, canvas.height/2, radius, 0, Math.PI*2, true);
  ctx.stroke();
}

// 숫자 표시
function drawNumeral(){
  var numerals = [1,2,3,4,5,6,7,8,9,10,11,12];
  angle = 0,
  numeralWidth = 0;
  numerals.forEach(function (numeral){
    angle = Math.PI/6 * (numeral -3);
    numeralwidth = ctx.measureText(numeral).width;
    ctx.fillText(numeral,
      canvas.width/2 + Math.cos(angle)*(handradius) - numeralwidth/2,
      canvas.height/2 + Math.sin(angle)*(handradius) - font_height/3)
  });
}

// 센터
function drawCenter(){
  ctx.beginPath();
  ctx.arc(canvas.width/2, canvas.height/2 ,5, 0 , Math.PI*2,true);
  ctx.fill();
}

//초침,분침,시침 길이와  방향(각도)
function drawHand(loc, isHour){
  var angle = (Math.PI*2)*(loc/60) - Math.PI/2,
      HandRadius = isHour ? radius - handTrunc - hourHand
                          : radius - handTrunc;
  ctx.moveTo(canvas.width/2, canvas.height/2);
  ctx.lineTo(canvas.width/2 + Math.cos(angle)*HandRadius,
                canvas.height/2 + Math.sin(angle)*HandRadius);
  ctx.stroke();
}

//침들의 관계 설정
function drawHands(){
  var date = new Date,
      hour = date.getHours();

  hour = hour > 12 ? hour - 12 : hour;

  drawHand(hour*5 + (date.getMinutes()/60)*5, true);
  drawHand(date.getMinutes(),false);
  drawHand(date.getSeconds(),false);
}

function drawClock(){
  ctx.clearRect(0,0,canvas.width,canvas.height);
  drawCircle();
  drawCenter();
  drawHands();
  drawNumeral();
}

//초기화

ctx.font = font_height + 'px Arial';
loop = setInterval(drawClock, 1000);
