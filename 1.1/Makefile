INP_DIR = tests
OUT_DIR = outputs

TESTS = $(shell find ${INP_DIR}/ -name .svn -prune \
            -o -name \*.result.canon -prune \
            -o -name runtests -prune \
            -o -name \*.tsv -prune \
            -o -name \*.md -prune \
            -o -type f -print)
OUTPUTS = $(sort ${TESTS:${INP_DIR}/%=${OUT_DIR}/%.out})

TABLE_TEX  = ${OUT_DIR}/table.tex
TABLE_HTML = ${OUT_DIR}/table.html
TABLE_MD   = ${OUT_DIR}/table.md

BENCHMARK_OUT = ${OUT_DIR}/benchmark.out

all table: ${TABLE_TEX} ${TABLE_HTML} ${TABLE_MD}

benchmark: ${BENCHMARK_OUT}

${OUT_DIR}/%.out: ${INP_DIR}/%
	for PARSER in $$(ls -1 drivers/* | sort); \
    do \
        echo $$(basename $${PARSER}) $$($${PARSER} $<) >> $@; \
    done

${BENCHMARK_OUT}:
	../scripts/benchmark > $@

cleanAll distclean:
	rm -f ${OUTPUTS} ${TABLE_TEX} ${TABLE_HTML}

${TABLE_TEX}: ${OUTPUTS}
	for OUTPUT in $+; \
	do \
		( \
			echo -n $${OUTPUT} \
			| sed 's/outputs\///; s/_/\\_/g; s/\.out$$/ \& /'; \
			grep -P "^$$(basename $${OUTPUT} .out)\t" \
				tests/$$(echo $${OUTPUT} | cut -d / -f 2)/descriptions.tsv \
			| cut -f 2 | sed 's/1//; s/0/\$$\\\\times\$$/' | xargs echo -n; \
			perl -lpe 's/WARNING/\//g; s/ERROR/\$$\\times\$$/g;' $${OUTPUT} | \
			perl -ne 'my @a = split /\s/; print " & ", $$a[1]'; \
			echo \\\\\\\\ \
		) \
	done > $@

${TABLE_HTML}: ${OUTPUTS}
	echo '<html><head></head><body><table border="1"><tr><td></td><td>' > $@
	perl -e '$$, = "</td><td>"; print @ARGV' $$(ls -1 drivers/* | xargs -n1 basename | sort) >> $@
	echo '</td></tr>' >> $@
	for OUTPUT in $+; \
	do \
		( \
			echo '<tr><td>' $${OUTPUT}; \
			perl -lpe 's/([WE])\w+/$$1/g; ' $${OUTPUT} | \
			perl -ne 'my @a = split /\s/; print "</td><td>", $$a[1]'; \
			echo '</td></tr>' \
		) \
	done >> $@
	echo '</table></html>' >> $@

${TABLE_MD}: ${OUTPUTS}
	echo '<table border="1"><tr><td></td><td>' > $@
	perl -e '$$, = "</td><td>"; print @ARGV' $$(ls -1 drivers/* | xargs -n1 basename | sort) >> $@
	echo '</td></tr>' >> $@
	for OUTPUT in $+; \
	do \
		( \
			echo '<tr><td>' $${OUTPUT}; \
			perl -lpe 's/([WE])\w+/$$1/g; ' $${OUTPUT} | \
			perl -ne 'my @a = split /\s/; print "</td><td>", $$a[1]'; \
			echo '</td></tr>' \
		) \
	done >> $@
	echo '</table>' >> $@
