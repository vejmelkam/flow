
all: compile build-test


BEAMFILES = ebin/flow-utils.beam \
	    ebin/file-mon.beam \
	    ebin/flow-log.beam \
            ebin/tasks-fsys.beam \
	    ebin/task-exec.beam \
	    ebin/petri-net.beam \
	    ebin/pnml-parser.beam


ebin/%.beam: src/%.jxa
	joxa -p ebin -o ebin -c $<

compile: $(BEAMFILES)


ebin/task-exec-tester.beam: test/task-exec-tester.jxa
	joxa -p ebin -o ebin -c test/task-exec-tester.jxa

build-test: ebin/task-exec-tester.beam


clean:
	rm -f ebin/*.beam