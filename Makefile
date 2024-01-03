# SPDX-License-Identifier: MIT

# path to sj3lib.h and wchar16.h
INCLUDES = -I../

# path to rk_conv.c, sj3_rkcv.c and wc16_str.c
RKDIR = ../

# path to libsj3lib.a
LIBS = -L../

CFLAGS = -O2 -Wall $(INCLUDES)
LDFLAGS = $(LIBS)

TARGET = sample
OBJS = sample.o rk_conv.o sj3_rkcv.o wc16_str.o

all: $(TARGET) $(OBJS)

sample.o: sample.c
	$(CC) $(CFLAGS) -c $< -o $@

rk_conv.o: $(RKDIR)/rk_conv.c
	$(CC) $(CFLAGS) -c $< -o $@

sj3_rkcv.o: $(RKDIR)/sj3_rkcv.c
	$(CC) $(CFLAGS) -c $< -o $@

wc16_str.o: $(RKDIR)/wc16_str.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -lsj3lib -o $@

clean:
	rm -rf $(TARGET) $(OBJS)
