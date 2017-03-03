function Game(){
  'use strict';
  this.level = 0;
}

Game.prototype.play = function(){
 'use strict';
 // 게임을 진행한다.

  this.level++;
  console.log('레벨 ' + this.level + ' 입니다.');
  this.unlock();
};

Game.prototype.unlock = function(){
  'use strict';
  if(this.level === 42){
    Robot.prototype.deployLaser = function(){
      console.log(this.name + '가 레이저를 발사해 이겼습니다.');
    };
  }
};


function Robot(name, year, owner){
  'use strict';
  this.name = name;
  this.year = year;
  this.owner = owner;
}

var game = new Game();
var robby = new Robot('로비',1956,'닥터 뫼비우스');
var rosie = new Robot('루시',1962,'조지 제트슨');

while (game.level < 42) {
   game.play();
}

robby.deployLaser();
rosie.deployLaser();
