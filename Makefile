TARGET = aes
STD_LIBS = 
CXX = g++ 

CXXFLAGS = -std=c++11 -pedantic -Wall -Wextra -Wformat -Ofast -ggdb3 
LFLAGS = -pedantic -Wall -Wextra 
CXXFLAGS1 = -std=c++11 -Wall -pedantic -ggdb3 -Ofast -ggdb3 \
-pedantic-errors -Wextra -Waggregate-return -Wcast-align \
-Wcast-qual -Wconversion \
-Wdisabled-optimization \
-Werror -Wfloat-equal -Wformat=2 \
-Wformat-nonliteral -Wformat-security  \
-Wformat-y2k \
-Wimplicit  -Wimport  -Winit-self  -Winline \
-Winvalid-pch   \
-Wlong-long \
-Wmissing-field-initializers -Wmissing-format-attribute   \
-Wmissing-include-dirs -Wmissing-noreturn \
-Wpacked  -Wpadded -Wpointer-arith \
-Wredundant-decls \
-Wshadow -Wstack-protector \
-Wstrict-aliasing=2 -Wswitch-default \
-Wswitch-enum \
-Wunreachable-code -Wunused \
-Wunused-parameter \
-Wvariadic-macros \
-Wwrite-strings

.PHONY: clean all default $(TARGET)

default: $(TARGET)
all: default

BASE_FILES = $(wildcard *.cpp)
SRC_FILES = $(wildcard src/*.cpp)
SRC_H_FILES = $(wildcard inc/*.hpp)
BASE_H_FILES = $(wildcard *.hpp)

OBJECTS = $(patsubst %.cpp, %.o, $(BASE_FILES) $(SRC_FILES))
HEADERS = $(BASE_H_FILES) $(SRC_H_FILES)

# Compile
%.o: %.c $(HEADERS)
	@echo Compiling: $< ...
	$(CXX) $(CXXFLAGS) -c $< -o $@

#.PRECIOUS: $(TARGET) $(OBJECTS)

#Link
$(TARGET): $(OBJECTS)
	@echo Linking files: $(OBJECTS) ...
	$(CXX) $(OBJECTS) $(STD_LIBS) -o $@
	@echo Deleting .o files ...
	-rm -f $(OBJECTS)
	@echo Done

clean:
	-rm -f $(OBJECTS)
	-rm -f $(TARGET)