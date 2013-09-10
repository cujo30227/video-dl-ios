#include "pyutils.h"

#include <stdio.h>

void py_path_append(char *new_dir)
{
	char *current_path = Py_GetPath();
	char *final_path = strcat(strcat(current_path, ":"), new_dir);
	printf("%s\n", final_path);
	PySys_SetPath(final_path);
}

void py_print(PyObject *object)
{
	PyObject_Print(object, stdout, 0);
}