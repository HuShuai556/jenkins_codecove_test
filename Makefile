CC = gcc
CFLAGS = -fprofile-arcs -ftest-coverage -Wall -Wextra -O0
LDFLAGS = -lgcov --coverage
SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)
EXEC = codecv_test

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

test: $(EXEC)
	./$(EXEC)

clean:
	rm -f $(OBJ) $(EXEC) *.gcda *.gcno coverage.info
	rm -rf coverage_html
