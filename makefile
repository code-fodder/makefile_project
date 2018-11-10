# Project Name
PROJECT_NAME = state_machine_tester
-include makefile_utils/common_variables.mk

# Add your souce directories here
SOURCE_DIRS = \
	src \
	src/test_subdir

-include makefile_utils/common_rules.mk
-include makefile_utils/common_targets.mk


