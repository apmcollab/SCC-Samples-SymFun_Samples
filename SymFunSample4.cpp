#include <iostream>
#include <cmath>
#include <cstdio>
#include <string>
using namespace std;

#include "SymFun.h"
//
//######################################################################
//
// SCC::SymFun Test Program #4
//
//
//  This program creates and evaluates a SCC::SymFun instance that implements
//  a*x^2 + b*x + c, with a, b, c being symbolic constants. The function
//  is evaluated for two different sets of symbolic constant values as
//  an example of how the symbolic constant capability is utilized.
//
//
//
//######################################################################
//
int main()
{
    vector<string>  V       = {"x"};                   // x independent variable
    vector<string>  C       = {"a","b","c"};           // a,b,c symbolic constants
    vector<double>  Cvalues = {1.0,2.0,3.0};           // Initial specification of constant values

    string functionString = "a*x^2 + b*x + c ";  // Specification of function

    SCC::SymFun f;

    // The SymFun instance is initialized within a try/catch block so
    // that errors in function specification can be captured.

    try
    {
    	f.initialize(V,C,Cvalues,functionString);
    }
    catch (const SCC::SymFunException& e)
    {
      cerr << e.what() << endl;;
      cerr << "XXXX Execution Terminated XXXXX" << endl;
      return 1;
    }

    cout << "The function specified : ";
    cout << f.getConstructorString()  << endl;
    cout << "where " << endl;
    string constantName;

    for(int i = 0; i < (int)C.size(); i++)
    {
    	constantName = f.getConstantName(i);
    	cout << constantName << " = " << f.getConstantValue(constantName) << " : ";
    }
    cout << endl << endl;


    cout << "The value of the function at x = 1.0 is  ";
    cout << f(1.0) << endl << endl;

    // Reset the constants in the function, and re-evaluate

    f.setConstantValue("a",1.0);
    f.setConstantValue("b",1.0);
    f.setConstantValue("c",1.0);

    cout << "When " << endl;

	for(int i = 0; i < (int)C.size(); i++)
	{
	    constantName = f.getConstantName(i);
	    cout << constantName << " = " << f.getConstantValue(constantName) << " : ";
 	}
	cout << endl << endl;

	cout << "The value of the function at x = 1.0 is  ";
	cout << f(1.0) << endl << endl;


    printf("XXXX Execution Complete XXXXX\n");
    return 0;
}

  
