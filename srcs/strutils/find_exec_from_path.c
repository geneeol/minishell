#include <stdlib.h>
#include <dirent.h>
#include "libft.h"
#include "envmanager.h"
#include "strutils.h"

static int	closedir_and_return(DIR *d, int stat)
{
	closedir(d);
	return (stat);
}

static int	replace_if_found(char *dir_path, char **buf)
{
	DIR				*d;
	struct dirent	*dir;
	char			*backup;

	d = opendir(dir_path);
	if (!d)
		return (CODE_ERROR_IO);
	while (TRUE)
	{
		dir = readdir(d);
		if (!dir)
			return (closedir_and_return(d, 1));
		if (dir->d_type == DT_REG
			&& ft_strncmp(dir->d_name, *buf, ft_strlen(*buf) + 1) == 0)
		{
			backup = ft_strmerge(3, dir_path, "/", dir->d_name);
			if (!backup)
				return (closedir_and_return(d, CODE_ERROR_MALLOC));
			free(*buf);
			*buf = backup;
			return (closedir_and_return(d, CODE_OK));
		}
	}
}

static int	find_exec_from_path_abort(char *path, char **paths, int stat)
{
	free(path);
	if (paths)
		ft_free_strarr(paths);
	return (stat);
}

int	find_exec_from_path(char **buf)
{
	char	*path;
	char	**paths;
	char	**cursor;
	int		stat;

	if (envman_getval("PATH", &path))
		return (CODE_ERROR_GENERIC);
	paths = ft_split(path, ':');
	if (!paths)
		return (find_exec_from_path_abort(path, paths, CODE_ERROR_MALLOC));
	cursor = paths;
	while (*cursor)
	{
		stat = replace_if_found(*cursor, buf);
		if (stat == CODE_OK || stat == CODE_ERROR_MALLOC)
			return (find_exec_from_path_abort(path, paths, stat));
		cursor++;
	}
	if (stat)
		stat = CODE_ERROR_GENERIC;
	return (find_exec_from_path_abort(path, paths, stat));
}