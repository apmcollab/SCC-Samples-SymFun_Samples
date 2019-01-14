#include <iostream>
#include <cmath>
#include <cstdio>
#include <string>
using namespace std;

#include "SymFun.h"
#include "SymFunUtility.h"
//
//######################################################################
//
// SCC::SymFun Test Program #5
//
// This program demonstrates the creation of an SCC::SymFun instance that
// implements and then evaluates f(x,y) = 2*x*y + sin(x) and it's
// partial derivatives with respect to x and y.
//
//######################################################################
//
int main()
{
    vector<string>  V = {"x","y"};             // x,y = independent variables

    string functionString = "2*x*y + sin(x)";  // Specification of function

    SCC::SymFun f;

    // The SymFun instance is initialized within a try/catch block so
    // that errors in function specification can be captured.

    try
    {
    	f.initialize(V,functionString);
    }
    catch (const SCC::SymFunException& e)
    {
      cerr << e.what() << endl;;
      cerr << "XXXX Execution Terminated XXXXX" << endl;
      return 1;
    }

    cout << "The function specified : ";
    cout << f.getConstructorString()  << endl << endl;

    cout << "The value of the function at (x,y) = (3.14,1.0) is  ";
    cout << f(3.14,1.0) << endl << endl;


    // Create the partial derivatives of f(x,y)

    string diffVariable = "x";
    SCC::SymFunUtility symUtility;

    SCC::SymFun dfDx =  symUtility.differentiate(f,diffVariable);

    cout << "The partial derivative of f(x,y) with respect to x     : ";

    cout << dfDx.getConstructorString() << endl;


    diffVariable = "y";

    SCC::SymFun dfDy =  symUtility.differentiate(f,diffVariable);

    cout << "The partial derivative of f(x,y) with respect to y     : ";

    cout << dfDy.getConstructorString() << endl;

    diffVariable = "y";

    SCC::SymFun dfD2y =  symUtility.differentiate(dfDy,diffVariable);

    cout << "The partial derivative of df/dy(x,y) with respect to y : ";

    cout << dfD2y.getConstructorString() << endl;


    printf("XXXX Execution Complete XXXXX\n");
    return 0;
}

  
