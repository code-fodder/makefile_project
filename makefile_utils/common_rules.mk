# Expand the subfodlers into objects and source dirs
OBJECT_SUB_DIRS = $(OBJECT_DIR) $(addprefix $(OBJECT_DIR)/,$(SOURCE_DIRS))

# Get sources from /src and /src/test/ and /src/test/test2/
SOURCES = $(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.cpp $(dir)/*.cxx))
# Source file without the /src at the start, then take the basename, then add .o, then add obj/ to the front
OBJECTS = $(addprefix $(OBJECT_DIR)/,$(addsuffix .o,$(basename $(patsubst %,%,$(SOURCES)))))

OUTPUT_DIRS = $(BIN_DIR) $(OBJECT_SUB_DIRS)
