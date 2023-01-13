#include <stdlib.h>
#include "libft.h"

static int	count_quotes(char *str)
{
	int	i = 0;

	while (*str)
	{
		if (*str == '\'' || *str == '\"')
			i++;
		str++;
	}
	return (i);
}

int	remove_quotes(char **buf)
{
	char	*backup;
	int		i;
	int		j;

	backup = malloc(sizeof(char) * (ft_strlen(*buf) - count_quotes(*buf) + 1));
	if (!backup)
		return (CODE_ERROR_MALLOC);
	i = 0;
	j = 0;
	while ((*buf)[i])
	{
		if (!((*buf)[i] == '\'' || (*buf)[i] == '\"'))
		{
			backup[j] = (*buf)[i];
			j++;
		}
		i++;
	}
	free(*buf);
	*buf = backup;
	return (CODE_OK);
}