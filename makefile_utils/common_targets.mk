# Set the default target if not already set - this allows the makefile to overule it
.DEFAULT_GOAL ?= build_cpp_x86Linux

# Linux x86 c++ compiler
.PHONEY: build_cpp_x86Linux
build_cpp_x86Linux: TARGET_NAME = x86Linux_cpp
build_cpp_x86Linux: CC = g++
build_cpp_x86Linux: AR = ar
build_cpp_x86Linux: CFLAGS += -std=c++11 $(CPP_HOST_WARNINGS)
build_cpp_x86Linux: LFLAGS += -lstdc++ $(CFLAGS)
build_cpp_x86Linux: AR_FLAGS += rcs
build_cpp_x86Linux: build

$(info target is: $(TARGET_NAME))
