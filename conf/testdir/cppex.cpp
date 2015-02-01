#include<iostream>
using namespace std;
#include <string.h>

class programming
{
		private:
				int variable;

		public:

				void input_value()
				{
						cout << "In function input_value, Enter an integer\n";
						cin >> variable;
				}

				void output_value()
				{
						cout << "Variable entered is ";
						cout << variable << "\n";
				}
};

int main(void)
{
		programming object;

		object.input_value();
		object.output_value();

		//object.variable;  Will produce an error because variable is private

		return 0;
}
