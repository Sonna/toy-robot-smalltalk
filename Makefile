CC=gst
CC_TEST=gst-sunit
CFLAGS=-V -f

TARGET=main
TESTTARGET=test

SRCS=src/robot.cpp

.PHONY: default all clean

default: $(TARGET)
all: default

.PRECIOUS: $(TARGET) $(OBJECTS)

main: Main.st
	$(CC) $(CFLAGS) $^

test: tests/RobotTestSuite.st
	$(CC_TEST) $(CFLAGS) $^ $^

# http://stackoverflow.com/questions/1484817/how-do-i-make-a-simple-makefile-gcc-unix
