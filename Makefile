CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -Wpedantic -O2
CPPFLAGS := -Iinclude

TARGET := lzforge

SRC := $(wildcard src/*.cpp)
OBJ := $(SRC:src/%.cpp=build/%.o)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

build/%.o: src/%.cpp
	@mkdir -p build
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

clean:
ifeq ($(OS),Windows_NT)
	@if exist build rmdir /S /Q build
	@if exist $(TARGET).exe del /Q $(TARGET).exe
else
	rm -rf build $(TARGET)
endif