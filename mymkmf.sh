name=$1

if [ $# -eq 2 ] ; then
	$libs = "-L. -l$2"
fi

echo "CC = gcc

SRC = \$(wildcard *.c) \$(wildcard */*.c)

OBJ = \$(SRC:.c=.o)

FLAGS = -W -Wall -Werror -pedantic -ansi -combine

LIBS = $libs

NAME = $name

all: \$(NAME)

\$(NAME): \$(OBJ)
	\$(CC) -o \$(NAME) \$(OBJ) \$(LIBS) \$(FLAGS)

clean:
	rm \$(OBJ)

fclean: clean
	rm \$(NAME)

re: fclean all

test: all
	...

.PHONY: clean fclean test" > Makefile