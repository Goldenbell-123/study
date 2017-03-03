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
