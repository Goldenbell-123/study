// String.prototype.palindrome = function(){
//   'use strict';
//   var len = this.length-1;
//   for (var i = 0; i<len; i++){
//     if (this.charAt(i)!== this.charAt(len-i)){
//       return false;
//     }
//     if (i === len-i){
//       return true;
//     }
//   }
//   return true;
// }


// 글자의 순서를(split 하나하나 쪼갬) 역으로 재배열(reverse) 하여 글자를 합침(join)
String.prototype.palindrome = function(){
  'use strict';
  var r = this.split('').reverse().join('');
  return( r === this.valueOf());
};


var phrases = ['eve', 'kayak', 'mom', 'wow', '팰린드롬'];

for (var i = 0; i < phrases.length; i ++){
  var phrase = phrases[i];
  if(phrase.palindrome()){
    console.log("'" + phrase + "' 은 펠린드롬입니다.");
  } else {
    console.log("'" + phrase + "' 은 펠린드롬이 아닙니다.");
  }
}
