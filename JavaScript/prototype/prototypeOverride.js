// override stop into object

var obj={ caoution : 'something to be cautious!!!!!'};

// 프로토 타입에 연결된 생성자 함수
obj.prototype.constructor= obj;

// 객체가 해당 속성을 직접소유하는지 알려줌
obj.prototype.hasOwnProperty('속성');

// 어떤 객체가 다른 객체의 프로토타입인지 알아낼 수 있는 메서드
obj.prototype.isPrototypeOf('객체 이름');

// 객체의 속성들을 반복할 떄 이속성에 접근할수 있는지 확인
obj.prototpye.propertyIsEnumerable('속성');



// override possible
// 가능
obj.prototype.toString();

//객체를 문자열로 변환.. 객체를 지역화(국가/언어)된 문자열로 변환
obj.prototpye.toLocaleString();

//객체를 반환 원하는값으로 오버라이드 가능
obj.prototype.valueOf();
