# Project Name
PROJECT_NAME = state_machine_tester

# Include the common variables
-include makefile_utils/common_variables.mk

# Add your souce directories here
SOURCE_DIRS = \
	src \
	src/test_subdir

# Include the common variable expansions to generate source / objects lists
-include makefile_utils/common_var_expansions.mk

# Include the common warnings
-include makefile_utils/common_warnings.mk

# Include the common targets for setting compiler specifics and calling the build rules
-include makefile_utils/common_targets.mk

# Include the common rules for building
-include makefile_utils/common_rules.mk

