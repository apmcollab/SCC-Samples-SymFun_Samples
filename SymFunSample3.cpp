#include <iostream>
#include <cmath>
#include <cstdio>
#include <string>
using namespace std;

#include "SymFun.h"
//
//######################################################################
//
// SCC::SymFun Test Program #3
//
// This program demonstrates the creation of an SCC::SymFun instance that
// implements and then evaluates f(x,y) = 2*x*y + sin(x)
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


    //
    // Demonstrate how to capture an anonymous function reference
    // to the SymFun instance
    //

    std::function<double(double,double )> f_Ref = f.getEvaluationPtr2d();

    cout << "The value of the function at (x,y) = (3.14,1.0) when f is  " << endl;
    cout << "accessed via an anonymous function  : ";
    cout << f_Ref(3.14,1.0) << endl << endl;

    printf("XXXX Execution Complete XXXXX\n");
    return 0;
}

  
