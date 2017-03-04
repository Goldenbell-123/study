function Robot(name, year, owner){
  'use strict';
  this.name = name;
  this.year = year;
  this.owner = owner;
}

Robot.prototype.maker = '오브젝트자러스';
Robot.prototype.errorMessage = '전체 시스템 작동 중';
Robot.prototype.reportError = function(){
  'use strict';
  console.log(this.name + ' 메세지 : '+ this.errorMessage);
};
Robot.prototype.spillWater =function(){
  'use strict';
  this.errorMessage = '회로가 합선된 것 같습니다!';
};

Robot.prototype.speak = function(){
  'use strict';
  console.log(this.name+'입니다. ' + '저의 주인은 '+ this.owner +
              '입니다.');
};

Robot.prototype.makeCoffee = function(){
  'use strict';
  console.log('커피를 만듭니다.');
};

Robot.prototype.blinkLights = function(){
  'use strict';
  console.log('불을 켭니다.');
};


var robby = new Robot('robby',1956,'닥터 뫼비우스');
var rosie = new Robot('rosie',1962,'조지 제트슨');

robby.onOffSwitch = true;
robby.makeCoffee = function(){
  'use strict';
  if(this.onOffSwitch){
    console.log('스타벅스에서 커피를 가져옵니다.');
  }else{
    console.log('작동을 멈춥니다.');
  }
};

rosie.cleanHouse = function(){
  'use strict';
  console.log('집안 청소를 합니다.');
};

console.log(robby.name + '는 '+ robby.maker + '에 의해 ' + robby.year +
            '년에 생산되었고, ' + robby.owner + '가 소유하고 있습니다.');

robby.makeCoffee();
robby.blinkLights();
console.log(rosie.name + '는 ' + rosie.maker + '에 의해 ' + rosie.year +
            '년에 생산되었고, '+ rosie.owner + '가 소유하고 있습니다.');
rosie.cleanHouse();



rosie.reportError();
robby.reportError();
robby.spillWater();
rosie.reportError();
robby.reportError();

console.log(robby.hasOwnProperty('errorMessage'));
console.log(rosie.hasOwnProperty('errorMessage'));


//객체생성 당시 내부 메소드 toString(), hasOwnProperty();
console.log(robby.toString());
console.log(rosie.toString());

//object 로 나오기 떄문에 적당하게 바꿔주는게 필요.



//연습문제 SpaceRobot

function SpaceRobot(name, year, owner, homePlanet){
  'use strict';
  Robot.call(this, name, year, owner);
  this.homePlanet = homePlanet;
}

SpaceRobot.prototype = new Robot();

SpaceRobot.prototype.speak = function(){
'use strict';
  alert(this.name + ' : 제가 의견을 말해도 된다면 ...');

};

SpaceRobot.prototype.pilot = function(){
'use strict';
  alert(this.name + ' : 추진체요? 그게 중요한가요?');
};

var c3po = new SpaceRobot('C3PO', 1977, '루크','타투인');

c3po.speak();
c3po.pilot();
console.log(c3po.name + '는' + c3po.maker + '가 만들었습니다.');

var simon = new SpaceRobot('사이몬', 2009, '칼라 다이아나', '칼라 다이아나');
simon.makeCoffee();
simon.blinkLights();
simon.speak();
