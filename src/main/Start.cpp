#include <iostream>
#include "../lib/libjson.h"
#include "../lib/JSONOptions.h"
#include "../lib/JSONNode.h"
#include "../lib/JSONDefs.h"
#include "../BasicParser.h"


int main(const int argc, const char * argv[])
{
	std::string workNum = argv[1];
	std::string json = argv[2];

	std::cout << "workNum:" << workNum << " json:" << json << std::endl;
	std::cout << std::endl;
	
	BasicParser basicParser;
	JSONNode jsonNodeParser = libjson::parse(json);
	basicParser.parseJSON(jsonNodeParser);

//	JSONNode jsonNodeWrite(JSON_NODE);
//	jsonNodeWrite.push_back(JSONNode("String Node", "String Value"));
//	jsonNodeWrite.push_back(JSONNode("Integer Node", 42));
//	jsonNodeWrite.push_back(JSONNode("Floating Point Node", 3.14));
//	jsonNodeWrite.push_back(JSONNode("Boolean Node", true));

	JSONNode jsonNodeWrite(JSON_NODE);
	jsonNodeWrite.push_back(JSONNode("RootA", "Value in parent node"));
	JSONNode jsonNodeWriteCjild(JSON_NODE);
	jsonNodeWriteCjild.set_name("ChildNode");
	jsonNodeWriteCjild.push_back(JSONNode("ChildA", "String Value"));
	jsonNodeWriteCjild.push_back(JSONNode("ChildB", 42));
	jsonNodeWrite.push_back(jsonNodeWriteCjild);

//	std::string format = jsonNodeWrite.write_formatted();
//	std::cout << format << std::endl;
//	std::cout << std::endl;

	std::string result = jsonNodeWrite.write();
	std::cout << "RESULT::\n" << result << std::endl;

	return 0;
}
