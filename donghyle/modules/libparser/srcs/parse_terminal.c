#include "t_node.h"
#include "t_token.h"
#include "parser_internal.h"
#include <stddef.h>

static int	is_correct_tokentype(int nodetype, int tokentype)
{
	int		token_map[N_TOKENTYPE];
	void	(*map_setter[N_NODETYPE])(int *);

	map_setter[NODETYPE_CMD_WORD] = map_setter_cmd_word;
	map_setter[NODETYPE_IO_OP_FILE] = map_setter_io_op_file;
	map_setter[NODETYPE_FILENAME] = map_setter_filename;
	map_setter[NODETYPE_IO_OP_HERE] = map_setter_io_op_here;
	map_setter[NODETYPE_HERE_END] = map_setter_here_end;
	(map_setter[nodetype])(token_map);
	return (token_map[tokentype]);
}

t_node	*parse_terminal(t_parser *p, int nodetype)
{
	t_node	*root;

	if (parser_is_last_token(p))
		return (NULL);
	if (!is_correct_tokentype(nodetype, p->tok_curr->type))
		return (NULL);
	root = node_create(nodetype, p->tok_curr->content, 1);
	if (!root)
		return (NULL);
	p->tok_curr++;
	return (root);
}
