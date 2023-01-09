#include "envmanager_internal.h"
#include "libft.h"

t_enventry	*envmanager_getentry(t_list *envlist, char *name)
{
	t_list	*list;
	char	*lstname;

	list = envlist;
	while (list)
	{
		lstname = ((t_enventry *)(list->content))->name;
		if (!ft_strncmp(name, lstname, ft_strlen(lstname)))
			return (list->content);
		list = list->next;
	}
	return (NULL);
}

int	envmanager_getval(t_list *envlist, char **buf, char *name)
{
	t_enventry	*entry;

	entry = envmanager_getentry(envlist, name);
	if (!entry)
		return (CODE_ERROR_DATA);
	*buf = ft_strdup(entry->val);
	if (!(*buf))
		return (CODE_ERROR_MALLOC);
	return (CODE_OK);
}