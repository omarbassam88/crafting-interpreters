BUILD_DIR := build

#JLOX

JAVA_SOURCES := $(wildcard java/com/craftinginterpreters/lox/*.java)
CLASSES := $(addprefix $(BUILD_DIR)/,  $(JAVA_SOURCES:.java=.class))
JAVA_OPTIONS := -Werror

jlox: $(CLASSES)
	@: # Don't show nothing to be done output

$(BUILD_DIR)/java/%.class: java/%.java
	mkdir -p $(BUILD_DIR)/java
	javac -cp java -d $(BUILD_DIR)/java $(JAVA_OPTIONS) -implicit:none $<

generate_ast: build/java/com/craftinginterpreters/tool/GenerateAst.class
	java -cp build/java com.craftinginterpreters.tool.GenerateAst \
			java/com/craftinginterpreters/lox

# CLOX
CC := clang
CFLAGS := -Wall
C_SOURCES := $(wildcard c/*.c)
OBJS := $(addprefix $(BUILD_DIR)/, $(C_SOURCES:.c=.o))

clox: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/c/%.o: c/%.c
	mkdir -p $(BUILD_DIR)/c
	$(CC) -c $(CFLAGS) $< -o $@

format: $(C_SOURCES)
	clang-format -i $^

# COMMON

clean:
	rm -rf $(BUILD_DIR)

.PHONY: clean jlox
