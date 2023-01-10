#include "t_node.h"
#include "t_token.h"
#include "parser_internal.h"
#include <stddef.h>
#include "libft_def.h"

t_node	*parse_pipe_sequence(t_parser *p)
{
	t_node	*root;
	t_node	*child;

	root = node_create(NODETYPE_PIPE_SEQUENCE, NULL, 0);
	if (!root)
		return (NULL);
	while (TRUE)
	{
		child = parse_simple_command(p);
		if (!child)
			return (parse_abort(p, root, NULL));
		if (node_addchild(root, child))
			return (parse_abort(p, root, child));
		if (parser_is_last_token(p))
			return (root);
		if (p->tok_curr->type != TOKENTYPE_PIPE)
			return (parse_abort(p, root, NULL));
		p->tok_curr++;
		root->n_tokens++;
	}
}
