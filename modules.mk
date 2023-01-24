################################# LIBRARIES ####################################
LIB_DIR				= modules


#Flags are different in m1 and cluster environments
LINK_READLINE		= -L/opt/homebrew/opt/readline/lib -lreadline
INC_DIR_READLINE	= -I/opt/homebrew/opt/readline/include
#LINK_READLINE		= -L${HOME}/.brew/opt/readline/lib -lreadline
#INC_DIR_READLINE	= -I${HOME}/.brew/opt/readline/include

LIBFT_DIR			= $(LIB_DIR)/libft
LIBFT				= $(LIBFT_DIR)/libft.a
LINK_LIBFT			= -L$(LIBFT_DIR)
INC_DIR_LIBFT		= -I$(LIBFT_DIR)/includes

LIBLEXER_DIR		= $(LIB_DIR)/liblexer
LIBLEXER			= $(LIBLEXER_DIR)/liblexer.a
LINK_LIBLEXER		= -L$(LIBLEXER_DIR)
INC_DIR_LIBLEXER	= -I$(LIBLEXER_DIR)/includes

LIBPARSER_DIR		= $(LIB_DIR)/libparser
LIBPARSER			= $(LIBPARSER_DIR)/libparser.a
LINK_LIBPARSER		= -L$(LIBPARSER_DIR)
INC_DIR_LIBPARSER	= -I$(LIBPARSER_DIR)/includes

LIBENVMAN_DIR		= $(LIB_DIR)/libenvman
LIBENVMAN			= $(LIBENVMAN_DIR)/libenvman.a
LINK_LIBENVMAN		= -L$(LIBENVMAN_DIR)
INC_DIR_LIBENVMAN	= -I$(LIBENVMAN_DIR)/includes

LIBHEREDOC_DIR		= $(LIB_DIR)/libheredoc
LIBHEREDOC			= $(LIBHEREDOC_DIR)/libheredoc.a
LINK_LIBHEREDOC		= -L$(LIBHEREDOC_DIR)
INC_DIR_LIBHEREDOC	= -I$(LIBHEREDOC_DIR)/includes

LIBBUILTIN_DIR		= $(LIB_DIR)/libbuiltin
LIBBUILTIN			= $(LIBBUILTIN_DIR)/libbuiltin.a
LINK_LIBBUILTIN		= -L$(LIBBUILTIN_DIR)
INC_DIR_LIBBUILTIN	= -I$(LIBBUILTIN_DIR)/includes

LIBEXEC_DIR			= $(LIB_DIR)/libexec
LIBEXEC				= $(LIBEXEC_DIR)/libexec.a
LINK_LIBEXEC		= -L$(LIBEXEC_DIR)
INC_DIR_LIBEXEC		= -I$(LIBEXEC_DIR)/includes

LIB_ALL				= \
					$(LIBFT) \
					$(LIBLEXER) \
					$(LIBPARSER) \
					$(LIBENVMAN) \
					$(LIBHEREDOC) \
					$(LIBBUILTIN)\
					$(LIBEXEC)
LINK_LIBS			= \
					$(LINK_READLINE) \
					$(LINK_LIBFT) \
					$(LINK_LIBLEXER) \
					$(LINK_LIBPARSER) \
					$(LINK_LIBENVMAN) \
					$(LINK_LIBHEREDOC) \
					$(LINK_LIBBUILTIN) \
					$(LINK_LIBEXEC)
INC_DIR				= -I. -Iincludes \
					$(INC_DIR_READLINE) \
					$(INC_DIR_LIBFT) \
					$(INC_DIR_LIBLEXER) \
					$(INC_DIR_LIBPARSER) \
					$(INC_DIR_LIBENVMAN) \
					$(INC_DIR_LIBHEREDOC) \
					$(INC_DIR_LIBBUILTIN) \
					$(INC_DIR_LIBEXEC)
################################# TARGETS ######################################
include $(LIBFT_DIR)/filelist.mk
include $(LIBLEXER_DIR)/filelist.mk
include $(LIBPARSER_DIR)/filelist.mk
include $(LIBENVMAN_DIR)/filelist.mk
include $(LIBHEREDOC_DIR)/filelist.mk
include $(LIBBUILTIN_DIR)/filelist.mk
include $(LIBEXEC_DIR)/filelist.mk

ABS_SRC_LIBFT = $(addprefix $(LIBFT_DIR)/, $(SRC_LIBFT))
ABS_SRC_LIBLEXER = $(addprefix $(LIBLEXER_DIR)/, $(SRC_LIBLEXER))
ABS_SRC_LIBPARSER = $(addprefix $(LIBPARSER_DIR)/, $(SRC_LIBPARSER))
ABS_SRC_LIBENVMAN = $(addprefix $(LIBENVMAN_DIR)/, $(SRC_LIBENVMAN))
ABS_SRC_LIBHEREDOC = $(addprefix $(LIBHEREDOC_DIR)/, $(SRC_LIBHEREDOC))
ABS_SRC_LIBBUILTIN = $(addprefix $(LIBBUILTIN_DIR)/, $(SRC_LIBBUILTIN))
ABS_SRC_LIBEXEC = $(addprefix $(LIBEXEC_DIR)/, $(SRC_LIBEXEC))

export ACFLAGS

$(LIBFT): $(ABS_SRC_LIBFT)
	@make -j4 -C $(LIBFT_DIR)/

$(LIBLEXER): $(ABS_SRC_LIBLEXER)
	@make -j4 -C $(LIBLEXER_DIR)/

$(LIBPARSER): $(ABS_SRC_LIBPARSER)
	@make -j4 -C $(LIBPARSER_DIR)/

$(LIBENVMAN): $(ABS_SRC_LIBENVMAN)
	@make -j4 -C $(LIBENVMAN_DIR)/

$(LIBHEREDOC): $(ABS_SRC_LIBHEREDOC)
	@make -j4 -C $(LIBHEREDOC_DIR)/

$(LIBBUILTIN): $(ABS_SRC_LIBBUILTIN)
	@make -j4 -C $(LIBBUILTIN_DIR)/

$(LIBEXEC): $(ABS_SRC_LIBEXEC)
	@make -j4 -C $(LIBEXEC_DIR)\
