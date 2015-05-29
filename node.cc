#include "node.h"

Node::Node()
{

}
void Node::whatever(int iwhat) 
{ 
	std::cout << "whatever " << iwhat << std::endl; 
}
void Node::whatever(const std::string& iwhat) 
{ 
	std::cout << "whatever " << iwhat << std::endl; 
}
