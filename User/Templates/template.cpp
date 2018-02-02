#include <iostream>
#include <stdio.h>
using namespace std;

class Class1
{
	public:
		Class1();
		~Class1();
};

Class1::Class1()
{
	cout << "Class1 Constructor" << endl;
}

Class1::~Class1()
{
	cout << "Class1 Destructor" << endl;
}

int main(int argc, char *argv[])
{
	printf("Hello, world! press any key to exit!\n");
	Class1 x;
	char c;
	cin >> c;
	return 0;
}
