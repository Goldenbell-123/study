function Dog(name, breed, weight){
  'use strict';
  this.name = name;
  this.breed = breed;
  this.weight = weight;
}

Dog.prototype.species ='개과';

Dog.prototype.bark = function(){
  'use strict';
    if(this.weight > 25){
      console.log(this.name + '는 월월 짖어요!!');
    }else{
      console.log(this.name + '는 깽깽 짖어요!!');
    }
};

Dog.prototype.run = function(){
'use strict';
  console.log('달리기');
};

Dog.prototype.wag= function(){
'use strict';
  console.log('꼬리흔들기');
};



var fido = new Dog('피도', '잡종', 38);
var fluffy = new Dog('플러피','푸들', 30);
var spot= new Dog('스포트', '치와와', 10);



spot.bark = function(){
  'use strict';
  console.log(this.name+'는 멍멍 짖어요!');
};


fido.bark();
fido.run();
fido.wag();

fluffy.bark();
fluffy.run();
fluffy.wag();

spot.bark();
spot.run();
spot.wag();

var barnaby = new Dog('바나비', '바셋 하운드', 55);

Dog.prototype.sit = function(){
  'use strict';
  console.log(this.name + '가 앉아 있습니다.');
};

barnaby.sit();

Dog.prototype.sitting = false;

Dog.prototype.sit = function(){
  'use strict';
  if(this.sitting){
    this.sitting = false;
    console.log(this.name + '는 이미 앉아 있습니다');
    console.log(this.name + '는 이제 일어섭니다.');

  }else{
    this.sitting= true;
    console.log(this.name + '가 앉습니다.');
  }
};

barnaby.sit();
barnaby.sit();

spot.sit();
spot.sit();
//hasOwnProperty 객체가 상속(오버라이드) 될 때 생기는 속성메서드
console.log('hasOwnProperty : '+spot.hasOwnProperty('sitting'));




//////show dog 만들기

var adog = new Dog();

function ShowDog(name, breed, weight, handler){
  'use strict';
  Dog.call(this, name,  breed, weight);
  this.handlert= handler;
}

ShowDog.prototype = new Dog();
ShowDog.prototype.constructor = ShowDog;
ShowDog.prototype.league= '웹타운';

ShowDog.prototype.stack = function(){
  'use strict';
  console.log('차렷');

};

ShowDog.prototype.bait = function () {
  'use strict';
  console.log('간식');

};

ShowDog.prototype.gait = function(kind){
  'use strict';
  console.log(kind + '하는중');

};

ShowDog.prototype.groom = function(){
  'use strict';
  console.log('빗질');
};


var scotty = new ShowDog('스카티', '스코틀랜드 테리어', 15, '쿠키');
var beatrice = new ShowDog('베트리아체','포메리안', 5, '해밀튼');

console.log(scotty.league);
console.log(scotty.species);

scotty.stack();
scotty.bark();
beatrice.bark();
scotty.gait('걷기');
beatrice.groom();
