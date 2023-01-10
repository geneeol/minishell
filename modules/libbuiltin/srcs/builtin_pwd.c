#include <stdlib.h>
#include <unistd.h>
#include "libft.h"

int	builtin_pwd(void)
{
	char	*pwd;
	int		stat;

	pwd = getcwd(NULL, 0);
	if (!pwd)
		return (1);
	stat = ft_printf("%s\n", pwd);
	free(pwd);
	if (stat < 0)
		return (1);
	return (0);
}
