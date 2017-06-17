#include <iostream>

void getinout() 
{
	std::cout << "Hello, world" << std::endl;
	//std는 기본 namespace
	//:: 범위확인
	// >>,<<  비트연산자 왼쪽시프트,오른쪽시프트
	// endl 개행(newline) \n과 같음
	char name[10];

	std::cin >> name;
	std::cout << "My name is" << name << std::endl;
}