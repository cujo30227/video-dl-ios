#ifndef video_dl_pyutils_h
#define video_dl_pyutils_h

#import "Python.h"

#define PRINT_PYERROR if (PyErr_Occurred()) PyErr_Print();

void py_path_append(char *new_dir);
void py_print(PyObject *object);

#endif
