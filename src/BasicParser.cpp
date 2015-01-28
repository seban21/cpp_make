#include "BasicParser.h"


BasicParser::BasicParser()
{}


BasicParser::~BasicParser()
{}


void BasicParser::parseJSON(const JSONNode & n)
{
	JSONNode::const_iterator i = n.begin();
	while (i != n.end())
	{
		// recursively call ourselves to dig deeper into the tree
		if (i -> type() == JSON_ARRAY || i -> type() == JSON_NODE){
			BasicParser::parseJSON(*i);
		}

		// get the node name and value as a string
		std::string node_name = i -> name();

		// find out where to store the values
		if (node_name == "RootA"){
			std::string rootA = i -> as_string();
			std::cout << rootA << std::endl;
		}
		else if (node_name == "ChildA"){
			std::string childA = i -> as_string();
			std::cout << childA << std::endl;
		}
		else if (node_name == "ChildB")
		{
			int childB = i -> as_int();
			std::cout << childB << std::endl;
		}
		//increment the iterator
		++i;
	}
}
