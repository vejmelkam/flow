

all: build


BEAMFILES = ebin/fmon.beam \
            ebin/task-exec.beam \
            ebin/tasks-fsys.beam \
            ebin/flow-utils.beam

build:
	rm -f ebin/*.beam
	cd src && joxa -o ../ebin -c *.jxa