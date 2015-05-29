#include <iostream>
#include <string>
using namespace std;
class Node
{
public:
	Node();
	void whatever(int);
	void whatever(const std::string &);
	static const int INF=42;
};