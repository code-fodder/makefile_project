#######################################################################
# Include the common makefiles:
#   - Variables:     Sets up the variables with some default values
-include makefile_utils/common_variables.mk
#######################################################################

# Project Name
PROJECT_NAME = state_machine_tester

# Add your souce directories here
SOURCE_DIRS = \
	src \
	src/test_subdir

# Requires the hadamard library
LIB_PATHS = -Lhadamard/lib
LIB_DEPS = -lhadamard

#######################################################################
# Include the common makefiles:
#   - var_expansions: Generates lists of source, objects etc
#   - warnings:       Set the warning flags for various targets
#   - targets:        Set the compiler flags for the build target
#   - rules:          The build rules
-include makefile_utils/common_var_expansions.mk
-include makefile_utils/common_warnings.mk
-include makefile_utils/common_targets.mk
-include makefile_utils/common_rules.mk
#######################################################################

