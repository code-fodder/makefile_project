# SHARED LIBRARY CONFIG
$(info building shared library)
CFLAGS += -fPIC
LFLAGS += -shared
OUTPUT_DIR = $(LIB_DIR)
OUTPUT_FILE = lib$(PROJECT_NAME).so
DEFINES += -DNO_MAIN
