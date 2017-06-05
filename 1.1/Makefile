INP_DIR = tests
OUT_DIR = outputs
TESTS = $(shell find ${INP_DIR}/ -name .svn -prune \
            -o -name \*.result.canon -prune \
            -o -name runtests -prune -o -type f -print)
OUTPUTS = ${TESTS:${INP_DIR}/%=${OUT_DIR}/%.out}

all: ${OUTPUTS}

${OUT_DIR}/%.out: ${INP_DIR}/%
	-cifparse $< > $@
