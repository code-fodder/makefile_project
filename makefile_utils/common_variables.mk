# For printing. This takes a copy of all the environment variables. We take
# this copy before we set any variables so that we can filter those variables 
# out later and just print the new variables we have set.
VARS_OLD := $(.VARIABLES)
VARS_OLD := $(filter-out CC AR,$(VARS_OLD))

# Just for me so I can read my own makefile :o
RULE_TARGET = $@
RULE_DEPENDENCY = $<

#Commands
MAKE_DIR = mkdir -p
RM = rm -rf

# Source
SOURCE_DIRS = .
SOURCES =
HEADERS =

# Outputs
PROJECT_NAME = out
OBJECT_DIR = obj
OBJECTS =
DEPS =
BIN_DIR = bin
LIB_DIR = lib
OUTPUT_DIR = $(BIN_DIR)
OUTPUT_FILE = $(PROJECT_NAME)

# Build variables
TARGET_NAME = none
# exe or shared (lib)
TARGET_TYPE = exe
CC = gcc
AR = ar
CFLAGS =
LFLAGS =
LIB_PATHS = 
LIB_DEPS = 
DEFINES = 



