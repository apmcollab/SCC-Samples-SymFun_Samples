## SymFun_Samples
This repository contains a collection of samples demonstrating the use of the SCC:SymFun class.

The source necessary for the creation of a library containing the components required to use   SCC::SymFun is contained in the submodule SCC/SymFun. If cloning this repository didn't automatically clone this submodule, then one will need to execute 

<code>git submodule init </code>

<code>git submodule update </code>
 

to initialize the repositories SCC/SymFun and SCC/MakeScripts. 

**For Linux systems**

On a typical Linux system with a reasonably recent version of g++ installed, to build both the library and sample program executables, one need only execute 

</code>make release<code> 

or

</code>make debug<code> 

**For Windows Systems**

The files that are not \*.h or \*.cpp in SCC/SymFun are files used for working with SCC::SymFun on Linux systems.These files should be ignored when using the SCC::SymFun class on Windows systems. 

If you are willing to recompile all of the files in SCC/SymFun with each build of your program, you can just add all of the   \*.h and \*.cpp files in SCC/SymFun to a Visual Studio solution that uses the SCC::SymFun class. In addition to specifying these files, you will need to specify in your solution settings an additional include path that is the location of the directory SCC/SymFun (this directory contains the required \*.h files).  

Alternately, one can create a library (SymFunLib) in which all of the *.cpp files in SCC/SymFun are compiled. Once this library has been created, to use SCC::SymFun instances, one will need to specify an additional include path that is the location of the directory SCC/SymFun as well as the library name and path to the library that you've created.  


### Prerequisites

c++11

### Versioning

Release : 19.01.14

### Authors

Chris Anderson

### License

GPLv3  For a copy of the GNU General Public License see <http://www.gnu.org/licenses/>.

### Acknowledgements
















