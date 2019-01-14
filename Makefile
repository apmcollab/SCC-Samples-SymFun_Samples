#
# This is the "meta" makefile that builds the SymFun libary and all of 
# the SymFun samples by invoking their respective makescripts.
#
# Usage :
#
# make release                   === builds release versions of all executables
# make debug                     === builds debug versions of all executables
#
# make clean                     === removes object files and executables
# make cleanall                  === removes object files, executables and temporary directories
#
# Jan. 13, 2019
#
SHELL=/bin/sh

# Location of Components source files and Makescripts files

Components_Dir=./SCC
MAKESCRIPTS_Dir=$(Components_Dir)/MakeScripts

# Use BaseCommonConfig.mk if it exists, otherwise use BaseCommonConfig_Default.mk 

ifneq ("$(wildcard $(MAKESCRIPTS_Dir)/BaseCommonConfig.mk)","")
	include $(MAKESCRIPTS_Dir)/BaseCommonConfig.mk
else
	include $(MAKESCRIPTS_Dir)/BaseCommonConfig_Default.mk
endif


ifeq ($(MAKECMDGOALS),release)
BUILD_TYPE=release
endif
ifeq ($(MAKECMDGOALS),debug)
BUILD_TYPE=debug
endif

# Specifying targets 

release : .Starting  .SymFunLib  .SymFunSample1 .SymFunSample2 .SymFunSample3 .SymFunSample4   .SymFunSample5 .Finished 

debug   : .Starting  .SymFunLib_debug .SymFunSample1_debug .SymFunSample2_debug .SymFunSample3_debug .SymFunSample4_debug .SymFunSample5_debug .Finished  

.Starting :
	###########################################################
	# Build Started
	########################################################### 
	$(QUIET) echo "Compilation Date : " `date` 
ifeq ($(OpenMP),0)
	$(QUIET) echo "Executable Type  :  Single-threaded" 
else
	$(QUIET) echo "Executable Type  :  OpenMP based multi-threaded" 
endif

 
# Specification of target makefiles 

.SymFunLib :
	###########################################################
	# .SymFunLib
	###########################################################
	$(QUIET)$(MAKE) -f SymFunLib.mk --directory=SCC/SymFun release 
.SymFunLib_debug :
	###########################################################
	# .SymFunLib_debug 
	########################################################### 
	$(QUIET)$(MAKE) -f SymFunLib.mk --directory=SCC/SymFun debug
	
.SymFunSample1  :
	###########################################################
	# .SymFunSample1 
	###########################################################
	$(QUIET)$(MAKE) -f SymFunSample1.mk  release 
.SymFunSample1_debug :
	###########################################################
	# .SymFunSample1_debug 
	########################################################### 
	$(QUIET)$(MAKE) -f SymFunSample1.mk   debug

.SymFunSample2  :
	###########################################################
	# .SymFunSample2 
	###########################################################
	$(QUIET)$(MAKE) -f SymFunSample2.mk  release 
.SymFunSample2_debug :
	###########################################################
	# .SymFunSample2_debug 
	########################################################### 
	$(QUIET)$(MAKE) -f SymFunSample2.mk   debug

.SymFunSample3  :
	###########################################################
	# .SymFunSample3 
	###########################################################
	$(QUIET)$(MAKE) -f SymFunSample3.mk  release 
.SymFunSample3_debug :
	###########################################################
	# .SymFunSample3_debug 
	########################################################### 
	$(QUIET)$(MAKE) -f SymFunSample3.mk   debug
	
.SymFunSample4  :
	###########################################################
	# .SymFunSample4 
	###########################################################
	$(QUIET)$(MAKE) -f SymFunSample4.mk  release 
.SymFunSample4_debug :
	###########################################################
	# .SymFunSample4_debug 
	########################################################### 
	$(QUIET)$(MAKE) -f SymFunSample4.mk   debug
	
.SymFunSample5  :
	###########################################################
	# .SymFunSample5 
	###########################################################
	$(QUIET)$(MAKE) -f SymFunSample5.mk  release 
.SymFunSample5_debug :
	###########################################################
	# .SymFunSample5_debug 
	########################################################### 
	$(QUIET)$(MAKE) -f SymFunSample5.mk   debug
	
.Finished :
	###########################################################
	# Build Completed
	########################################################### 
	
.PHONY : cleanall clean
cleanall  : clean
	rm -rf ./_*
clean: 
	$(QUIET)$(MAKE) -f SymFunLib.mk --directory=SCC/SymFun   clean 
	$(QUIET)$(MAKE) -f SymFunSample1.mk clean 
	$(QUIET)$(MAKE) -f SymFunSample2.mk clean 
	$(QUIET)$(MAKE) -f SymFunSample3.mk clean 
	$(QUIET)$(MAKE) -f SymFunSample4.mk clean 
	$(QUIET)$(MAKE) -f SymFunSample5.mk clean 




