CONTAINER = ./container.sif

.PHONY: all build container test tests

all: tests

build container: $(CONTAINER)

test tests: $(CONTAINER)
	$(CONTAINER) $(MAKE) -C 1.1
	$(CONTAINER) $(MAKE) -C 2.0

$(CONTAINER): $(CONTAINER:%.sif=%.def)
	apptainer build $@ $<

.PHONY: clean

clean:
	$(MAKE) -C 1.1 distclean
	$(MAKE) -C 2.0 distclean
