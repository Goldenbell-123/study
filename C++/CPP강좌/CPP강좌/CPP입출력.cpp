#include <iostream>

void getinout() 
{
	std::cout << "Hello, world" << std::endl;
	//std�� �⺻ namespace
	//:: ����Ȯ��
	// >>,<<  ��Ʈ������ ���ʽ���Ʈ,�����ʽ���Ʈ
	// endl ����(newline) \n�� ����
	char name[10];

	std::cin >> name;
	std::cout << "My name is" << name << std::endl;
}