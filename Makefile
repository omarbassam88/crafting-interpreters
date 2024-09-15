BUILD_DIR := build

SOURCES := $(wildcard java/com/craftinginterpreters/lox/*.java)
CLASSES := $(addprefix $(BUILD_DIR)/,  $(SOURCES:.java=.class))

JAVA_OPTIONS := -Werror

clean:
	rm -rf $(BUILD_DIR)

jlox: $(CLASSES)
	@: # Don't show nothing to be done output

$(BUILD_DIR)/java/%.class: java/%.java
	mkdir -p $(BUILD_DIR)/java
	javac -cp java -d $(BUILD_DIR)/java $(JAVA_OPTIONS) -implicit:none $<

.PHONY: clean jlox
