#include <iostream>
#include <string>


using namespace std;


int Enumsgg()
{

	enum Item
	{
		Coin, Key, Sanddollar
	};
	Item itemInHand;


	int itemName;
	cout << "0,1,2 �� �� 1 : ";
	cin >> itemName;

	itemInHand = (Item)(itemName);

	if (itemInHand == Key)
	{
		cout << "������ �Ӹ� �κп� ���ڸӸ��� �ֽ��ϴ�." << endl;
		cout << "���踦 ����Ͽ� ��� �濡 �����ϴ�." << endl;
	}
	else if (itemInHand == Coin)
	{
		cout << "�� ������ �콼 ��� ���Դϴ�. ġ���� �԰� �ִ� ������ �׷��� �ֽ��ϴ�." << endl;
		cout << "�� ������ ����Ͽ� ��� ������ �� �� �ֽ��ϴ�." << endl;
	}
	else if (itemInHand == Sanddollar)
	{
		cout << "sanddollor���� ���� ���� �ֽ��ϴ�." << endl;
		cout << "�̰����� �ٸ� ���ǰ� ��ȯ�� �� �ֽ��ϴ�." << endl;

	}

	return 0;
	system("pause");
}