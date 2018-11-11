# -MMD is a compiler flag which tells the compiler to generate the dependacy lists for each object.
CFLAGS += -MMD
# include the auto generated dependecies targets
-include $(DEPS)

#.PHONEY: build
build: project_deps create_dirs  $(OBJECTS)
	@echo Linking
	$(CC) $(LFLAGS) $(OBJECTS) -o $(OUTPUT_DIR)/$(OUTPUT_FILE) $(LIB_PATHS) $(LIB_DEPS)
	@echo build complete

# Compile .cpp files
$(OBJECT_DIR)/%.o: %.cpp
	@echo "compiling $(RULE_DEPENDENCY)"
	$(CC) $(CFLAGS) $(DEFINES) -c $(RULE_DEPENDENCY) -o $(RULE_TARGET)
# Compile .cxx files
$(OBJECT_DIR)/%.o: %.cxx
	@echo "compiling $(RULE_DEPENDENCY)"
	$(CC) $(CFLAGS) $(DEFINES) -c $(RULE_DEPENDENCY) -o $(RULE_TARGET)
# Compile .c files
$(OBJECT_DIR)/%.o: %.c
	@echo "compiling $(RULE_DEPENDENCY)"
	$(CC) $(CFLAGS) $(DEFINES) -c $(RULE_DEPENDENCY) -o $(RULE_TARGET)

.PHONY: project_deps $(PROJECT_DEPS)
project_deps: $(PROJECT_DEPS)
$(PROJECT_DEPS):
	@echo "----------------------------------------------"
	$(MAKE) $(MAKECMDGOALS) -C $(RULE_TARGET)
	@echo "----------------------------------------------"

# Clean
.PHONY: clean
clean: project_deps
	$(RM) $(OUTPUT_DIRS)

# Create output directories
.PHONY: create_dirs
create_dirs: $(OUTPUT_DIRS)
$(OUTPUT_DIRS):
	@$(MAKE_DIR) $(RULE_TARGET)

# Print the variables
VARS := $(filter-out $(VARS_OLD) VARS_OLD,$(.VARIABLES))
.PHONY: print_start print
print: print_start $(VARS)
	@echo "------------------------------------------"
print_start:
	@echo "------------------------------------------"
	@printf "%-30s " "Variable"
	@echo "Value"
	@echo "------------------------------------------"
$(VARS):
	@printf "%-30s " $(RULE_TARGET)
	@echo "$($(RULE_TARGET))"

