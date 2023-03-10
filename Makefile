NAME				= minishell
DRIVER_FILENAME		= srcs/prompt/prompt_main
DRIVER_SRC			= $(addsuffix .c, $(DRIVER_FILENAME))
DRIVER_OBJ			= $(addsuffix .o, $(DRIVER_FILENAME))
DRIVER_DEP			= $(addsuffix .d, $(DRIVER_FILENAME))
################################# COMMANDS #####################################
RM					= rm -f
CFLAGS				= -Wall -Werror -Wextra -MMD -MP -g $(ACFLAGS)
################################ FILENAMES #####################################
FILENAME			= \
					prompt/prompt_steps \
					strutils/expansion/expansion_compose_quotes \
					strutils/expansion/expansion_compose_str \
					strutils/expansion/expansion_utils \
					strutils/expansion/expansion_nodes \
					strutils/expansion/expansion \
					strutils/ft_strmerge \
					strutils/pchararr \
					strutils/pchararr_utils \
					strutils/remove_quotes \
					strutils/is_valid_str \
					strutils/filename_utils \
					strutils/find_exec \
					strutils/find_exec_from_path \
					signal/signal_set_state \
					signal/signal_handler

SRC					= $(addprefix srcs/, $(addsuffix .c, $(FILENAME)))
OBJ					= $(addprefix srcs/, $(addsuffix .o, $(FILENAME)))
DEP					= $(addprefix srcs/, $(addsuffix .d, $(FILENAME)))
############################## TEST FILENAMES ##################################
TEST_FILENAME		= \
					print_nodes \
					print_tokens
TEST_SRC			= $(addprefix tests/, $(addsuffix .c, $(TEST_FILENAME)))
TEST_OBJ			= $(addprefix tests/, $(addsuffix .o, $(TEST_FILENAME)))
TEST_DEP			= $(addprefix tests/, $(addsuffix .d, $(TEST_FILENAME)))

TESTER_FILENAME		= \
					test_lexer \
					test_parser \
					test_envmanager \
					test_heredoc \
					test_expansion \
					test_exec \
					test_strutils

TESTER_OBJ			= $(addprefix tests/, $(addsuffix .o, $(TESTER_FILENAME)))
TESTER_DEP			= $(addprefix tests/, $(addsuffix .d, $(TESTER_FILENAME)))
################################# TARGETS ######################################
all:
	@make $(NAME)

include modules.mk

$(NAME): $(LIB_ALL) $(OBJ) $(TEST_OBJ) $(DRIVER_OBJ)
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) $(DRIVER_OBJ) -o $@

test_lexer: $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_lexer.o
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_lexer.o -o $@

test_parser: $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_parser.o
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_parser.o -o $@

test_envmanager: $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_envmanager.o
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_envmanager.o -o $@

test_heredoc: $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_heredoc.o
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_heredoc.o -o $@

test_expansion: $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_expansion.o
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_expansion.o -o $@

test_exec: $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_exec.o
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_exec.o -o $@

test_strutils: $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_strutils.o
	$(CC) $(CFLAGS) $(INC_DIR) $(LINK_LIBS) $(LIB_ALL) $(OBJ) $(TEST_OBJ) tests/test_strutils.o -o $@

-include $(DEP)

%.o: %.c
	$(CC) $(CFLAGS) $(INC_DIR) -c $< -o $@

clean:
	$(RM) $(DRIVER_OBJ) $(DRIVER_DEP) $(OBJ) $(DEP) $(TEST_OBJ) $(TEST_DEP)
	@make clean -C $(LIBFT_DIR)
	@make clean -C $(LIBLEXER_DIR)
	@make clean -C $(LIBPARSER_DIR)
	@make clean -C $(LIBENVMAN_DIR)
	@make clean -C $(LIBHEREDOC_DIR)
	@make clean -C $(LIBBUILTIN_DIR)
	@make clean -C $(LIBEXEC_DIR)
	$(RM) $(TESTER_OBJ) $(TESTER_DEP)

fclean: clean
	$(RM) $(NAME)
	@make fclean -C $(LIBFT_DIR)
	@make fclean -C $(LIBLEXER_DIR)
	@make fclean -C $(LIBPARSER_DIR)
	@make fclean -C $(LIBENVMAN_DIR)
	@make fclean -C $(LIBHEREDOC_DIR)
	@make fclean -C $(LIBBUILTIN_DIR)
	@make fclean -C $(LIBEXEC_DIR)
	$(RM) $(TESTER_FILENAME)

re:
	@make fclean
	@make all

.PHONY: all clean fclean re
