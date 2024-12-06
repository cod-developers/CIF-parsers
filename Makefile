CONTAINER = ./container.sif
VERSIONS  = versions.tab

.PHONY: all build container test tests

all: tests $(VERSIONS)

build container: $(CONTAINER)

test tests: $(CONTAINER)
	LC_ALL=C $(CONTAINER) $(MAKE) -C 1.1
	LC_ALL=C $(CONTAINER) $(MAKE) -C 2.0

$(CONTAINER): $(CONTAINER:%.sif=%.def)
	apptainer build $@ $<

$(VERSIONS):
	LC_ALL=C $(CONTAINER) scripts/versions > $@

.PHONY: clean

clean:
	$(MAKE) -C 1.1 distclean
	$(MAKE) -C 2.0 distclean
