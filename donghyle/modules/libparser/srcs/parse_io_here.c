#include "t_node.h"
#include "t_token.h"
#include "parser_internal.h"
#include <stddef.h>

t_node	*parse_io_here(t_parser *p)
{
	t_node	*root;
	t_node	*child;

	root = node_create(NODETYPE_IO_HERE, NULL, 0);
	if (!root)
		return (parse_abort(p, NULL, NULL));
	child = parse_terminal(p, NODETYPE_IO_OP_HERE);
	if (!child)
		return (parse_abort(p, root, NULL));
	if (node_addchild(root, child))
		return (parse_abort(p, root, child));
	child = parse_terminal(p, NODETYPE_HERE_END);
	if (!child)
		return (parse_abort(p, root, NULL));
	if (node_addchild(root, child))
		return (parse_abort(p, root, child));
	return (root);
}
