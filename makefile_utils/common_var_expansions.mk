# Generate sources list for cpp, cxx and c files
SOURCES = $(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.cpp $(dir)/*.cxx $(dir)/*.c))

# Generate headers list for hpp, hxx and h files
HEADERS = $(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.hpp $(dir)/*.hxx $(dir)/*.h))

# Generate objects list from the sources list prefixed with the object dir
OBJECTS = $(addprefix $(OBJECT_DIR)/,$(addsuffix .o,$(basename $(patsubst %,%,$(SOURCES)))))

# Generate dependency files list. The compiler creates these (-MMD flag) same as obj file with a .d extension
DEPS = $(OBJECTS:%.o=%.d)

# Generate the output directories list (used for creating/cleaning output dirs
OUTPUT_DIRS = $(OUTPUT_DIR) $(OBJECT_DIR) $(addprefix $(OBJECT_DIR)/,$(SOURCE_DIRS))
