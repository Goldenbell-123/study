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
	cout << "0,1,2 중 택 1 : ";
	cin >> itemName;

	itemInHand = (Item)(itemName);

	if (itemInHand == Key)
	{
		cout << "열쇠의 머리 부분에 사자머리가 있습니다." << endl;
		cout << "열쇠를 사용하여 비밀 방에 들어갔습니다." << endl;
	}
	else if (itemInHand == Coin)
	{
		cout << "이 동전은 녹슨 놋쇠 색입니다. 치마를 입고 있는 여인이 그려져 있습니다." << endl;
		cout << "이 동전을 사용하여 몇가지 물건을 살 수 있습니다." << endl;
	}
	else if (itemInHand == Sanddollar)
	{
		cout << "sanddollor에는 작은 별이 있습니다." << endl;
		cout << "이것으로 다른 물건과 교환할 수 있습니다." << endl;

	}

	return 0;
	system("pause");
}