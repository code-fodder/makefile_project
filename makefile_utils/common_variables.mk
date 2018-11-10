# For printing
VARS_OLD := $(.VARIABLES)

# Just for me so I can read my own makefile :o
THE_TARGET = $@
THE_DEPENDENCY = $<

#Commands
MAKE_DIR = mkdir -p
RM = rm -rf

# Source
SOURCE_DIRS = .
SOURCES =

# Outputs
PROJECT_NAME ?= out
OBJECT_DIR = obj
OBJECT_SUB_DIRS =
OBJECTS =
BIN_DIR = bin

