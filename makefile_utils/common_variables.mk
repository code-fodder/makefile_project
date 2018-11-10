# For printing. This takes a copy of all the environment variables. We take
# this copy before we set any variables so that we can filter those variables 
# out later and just print the new variables we have set.
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
HEADERS =

# Outputs
PROJECT_NAME ?= out
OBJECT_DIR = obj
OBJECT_SUB_DIRS =
OBJECTS =
DEPS =
BIN_DIR = bin

# Build variables
CC = gcc
AR = ar
# -MMD is a compiler flag which tells the compiler to generate the dependacy lists for each object.
CFLAGS = -MMD
LFLAGS = 
AR_FLAGS =
