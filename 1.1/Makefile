INP_DIR = tests
OUT_DIR = outputs

TESTS = $(shell find ${INP_DIR}/ -name .svn -prune \
            -o -name \*.result.canon -prune \
            -o -name runtests -prune -o -type f -print)
OUTPUTS = $(sort ${TESTS:${INP_DIR}/%=${OUT_DIR}/%.out})

TABLE_TEX  = ${OUT_DIR}/table.tex
TABLE_HTML = ${OUT_DIR}/table.html

all table: ${TABLE_TEX} ${TABLE_HTML}

${OUT_DIR}/%.out: ${INP_DIR}/%
	for PARSER in $$(ls -1 drivers/* | sort); \
    do \
        echo $$(basename $${PARSER}) $$($${PARSER} $<) >> $@; \
    done

cleanAll distclean:
	rm -f ${OUTPUTS} ${TABLE_TEX} ${TABLE_HTML}

${TABLE_TEX}: ${OUTPUTS}
	for OUTPUT in $+; \
	do \
		( \
			echo $${OUTPUT}; \
			perl -ne 'my @a = split /\s/; print " & ", $$a[1]' $${OUTPUT}; \
			echo \\\\\\\\ \
		) \
	done > $@

${TABLE_HTML}: ${OUTPUTS}
	echo '<html><head></head><body><table border="1"><tr><td></td><td>' >> $@
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
