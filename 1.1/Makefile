INP_DIR = tests
OUT_DIR = outputs

TESTS = $(shell find ${INP_DIR}/ -name .svn -prune \
            -o -name \*.result.canon -prune \
            -o -name runtests -prune -o -type f -print)
OUTPUTS = $(sort ${TESTS:${INP_DIR}/%=${OUT_DIR}/%.out})

TABLE = ${OUT_DIR}/table.tex

all: ${TABLE}

${OUT_DIR}/%.out: ${INP_DIR}/%
	for PARSER in $$(ls -1 drivers/* | sort); \
    do \
        echo $$(basename $${PARSER}) $$($${PARSER} $<) >> $@; \
    done

cleanAll distclean:
	rm -f ${OUTPUTS}

${TABLE}: ${OUTPUTS}
	for OUTPUT in $+; \
	do \
		( \
			echo $${OUTPUT}; \
			perl -ne 'my @a = split /\s/; print " & ", $$a[1]' $${OUTPUT}; \
			echo \\\\\\\\ \
		) \
	done > $@
