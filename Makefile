##
## EPITECH PROJECT, 2021
## B-ASM-400-PAR-4-1-asmminilibc-quentin.daville
## File description:
## Makefile
##

SRC		=	src/strlen.asm		\
			src/strchr.asm		\
			src/memset.asm		\
			src/memcpy.asm		\
			src/strcmp.asm		\
			src/memmove.asm		\
			src/strncmp.asm		\
			src/strcasecmp.asm	\
			src/rindex.asm		\
			src/strstr.asm		\
			src/strpbrk.asm		\
			src/strcspn.asm		\

AS = nasm

ASFLAGS += -f elf64

CC = gcc

LDFLAGS += -nostdlib -shared -fPIC

OBJ = $(SRC:.asm=.o)

NAME = libasm.so

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(OBJ)
	$(CC)  $(OBJ) -o $(NAME) $(LDFLAGS)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: clean fclean re all