#
# SymFunSample3 program makefile using MakeScripts
#

SHELL=/bin/sh

# Location of SCC source files and Makescripts files

SCC_Dir=SCC
MAKESCRIPTS_Dir=$(SCC_Dir)/MakeScripts

# Use BaseCommonConfig.mk if it exists, otherwise use BaseCommonConfig_Default.mk 

ifneq ("$(wildcard $(MAKESCRIPTS_Dir)/BaseCommonConfig.mk)","")
	include $(MAKESCRIPTS_Dir)/BaseCommonConfig.mk
else
	include $(MAKESCRIPTS_Dir)/BaseCommonConfig_Default.mk
endif

 
CPPfiles      += SymFunSample2.cpp

INCLUDES      += -I./SCC/SymFun

ifeq ($(MAKECMDGOALS),debug)
LIBS     += -lSymFun_debug
endif 
ifeq ($(MAKECMDGOALS),release)
LIBS     += -lSymFun
endif

LIB_PATH += -LSCC/SymFun/lib


RELEASE_EXEC  = SymFunSample2.exe
DEBUG_EXEC    = SymFunSample2_debug.exe


RELEASE_DIR  = ./_releaseSymFunSample
DEBUG_DIR    = ./_debugSymFunSample

include $(SCC_Dir)/MakeScripts/ExecutableMake.mk

