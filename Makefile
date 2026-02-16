CC = clang
CFLAGS = -I/usr/local/include \
		 -L/usr/local/lib \
		 -lSDL3

SRC_DIR = src
BUILD_DIR = build
OBJS_DIR = objs

SRCS = $(shell find $(SRC_DIR) -name '*.c')
OBJS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/$(OBJS_DIR)/%.o,$(SRCS))

TARGET = $(BUILD_DIR)/app

all: setup $(TARGET) run

setup:
	@mkdir -p $(BUILD_DIR)/$(OBJS_DIR)

$(BUILD_DIR)/$(OBJS_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -MD -c -o $@ $^

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

run:
	$(TARGET)

.PHONY: clean

clean:
	@rm -f $(TARGET)

print:
	@echo $(SRCS)
	@echo $(OBJS)

