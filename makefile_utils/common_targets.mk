# c++ compiler
.PHONEY: x86Linux_cpp
x86Linux_cpp: TARGET_NAME = x86Linux_cpp
x86Linux_cpp: CC := g++
x86Linux_cpp: AR = ar
x86Linux_cpp: CFLAGS += -std=c++11
x86Linux_cpp: LFLAGS += -lstdc++ $(CFLAGS)
x86Linux_cpp: AR_FLAGS += rcs
x86Linux_cpp: build

# include the auto generated dependecies targets
-include $(DEPS)

#.PHONEY: build
build: print create_dirs $(OBJECTS)
	@echo Linking
	$(CC) $(LFLAGS) $(OBJECTS) -o $(BIN_DIR)/$(PROJECT_NAME)
	@echo build complete

# Compiling each file
$(OBJECT_DIR)/%.o: %.cpp
	@echo "compiling $(THE_DEPENDENCY)"
	@$(CC) $(CFLAGS) -c $(THE_DEPENDENCY) -o $(THE_TARGET)

# Clean
.PHONEY: clean
clean:
	$(RM) $(OUTPUT_DIRS)

# Create output directories
.PHONEY: create_dirs
create_dirs: $(OUTPUT_DIRS)
$(OUTPUT_DIRS):
	@$(MAKE_DIR) $(THE_TARGET)

# Print the variables
VARS := $(filter-out $(VARS_OLD) VARS_OLD,$(.VARIABLES))
.PHONEY: print_start print
print: print_start $(VARS)
	@echo "------------------------------------------"
print_start:
	@echo "------------------------------------------"
	@printf "%-30s " "Variable"
	@echo "Value"
	@echo "------------------------------------------"
$(VARS):
	@printf "%-30s " $(THE_TARGET)
	@echo "$($(THE_TARGET))"

