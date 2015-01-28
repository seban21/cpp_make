#ifndef BASICPARSER_H_
#define BASICPARSER_H_


#include <iostream>

#include "lib/libjson.h"
#include "lib/JSONOptions.h"
#include "lib/JSONNode.h"
#include "lib/JSONDefs.h"


class BasicParser
{
public:
	BasicParser();
	~BasicParser();

public:
	void parseJSON(const JSONNode & n);

};


#endif
