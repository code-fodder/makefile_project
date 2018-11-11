# -MMD is a compiler flag which tells the compiler to generate the dependacy lists for each object.
CFLAGS += -MMD
# include the auto generated dependecies targets
-include $(DEPS)

#.PHONEY: build
build: print create_dirs $(OBJECTS)
	@echo Linking
	$(CC) $(LFLAGS) $(OBJECTS) -o $(OUTPUT_DIR)/$(OUTPUT_FILE) $(LIB_PATHS) $(LIB_DEPS)
	@echo build complete

# Compiling each file
$(OBJECT_DIR)/%.o: %.cpp
	@echo "compiling $(RULE_DEPENDENCY)"
	$(CC) $(CFLAGS) $(DEFINES) -c $(RULE_DEPENDENCY) -o $(RULE_TARGET)

# Clean
.PHONEY: clean
clean:
	$(RM) $(OUTPUT_DIRS)

# Create output directories
.PHONEY: create_dirs
create_dirs: $(OUTPUT_DIRS)
$(OUTPUT_DIRS):
	@$(MAKE_DIR) $(RULE_TARGET)

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
	@printf "%-30s " $(RULE_TARGET)
	@echo "$($(RULE_TARGET))"

