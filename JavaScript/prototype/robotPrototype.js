function Robot(name, year, owner){
  'use strict';
  this.name = name;
  this.year = year;
  this.owner = owner;
}

Robot.prototype.maker = '오브젝트자러스';

Robot.prototype.speak = function(){
  'use strict';
  console.log(this.name+'입니다. ' + '저의 주인은 '+ this.owner +
              '입니다.');
};

Robot.prototype.makeCoffee = function(){
  'use strict';
  console.log('스타벅스에서 커피를 만듭니다.');
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
  console.log('커피를 가져옵니다.');
};

rosie.cleanHouse = function(){
  'use strict';
  console.log('집안 청소를 합니다.');
};

console.log(robby.name + '는'+ robby.maker + '에 의해' + robby.year +
            '년에 생산되었고,' + robby.owner + '가 소유하고 있습니다.');

robby.makeCoffee();
robby.blinkLights();
console.log(rosie.name + '는 ' + rosie.maker + '에 의해' + rosie.year +
            '년에 생산되었고, '+ rosie.owner + '가 소유하고 있습니다.');
rosie.cleanHouse();