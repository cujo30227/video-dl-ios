PY_EMBED=python-embedded
CPython=${PY_EMBED}/CPython
PYLIB=${PY_EMBED}/pylib

all: libpython xcodefiles

${PY_EMBED}/libpython.a: ${PY_EMBED}
	cd "${PY_EMBED}"; ./compile.py

build/python/include/pyconfig.h: ${PYLIB}/pyconfig.h
	@mkdir -p build/python/include
	cp "$<" build/python/include

build/python/include/%.h: ${CPython}/Include/%.h
	@mkdir -p build/python/include
	cp "$<" build/python/include

build/python/include: $(addprefix build/python/include/, $(notdir $(wildcard ${CPython}/Include/*.h))) build/python/include/pyconfig.h

build/python/libpython.a: ${PY_EMBED}/libpython.a
	mkdir -p build/python
	cp "$<" "$@"

build/python: build/python/libpython.a build/python/include

# TODO: check if compiling to .pyc improves performance
video-dl/python/pylib/lib: ${CPython}/Lib
	mkdir -p video-dl/python/pylib
	cp -Rf "$<" "$@"

video-dl/python/pylib/exec: ${PY_EMBED}/pylib/exec
	cp -Rf "$<" "$@"

video-dl/python/pylib/exec/exec/include/python2.7/pyconfig.h: ${PY_EMBED}/pylib/pyconfig.h
	cp -f "$<" "$@"

video-dl/python/pylib/pyconfig.h: ${PY_EMBED}/pylib/pyconfig.h
	cp -f "$<" "$@"

video-dl/python/pylib: video-dl/python/pylib/pyconfig.h video-dl/python/pylib/lib  video-dl/python/pylib/exec/exec/include/python2.7/pyconfig.h video-dl/python/pylib/exec

video-dl/python/modules: 
	mkdir -p "$@"
	cp -Rf "youtube-dl/youtube_dl" "$@"
	sed -i '' "s/from .update import update_self/# Do not import update code/" "video-dl/python/modules/youtube_dl/__init__.py"

video-dl/python: video-dl/python/pylib video-dl/python/modules

libpython: build/python

xcodefiles: video-dl/python

clean:
	rm -fR "${PY_EMBED}/build" "${PY_EMBED}/libpython.a" "video-dl/python/pylib"

.PHONY: video-dl/python/pylib/exec
